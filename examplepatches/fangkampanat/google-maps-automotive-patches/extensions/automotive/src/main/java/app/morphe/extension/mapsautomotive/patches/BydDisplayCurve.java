package app.morphe.extension.mapsautomotive.patches;

import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Maps' battery percentages with this car's curve. Maps builds every battery level it shows, the car's own and each
 * destination's arrival, from an energy and a capacity: real percentage = energy × 100 / capacity, shown as its whole
 * part (DisplayCurveHooks.kt). That is a straight line through 0. BYD's BMS holds more energy in each percent above
 * 90% (the Dolphin: 0.60 kWh against 0.495 below, BydSpeedBands' whole percents), so with the capacity sent at 100% a
 * trip from full showed an arrival about 3 points low until the car was below 90%.
 * <p>
 * The curve applies while the battery is above 90%, to the levels at or below its energy (arrivals): from the reading
 * Maps has now (the dashboard's percent with BydSocFraction's place inside it, so the car's own level keeps it exactly)
 * each percent down to 90% holds the energy measured there; below, the line through 0 and that 90% point. Maps keeps its
 * own values at 90% or below (as in earlier builds) and for levels above the current energy, such as a charging stop's
 * departure, where Maps' full battery is the capacity sent. Without {@link #MIN_HIGH_LEVELS} measured percents above
 * 90%, or with a measured energy per percent far from the average, Maps keeps its own values everywhere.
 * <p>
 * Plain Java (the JVM probe runs it). The injection points run on Maps' threads for every level: one volatile read and
 * a few operations, and they never throw.
 */
public final class BydDisplayCurve {
    /** Above this dashboard percentage each percent holds the energy measured there (BydSpeedBands.HIGH_SOC). */
    static final int KNEE = 90;
    /** Whole percents above the knee measured before the curve applies. */
    static final int MIN_HIGH_LEVELS = 5;
    /** The energy per percent above the knee, as a multiple of the anchor's average per percent, within these. */
    static final double MIN_HIGH_RATIO = 0.8, MAX_HIGH_RATIO = 2.0;
    /** A level whose capacity is further than this share from the anchor's is not this car's: Maps' value stays. */
    static final double CAPACITY_SLACK = 0.05;

    /** The reading Maps has now and the energy per percent above the knee. Immutable. */
    static final class Anchor {
        final int energyWh, capacityWh;
        final double percent, highWhPerPercent, kneeWh;

        Anchor(int energyWh, int capacityWh, double highWhPerPercent) {
            this.energyWh = energyWh;
            this.capacityWh = capacityWh;
            this.highWhPerPercent = highWhPerPercent;
            percent = energyWh * 100.0 / capacityWh;
            // Meaningful above the knee only (percent() leaves an anchor at 90% or below to Maps).
            kneeWh = percent <= KNEE ? energyWh : energyWh - (percent - KNEE) * highWhPerPercent;
        }
    }

    private static volatile Anchor anchor;
    private static volatile String state = "no_reading";
    private static final AtomicLong levels = new AtomicLong(), changed = new AtomicLong();

    private BydDisplayCurve() {
    }

    /**
     * Each reading Maps gets: its energy and capacity, and the whole percents measured above the knee (their count and
     * mean energy). Sets the anchor, or none (Maps' own values) when the measured percents do not qualify.
     */
    static void set(int energyWh, int capacityWh, long highLevels, double highWhPerPercent) {
        anchor = anchorFor(energyWh, capacityWh, highLevels, highWhPerPercent);
        state = describe(anchor, highLevels, highWhPerPercent);
    }

    /** No reading for Maps (withdrawn or BYD battery not started): Maps' own values. */
    static void clear() {
        anchor = null;
        state = "no_reading";
    }

    /** Injection point: the display percentage Maps will show (its whole part, at most 100). */
    public static int display(int energyWh, int capacityWh, double real, double raw, int display) {
        try {
            levels.incrementAndGet();
            double percent = percent(anchor, energyWh, capacityWh);
            if (Double.isNaN(percent)) return display;
            int shown = Math.min((int) Math.floor(percent), 100);
            if (shown != display) changed.incrementAndGet();
            return shown;
        } catch (Throwable error) {
            return display;
        }
    }

    /** Injection point: the raw display percentage (before the whole part), as {@link #display}. */
    public static double rawDisplay(int energyWh, int capacityWh, double real, double raw) {
        try {
            double percent = percent(anchor, energyWh, capacityWh);
            return Double.isNaN(percent) ? raw : percent;
        } catch (Throwable error) {
            return raw;
        }
    }

    /**
     * The whole percent Maps shows now for a level of this energy, such as an arrival: the curve's where it applies, else
     * Maps' own energy × 100 / capacity, as {@link #display} gives it. -1 without a positive energy and capacity. The
     * dialog and the report keep it, so they print the percentage Maps showed.
     */
    static int shown(int energyWh, int capacityWh) {
        if (energyWh <= 0 || capacityWh <= 0) return -1;
        double percent = percent(anchor, energyWh, capacityWh);
        if (Double.isNaN(percent)) percent = energyWh * 100.0 / capacityWh;
        return Math.min((int) Math.floor(percent), 100);
    }

    static Anchor anchorFor(int energyWh, int capacityWh, long highLevels, double highWhPerPercent) {
        if (energyWh <= 0 || capacityWh <= 0 || energyWh > capacityWh) return null;
        if (highLevels < MIN_HIGH_LEVELS || !(highWhPerPercent > 0)) return null;
        double ratio = highWhPerPercent / (capacityWh / 100.0);
        if (!(ratio >= MIN_HIGH_RATIO && ratio <= MAX_HIGH_RATIO)) return null;
        Anchor a = new Anchor(energyWh, capacityWh, highWhPerPercent);
        return a.kneeWh > 0 ? a : null;
    }

    /** The percentage for {@code energyWh} on the anchor's curve, NaN where Maps' own value stays. */
    static double percent(Anchor a, int energyWh, int capacityWh) {
        if (a == null || a.percent <= KNEE || energyWh <= 0 || energyWh > a.energyWh) return Double.NaN;
        if (capacityWh <= 0 || Math.abs(capacityWh - a.capacityWh) > a.capacityWh * CAPACITY_SLACK) return Double.NaN;
        // From the anchor itself, so its own level comes back exactly (a full battery stays 100, not 99.99...).
        if (energyWh >= a.kneeWh) return a.percent - (a.energyWh - energyWh) / a.highWhPerPercent;
        return energyWh * KNEE / a.kneeWh;
    }

    private static String describe(Anchor a, long highLevels, double highWhPerPercent) {
        String measured = String.format(Locale.ROOT, "high_levels=%d;high_wh_per_percent=%s", highLevels,
                highWhPerPercent > 0 ? String.valueOf(Math.round(highWhPerPercent)) : "none");
        if (a == null) return "linear;" + measured;
        return String.format(Locale.ROOT, "curve;%s;anchor_percent=%.2f;knee_wh=%.0f", measured, a.percent, a.kneeWh);
    }

    /** For the report: the curve's state, the levels Maps built and how many of them showed another whole percent. */
    static String status() {
        return state + ";levels=" + levels.get() + ";changed=" + changed.get();
    }
}
