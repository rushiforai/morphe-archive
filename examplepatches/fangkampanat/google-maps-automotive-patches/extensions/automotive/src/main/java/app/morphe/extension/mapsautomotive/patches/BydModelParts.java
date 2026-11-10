package app.morphe.extension.mapsautomotive.patches;

import java.util.Arrays;
import java.util.Locale;

/**
 * The seam between a BYD table's physics ({@link BydVehicleEnergyFile.Predictor}), the values measured on the car
 * ({@link BydCalibration}) and the model Maps receives ({@link BydVehicleEnergyFile#encodeLearned}). Plain Java without
 * Android APIs, so the JVM probes and the PC replay run it.
 * <p>
 * One 10 s interval's battery energy at the table's own values is split into parts ({@link Parts}), for the PC replay's
 * learner (not shipped). With every scale 1 and the table's auxiliary energy the parts add up to the
 * table's prediction:
 * {@code rollingWh + dragWh + otherWheelWh + driveLossWh + regenLossWh + capWh + batteryLossWh + tableAuxWh == totalWh}.
 * The values Maps receives ({@link Params}, {@link Sent}) replace the scales and the auxiliary power.
 */
final class BydModelParts {
    /** Knots of the learned auxiliary power, °C: linear between them, the end values outside. */
    static final int[] AUX_KNOTS_C = {20, 24, 28, 32, 36};
    /** The start profile: extra power that falls linearly to 0 this long after a drive starts. */
    static final double START_S = 900;
    /** Minutes parked before a drive at which the start profile is full (linear from 0). */
    static final double FULL_SOAK_MIN = 60;
    /** Drain at time that Maps receives: a point every this many seconds up to {@link #START_S}. */
    static final int DRAIN_STEP_S = 60;

    private BydModelParts() {
    }

    /**
     * One interval's battery energy at the table's own values, Wh (negative: into the battery), split by what the
     * learner scales. Wheel power is road load A + B·v + C·v² at the mean speed times that speed, plus the change of
     * kinetic energy; the drivetrain loss is the table's at (speed, wheel power); regeneration is capped by the table's
     * max regen power; the battery losses are the table's at the pack power.
     */
    static final class Parts {
        /** A·v·t (rolling resistance). */
        double rollingWh;
        /** C·v³·t (drag). */
        double dragWh;
        /** B·v²·t plus the change of kinetic energy; not scaled. */
        double otherWheelWh;
        /** The drivetrain loss where the wheel power is 0 or more. */
        double driveLossWh;
        /** The drivetrain loss where the wheel power is negative (less energy recovered). */
        double regenLossWh;
        /** The regeneration cap: capped motor energy less uncapped, 0 or more; not scaled. */
        double capWh;
        /** The table's battery losses at the pack power; not scaled. */
        double batteryLossWh;
        /** The table's auxiliary energy for the interval (drain at time, then at temperature, as the Predictor). */
        double tableAuxWh;
        /** The table's whole prediction, {@link BydVehicleEnergyFile.Predictor#intervalWh} for the same interval. */
        double totalWh;
        /** The interval's length, s. */
        double seconds;

        /** The parts' energy with learned scales and an auxiliary power in W for the interval. */
        double withScales(double rolling, double drag, double driveLoss, double regenLoss, double auxWatts) {
            return rolling * rollingWh + drag * dragWh + otherWheelWh + driveLoss * driveLossWh + regenLoss * regenLossWh
                    + capWh + batteryLossWh + auxWatts * seconds / 3600.0;
        }
    }

    /** A table's physics for the calibration's prior and the PC replay; {@link BydVehicleEnergyFile.Predictor} implements it. */
    interface Base {
        /** One interval, as {@link BydVehicleEnergyFile.Predictor#intervalWh} takes it. */
        Parts parts(double fromKmh, double toKmh, double seconds, double massKg, double sinceStartS, int outsideC,
                    int energyWh, int capacityWh);

        /** The table's drain at temperature (total, W) at a temperature, linear between its entries; NaN without any. */
        double tableDrainAtTemperature(double tempC);

        /** The table's auxiliary power (W) {@code atS} after a drive starts, as the Predictor uses it. */
        double tableAuxWatts(double atS, int outsideC);

        /** Identifies the table's prediction parts (the file's predictionSha256). */
        String identity();
    }

    /** Learned values. Immutable. {@link #table} gives scales of 1 and the table's drain at temperature. */
    static final class Params {
        /** Scales of the table's rolling resistance, drag, drivetrain loss at wheel power ≥ 0 and below 0. */
        final double rolling, drag, driveLoss, regenLoss;
        /** Steady auxiliary power (W) at {@link #AUX_KNOTS_C} with the A/C on or its state unknown. */
        private final double[] auxW;
        /** Whether a knot was learned from data (else it holds its starting value). */
        private final boolean[] auxLearned;
        /** Steady auxiliary power (W) with the A/C known to be off; NaN when not learned (the knots are used). */
        final double auxOffW;
        /** Extra power at the start of a drive after a full soak, W ({@link #startWatts}). */
        final double startW;

        Params(double rolling, double drag, double driveLoss, double regenLoss, double[] auxW, boolean[] auxLearned,
               double auxOffW, double startW) {
            if (auxW.length != AUX_KNOTS_C.length || auxLearned.length != AUX_KNOTS_C.length) {
                throw new IllegalArgumentException("aux knots");
            }
            this.rolling = rolling;
            this.drag = drag;
            this.driveLoss = driveLoss;
            this.regenLoss = regenLoss;
            this.auxW = auxW.clone();
            this.auxLearned = auxLearned.clone();
            this.auxOffW = auxOffW;
            this.startW = startW;
        }

        /** Scales 1, the table's drain at temperature at each knot (its aux after an hour where it has none), no start profile. */
        static Params table(Base base) {
            double[] aux = new double[AUX_KNOTS_C.length];
            for (int i = 0; i < aux.length; i++) aux[i] = tableKnotWatts(base, AUX_KNOTS_C[i]);
            return new Params(1, 1, 1, 1, aux, new boolean[AUX_KNOTS_C.length], Double.NaN, 0);
        }

        /** The table's steady auxiliary power at a knot: its drain at temperature, else its aux an hour after the start. */
        static double tableKnotWatts(Base base, int tempC) {
            double drain = base.tableDrainAtTemperature(tempC);
            return Double.isNaN(drain) ? base.tableAuxWatts(3600, tempC) : drain;
        }

        double auxKnot(int index) {
            return auxW[index];
        }

        boolean auxLearned(int index) {
            return auxLearned[index];
        }

        /** The lowest and highest learned knot temperatures; null when none is learned. */
        int[] learnedRange() {
            int low = -1, high = -1;
            for (int i = 0; i < auxLearned.length; i++) {
                if (!auxLearned[i]) continue;
                if (low < 0) low = i;
                high = i;
            }
            return low < 0 ? null : new int[]{AUX_KNOTS_C[low], AUX_KNOTS_C[high]};
        }

        /** Steady auxiliary power (W) at a temperature: linear between knots, the end values outside; A/C off when known and learned. */
        double auxWatts(double tempC, Boolean acOn) {
            if (Boolean.FALSE.equals(acOn) && !Double.isNaN(auxOffW)) return auxOffW;
            return interpolate(tempC, auxW);
        }

        /** The start profile's extra power (W) {@code sinceStartS} into a drive that followed {@code parkedMin} parked. */
        double startWatts(double sinceStartS, double parkedMin) {
            return startW * soak(parkedMin) * ramp(sinceStartS);
        }

        /**
         * Drain at time for Maps: {seconds, watts} every {@link #DRAIN_STEP_S} from 0 to {@link #START_S}, the steady power
         * at this temperature plus the start profile from {@code driveS} into the current drive (0 when parked: a drive
         * starting now after {@code parkedMin}). The last point is the steady power, so it meets the drain at temperature.
         */
        int[][] drainAtTime(double tempC, Boolean acOn, double driveS, double parkedMin) {
            int count = (int) (START_S / DRAIN_STEP_S) + 1;
            int[][] points = {new int[count], new int[count]};
            double steady = auxWatts(tempC, acOn);
            for (int i = 0; i < count; i++) {
                int at = i * DRAIN_STEP_S;
                double extra = i == count - 1 ? 0 : startWatts(driveS + at, parkedMin);
                points[0][i] = at;
                points[1][i] = (int) Math.round(Math.max(0, steady + extra));
            }
            return points;
        }

        /** For logs and the report: "r1.000/d1.000/l1.000/g1.000/aux=1200,1300*,…/off=nan/start=0" (* learned). */
        String describe() {
            StringBuilder aux = new StringBuilder();
            for (int i = 0; i < auxW.length; i++) {
                if (i > 0) aux.append(',');
                aux.append(Math.round(auxW[i])).append(auxLearned[i] ? "*" : "");
            }
            return String.format(Locale.ROOT, "r%.3f/d%.3f/l%.3f/g%.3f/aux=%s/off=%s/start=%d", rolling, drag, driveLoss,
                    regenLoss, aux, Double.isNaN(auxOffW) ? "nan" : String.valueOf(Math.round(auxOffW)), Math.round(startW));
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof Params)) return false;
            Params p = (Params) other;
            return rolling == p.rolling && drag == p.drag && driveLoss == p.driveLoss && regenLoss == p.regenLoss
                    && Arrays.equals(auxW, p.auxW) && Arrays.equals(auxLearned, p.auxLearned)
                    && (Double.isNaN(auxOffW) ? Double.isNaN(p.auxOffW) : auxOffW == p.auxOffW) && startW == p.startW;
        }

        @Override
        public int hashCode() {
            return Arrays.hashCode(auxW) * 31 + Double.hashCode(rolling + 3 * drag + 5 * driveLoss + 7 * regenLoss + startW);
        }
    }

    /**
     * What Maps receives besides the vehicle info: scales of the table's road load and drivetrain losses, and the drain
     * at time and at temperature, each null for the table's own (as {@link BydVehicleEnergyFile#encode} sends it).
     */
    static final class Sent {
        /** Road load A, B and C multipliers. */
        final double rolling, linear, drag;
        /** Drivetrain losses_watts multipliers at power_watts ≥ 0 and below 0. */
        final double driveLoss, regenLoss;
        /** {seconds, watts} ascending, or null. */
        final int[][] drainAtTime;
        /** Drain at temperature: temperatures ascending and their totals (W), or null. */
        final float[] drainTemps;
        final int[] drainTotals;

        Sent(double rolling, double linear, double drag, double driveLoss, double regenLoss, int[][] drainAtTime,
             float[] drainTemps, int[] drainTotals) {
            if ((drainTemps == null) != (drainTotals == null) || drainTemps != null && drainTemps.length != drainTotals.length) {
                throw new IllegalArgumentException("drain at temperature");
            }
            this.rolling = rolling;
            this.linear = linear;
            this.drag = drag;
            this.driveLoss = driveLoss;
            this.regenLoss = regenLoss;
            this.drainAtTime = drainAtTime;
            this.drainTemps = drainTemps;
            this.drainTotals = drainTotals;
        }

        /** The table as {@link BydVehicleEnergyFile#encode} sends it, with road load and losses times {@code correction}. */
        static Sent table(double correction) {
            return new Sent(correction, correction, correction, correction, correction, null, null, null);
        }

        /**
         * The learned model with road load and losses times {@code correction}: drain at time from
         * {@link Params#drainAtTime}, drain at temperature at every knot ({@link Params#auxWatts} with the A/C state now,
         * so both drains agree at the current temperature); {@link BydVehicleEnergyFile#encodeLearned} keeps the table's
         * entries below the first knot and above the last.
         */
        static Sent learned(Params p, double correction, double tempC, Boolean acOn, double driveS, double parkedMin) {
            float[] temps = new float[AUX_KNOTS_C.length];
            int[] totals = new int[AUX_KNOTS_C.length];
            for (int i = 0; i < temps.length; i++) {
                temps[i] = AUX_KNOTS_C[i];
                totals[i] = (int) Math.round(Math.max(0, p.auxWatts(AUX_KNOTS_C[i], acOn)));
            }
            return new Sent(p.rolling * correction, correction, p.drag * correction, p.driveLoss * correction,
                    p.regenLoss * correction, p.drainAtTime(tempC, acOn, driveS, parkedMin), temps, totals);
        }

        /** True when this is the table unchanged (encode's output). */
        boolean isTable() {
            return rolling == 1 && linear == 1 && drag == 1 && driveLoss == 1 && regenLoss == 1 && drainAtTime == null
                    && drainTemps == null;
        }
    }

    static double ramp(double sinceStartS) {
        return sinceStartS >= START_S ? 0 : Math.max(0, 1 - Math.max(0, sinceStartS) / START_S);
    }

    static double soak(double parkedMin) {
        return Double.isNaN(parkedMin) ? 1 : Math.min(1, Math.max(0, parkedMin) / FULL_SOAK_MIN);
    }

    /** Knot weights of a temperature: linear between the two knots around it, the end knot outside. */
    static double[] knotWeights(double tempC) {
        double[] weights = new double[AUX_KNOTS_C.length];
        int last = AUX_KNOTS_C.length - 1;
        if (tempC <= AUX_KNOTS_C[0]) {
            weights[0] = 1;
        } else if (tempC >= AUX_KNOTS_C[last]) {
            weights[last] = 1;
        } else {
            for (int i = 1; i <= last; i++) {
                if (tempC <= AUX_KNOTS_C[i]) {
                    double upper = (tempC - AUX_KNOTS_C[i - 1]) / (AUX_KNOTS_C[i] - AUX_KNOTS_C[i - 1]);
                    weights[i - 1] = 1 - upper;
                    weights[i] = upper;
                    break;
                }
            }
        }
        return weights;
    }

    private static double interpolate(double tempC, double[] values) {
        double[] weights = knotWeights(tempC);
        double sum = 0;
        for (int i = 0; i < values.length; i++) sum += weights[i] * values[i];
        return sum;
    }
}
