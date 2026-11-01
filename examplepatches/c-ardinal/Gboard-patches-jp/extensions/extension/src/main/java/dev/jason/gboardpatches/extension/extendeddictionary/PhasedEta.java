package dev.jason.gboardpatches.extension.extendeddictionary;

import android.content.SharedPreferences;

import java.util.ArrayDeque;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;

/**
 * Remaining time of a job made of phases with very different per-unit costs: the current phase
 * runs at its recently measured rate, later phases at the rate this device measured last time
 * (or a conservative default), each over the units it is expected to process.
 */
final class PhasedEta {
    /** Job phases; the default rate (units per second) is deliberately on the slow side. */
    enum Phase {
        PARSE(2_000_000d),
        REPAIR(30_000d),
        RECONCILE(30_000d),
        DEDUPE(50_000d),
        INSERT(10_000d),
        STORE_WRITE(30_000d),
        DELETE(30_000d);

        final double defaultRate;

        Phase(double defaultRate) {
            this.defaultRate = defaultRate;
        }

        /** Rates are kept per job kind too: reconciling for Remove costs more than for Import. */
        String preferenceKey(String jobKind) {
            return "eta_rate_" + jobKind + "_" + name().toLowerCase(java.util.Locale.ROOT);
        }
    }

    static final long WINDOW_NANOS = 2_000_000_000L;
    /** A fresh estimate this much above the shown one replaces it even within a phase. */
    static final double RISE_FACTOR = 1.5;

    private final List<Phase> plan;
    private final Map<Phase, Double> knownRates;
    private final Map<Phase, Long> expectedUnits = new EnumMap<>(Phase.class);
    private final Map<Phase, Double> measuredRates = new EnumMap<>(Phase.class);
    private final ArrayDeque<long[]> window = new ArrayDeque<>();
    private Phase current;
    private long phaseStartNanos;
    private int phaseStartDone;
    private int currentTotal;
    private long lastShown = Long.MAX_VALUE;
    private double[] weights;
    private double[] progress;
    private int furthest = -1;
    private double singleProgress;
    private boolean complete;

    PhasedEta(List<Phase> plan, Map<Phase, Double> knownRates) {
        this.plan = plan;
        this.knownRates = new EnumMap<>(Phase.class);
        this.knownRates.putAll(knownRates);
    }

    /** Rates persisted by an earlier job; missing or invalid ones are left out. */
    static Map<Phase, Double> loadRates(SharedPreferences preferences, String jobKind) {
        Map<Phase, Double> rates = new EnumMap<>(Phase.class);
        for (Phase phase : Phase.values()) {
            float rate = preferences.getFloat(phase.preferenceKey(jobKind), -1f);
            if (rate > 0) {
                rates.put(phase, (double) rate);
            }
        }
        return rates;
    }

    static void saveRates(SharedPreferences preferences, String jobKind,
            Map<Phase, Double> rates) {
        SharedPreferences.Editor editor = preferences.edit();
        rates.forEach((phase, rate) ->
                editor.putFloat(phase.preferenceKey(jobKind), rate.floatValue()));
        editor.apply();
    }

    /** How many units a phase is expected to process (updated as soon as it is known). */
    synchronized void expect(Phase phase, long units) {
        expectedUnits.put(phase, Math.max(0L, units));
    }

    synchronized void sample(Phase phase, long nowNanos, int done, int total) {
        int index = plan.indexOf(phase);
        if (index >= 0 && index < plan.indexOf(current)) {
            return; // a late post from a phase that is already over
        }
        recordWork(index, done, total);
        if (phase != current) {
            finishCurrent(nowNanos);
            current = phase;
            phaseStartNanos = nowNanos;
            phaseStartDone = done;
            window.clear();
            lastShown = Long.MAX_VALUE;
        }
        currentTotal = total;
        expectedUnits.put(phase, (long) total);
        window.addLast(new long[] {nowNanos, done});
        while (window.size() > 2 && nowNanos - window.peekFirst()[0] > WINDOW_NANOS) {
            window.removeFirst();
        }
        if (done >= total) {
            finishCurrent(nowNanos);
        }
    }

    /** Seconds left (at least 1), or -1 before the first sample. */
    synchronized long remainingSeconds(long nowNanos) {
        if (current == null) {
            return -1L;
        }
        long[] last = window.peekLast();
        double seconds = Math.max(0, currentTotal - last[1]) / currentRate();
        boolean later = false;
        for (Phase phase : plan) {
            if (later) {
                seconds += expectedUnits.getOrDefault(phase, 0L) / rateOf(phase);
            }
            later |= phase == current;
        }
        long shown = Math.max(1L, (long) Math.ceil(seconds));
        // Within one phase the estimate normally only moves down, so it converges instead of
        // jumping; a clearly higher estimate still wins so a slowing job is not pinned low.
        lastShown = lastShown != Long.MAX_VALUE && shown > lastShown * RISE_FACTOR
                ? shown : Math.min(lastShown, shown);
        return lastShown;
    }

    /**
     * Overall progress by WORK: Σ weight_i × (done_i / total_i), finished phases counting 1.
     * Monotone by construction (counts only grow, phases only finish) and exactly 1 at the end.
     */
    synchronized float workFraction() {
        if (complete) {
            return 1f;
        }
        if (weights == null) {
            return 0f;
        }
        int last = weights.length - 1;
        if ((plan.isEmpty() || furthest == last) && progress[last] >= 1d) {
            return 1f; // exact, not a floating-point sum that stops at 0.99999
        }
        double fraction = 0;
        for (int index = 0; index < weights.length; index++) {
            fraction += weights[index] * (index < furthest ? 1d : progress[index]);
        }
        return (float) Math.min(1d, fraction);
    }

    /** The job is done: progress is 100% whatever was reported. */
    synchronized void markComplete() {
        complete = true;
    }

    /** Normalised phase weights (estimated durations), fixed when the first sample arrives. */
    synchronized double[] weights() {
        return weights == null ? null : weights.clone();
    }

    private void recordWork(int index, int done, int total) {
        if (weights == null) {
            freezeWeights();
        }
        if (index < 0) {
            // Not part of the plan (single-phase callers): the phase itself is the whole job.
            singleProgress = Math.max(singleProgress, total <= 0 ? 1d : (double) done / total);
            if (plan.isEmpty()) {
                progress[0] = singleProgress;
            }
            return;
        }
        furthest = Math.max(furthest, index);
        progress[index] = Math.max(progress[index],
                total <= 0 ? 1d : Math.min(1d, (double) done / total));
    }

    /** Weights from the units known at job start: estimated duration = units / rate. */
    private void freezeWeights() {
        int phases = Math.max(1, plan.size());
        weights = new double[phases];
        progress = new double[phases];
        if (plan.isEmpty()) {
            weights[0] = 1d;
            return;
        }
        double sum = 0;
        for (int index = 0; index < plan.size(); index++) {
            Phase phase = plan.get(index);
            weights[index] = expectedUnits.getOrDefault(phase, 0L) / rateOf(phase);
            sum += weights[index];
        }
        for (int index = 0; index < plan.size(); index++) {
            weights[index] = sum > 0 ? weights[index] / sum : 1d / plan.size();
        }
    }

    /** Rates measured for phases that ran to completion, for the next job's estimate. */
    synchronized Map<Phase, Double> measuredRates() {
        return new EnumMap<>(measuredRates);
    }

    private double currentRate() {
        long[] first = window.peekFirst();
        long[] last = window.peekLast();
        long nanos = last[0] - first[0];
        long units = last[1] - first[1];
        return nanos > 0 && units > 0 ? units * 1_000_000_000d / nanos : rateOf(current);
    }

    private double rateOf(Phase phase) {
        Double measured = measuredRates.get(phase);
        if (measured != null) {
            return measured;
        }
        return knownRates.getOrDefault(phase, phase.defaultRate);
    }

    private void finishCurrent(long nowNanos) {
        if (current == null || measuredRates.containsKey(current) || window.isEmpty()) {
            return;
        }
        long nanos = nowNanos - phaseStartNanos;
        long units = window.peekLast()[1] - phaseStartDone;
        if (nanos > 0 && units > 0) {
            measuredRates.put(current, units * 1_000_000_000d / nanos);
        }
    }
}
