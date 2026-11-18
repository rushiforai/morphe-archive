package io.github.sabopura.morphe.extension.twitch.ui;

/** CSS timing functions. Control y values may leave 0..1, as the overshooting curves in the sources do. */
final class Ease {
    /** {@code cubic-bezier(.22, 1, .36, 1)}, the sources' OUT curve. */
    static final float[] OUT = {.22f, 1f, .36f, 1f};
    /** {@code ease}. */
    static final float[] EASE = {.25f, .1f, .25f, 1f};

    private Ease() {
    }

    static float bezier(float[] curve, float t) {
        return bezier(curve[0], curve[1], curve[2], curve[3], t);
    }

    static float bezier(float x1, float y1, float x2, float y2, float t) {
        if (t <= 0) return 0;
        if (t >= 1) return 1;
        float low = 0, high = 1, u = t;
        for (int i = 0; i < 24; i++) {
            float x = curve(x1, x2, u);
            if (Math.abs(x - t) < 1e-4f) break;
            if (x < t) low = u;
            else high = u;
            u = (low + high) / 2;
        }
        return curve(y1, y2, u);
    }

    private static float curve(float a, float b, float u) {
        float v = 1 - u;
        return 3 * v * v * u * a + 3 * v * u * u * b + u * u * u;
    }

    static float quartOut(float t) {
        float rest = 1 - Math.max(0, Math.min(1, t));
        return 1 - rest * rest * rest * rest;
    }
}
