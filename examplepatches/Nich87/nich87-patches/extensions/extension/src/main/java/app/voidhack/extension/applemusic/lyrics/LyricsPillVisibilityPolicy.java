package app.voidhack.extension.applemusic.lyrics;

final class LyricsPillVisibilityPolicy {
    static final int VISIBLE = 0;
    static final int INVISIBLE = 4;
    static final int GONE = 8;
    static final float ALPHA_THRESHOLD = 0.05f;
    static final float RESTORE_ALPHA_THRESHOLD = 0.99f;

    static final class Decision {
        final int visibility;
        final float alpha;

        Decision(int visibility, float alpha) {
            this.visibility = visibility;
            this.alpha = alpha;
        }
    }

    private LyricsPillVisibilityPolicy() {}

    static Decision resolveForRefresh(
            boolean hasControlsView,
            int controlsVisibility,
            float controlsAlpha,
            int targetControlsVisibility,
            int currentPillVisibility,
            float currentPillAlpha) {
        if (!hasControlsView) {
            if (targetControlsVisibility != VISIBLE) {
                return new Decision(INVISIBLE, 0.0f);
            }
            return new Decision(VISIBLE, 1.0f);
        }
        float clampedControlsAlpha = clampAlpha(controlsAlpha);
        if (controlsVisibility != VISIBLE) {
            return new Decision(INVISIBLE, 0.0f);
        }
        if (targetControlsVisibility != VISIBLE) {
            if (clampedControlsAlpha <= ALPHA_THRESHOLD) {
                return new Decision(INVISIBLE, 0.0f);
            }
            if (currentPillVisibility == VISIBLE) {
                return new Decision(VISIBLE, Math.min(clampAlpha(currentPillAlpha), clampedControlsAlpha));
            }
            return new Decision(INVISIBLE, 0.0f);
        }
        return new Decision(VISIBLE, clampedControlsAlpha);
    }

    static boolean shouldRestoreControls(
            boolean hasControlsView,
            int controlsVisibility,
            float controlsAlpha,
            int targetControlsVisibility) {
        if (!hasControlsView) {
            return targetControlsVisibility != VISIBLE;
        }
        return controlsVisibility != VISIBLE
                || controlsAlpha < RESTORE_ALPHA_THRESHOLD
                || targetControlsVisibility != VISIBLE;
    }

    private static float clampAlpha(float alpha) {
        if (Float.isNaN(alpha) || alpha <= 0.0f) return 0.0f;
        if (alpha >= 1.0f) return 1.0f;
        return alpha;
    }
}
