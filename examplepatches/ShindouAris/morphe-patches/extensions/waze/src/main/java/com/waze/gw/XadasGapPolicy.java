package com.waze.gw;

/**
 * Pure rules for the xADAS distance widget: when it shows, which safe-distance mark it draws and
 * when it counts as a "too close" warning. No Android types, so it is unit tested on a plain JVM.
 */
final class XadasGapPolicy {
    // xadas_gap_mode
    static final int MODE_ALWAYS = 0;
    static final int MODE_FREEWAY = 1;
    // xadas_sound
    static final int SOUND_SIGNAL = 0;
    static final int SOUND_VOICE = 1;
    static final int SOUND_OFF = 2;
    // xadas_effect
    static final int EFFECT_STRONG = 0;
    static final int EFFECT_LIGHT = 1;
    static final int EFFECT_OFF = 2;

    /** The minimum-gap table for expressways applies from this speed; below it the rule is not used. */
    static final int RULE_MIN_KMH = 60;

    /** Everything a surface needs to draw one frame of the widget. Immutable. */
    static final class State {
        static final State HIDDEN = new State(false, -1, 0, -1f, false);

        final boolean visible;
        final int metres;
        /** Safe gap for the current speed, or 0 when the rule does not apply (no mark, no warning). */
        final int safeMetres;
        /** Time gap in seconds, or -1 when the speed is too low to mean anything. */
        final float headwaySeconds;
        /** xADAS says too close AND the rule applies: drives pulse, edge effect and sound. */
        final boolean alert;

        State(boolean visible, int metres, int safeMetres, float headwaySeconds, boolean alert) {
            this.visible = visible;
            this.metres = metres;
            this.safeMetres = safeMetres;
            this.headwaySeconds = headwaySeconds;
            this.alert = alert;
        }

        /** Share of the ring that is filled; the safe mark sits at the half-way point. */
        float fraction() {
            float scale = safeMetres > 0 ? safeMetres * 2f : 100f;
            return Math.max(0f, Math.min(1f, metres / scale));
        }

        @Override public boolean equals(Object other) {
            if (!(other instanceof State)) return false;
            State s = (State) other;
            return visible == s.visible && metres == s.metres && safeMetres == s.safeMetres
                    && alert == s.alert && Math.round(headwaySeconds * 10f) == Math.round(s.headwaySeconds * 10f);
        }

        @Override public int hashCode() {
            return (visible ? 1 : 0) + 31 * metres + 961 * safeMetres + (alert ? 29791 : 0);
        }
    }

    private XadasGapPolicy() { }

    /** Minimum gap on an expressway, in metres; 0 below 60 km/h where the table is not applied. */
    static int safeMetres(int kmh) {
        if (kmh < RULE_MIN_KMH) return 0;
        if (kmh <= 60) return 35;
        if (kmh <= 80) return 55;
        if (kmh <= 100) return 70;
        return 100;
    }

    /**
     * @param metres        measured gap, or -1 when xADAS has no fresh measurement
     * @param tooClose      xADAS's own verdict
     * @param kmh           own speed in km/h, or -1 when unknown
     * @param freeway       whether the car is on an expressway
     * @param mode          MODE_ALWAYS or MODE_FREEWAY
     */
    static State compute(int metres, boolean tooClose, int kmh, boolean freeway, int mode) {
        if (metres < 0) return State.HIDDEN;
        boolean ruleApplies = kmh >= RULE_MIN_KMH;
        // Below 60 km/h the widget only appears in "always" mode, and then only as a number.
        boolean visible = mode == MODE_ALWAYS || (freeway && ruleApplies);
        if (!visible) return State.HIDDEN;
        float headway = kmh >= 5 ? metres / (kmh / 3.6f) : -1f;
        boolean alert = tooClose && ruleApplies && (mode == MODE_ALWAYS || freeway);
        return new State(true, metres, ruleApplies ? safeMetres(kmh) : 0, headway, alert);
    }
}
