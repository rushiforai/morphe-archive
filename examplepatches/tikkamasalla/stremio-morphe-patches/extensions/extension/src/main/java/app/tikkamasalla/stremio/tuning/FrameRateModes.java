package app.tikkamasalla.stremio.tuning;

/**
 * Which display mode fits a video's frame rate. Pure Java (no Android): the same choice for every Stremio build.
 * A mode fits when its refresh rate is a whole multiple of the frame rate; 23.976 and 24 are different rates.
 */
public final class FrameRateModes {
    /**
     * The extra Mod settings switch: true = Stremio's own switch and its notice instead of ours. Same prefs file as
     * the mode. ModSettingsActivity holds the same literal.
     */
    static final String KEY_NOTICE = "playertune_fr_notice";
    static final int NONE = -1;

    /** Half the 0.1 % gap between 24 and 23.976, so the two never mix; covers modes reported as 23.98 too. */
    private static final float TOLERANCE = 0.0005f;
    /** Below this a TV mode is a film mode (24p) or a poor fallback (25p, 30p). */
    private static final float FULL_RATE_HZ = 47f;
    private static final float MIN_FPS = 10f;
    private static final float MAX_FPS = 240f;

    static final class Mode {
        final int id;
        final int width;
        final int height;
        final float hz;

        Mode(int id, int width, int height, float hz) {
            this.id = id;
            this.width = width;
            this.height = height;
            this.hz = hz;
        }
    }

    private FrameRateModes() {
    }

    /** No silent-switch hooks in this build. */
    static final int BUILD_NONE = 0;
    /** TV 1.6.12: PlayerFragment hooks; the matcher is silenced at the settings getter. */
    static final int BUILD_LEGACY = 1;
    /** TV 1.10.4: FrameRateMatcher hooks; silenced at the matcher, because this build skips its media probe
     * entirely when the strategy reads disabled. */
    static final int BUILD_110 = 2;
    /** TV 1.12.0: obfuscated matcher (bn2 in this build); same probe rule as 1.10.4. */
    static final int BUILD_112 = 3;

    private static Integer build;

    /**
     * True on a build whose player has the hooks of the silent switch (1.6.12, 1.10.4, 1.12.0). Other builds keep
     * Stremio's matcher. Looked up by name, once: the settings getter that needs this is read often.
     */
    public static boolean supported() {
        return build() != BUILD_NONE;
    }

    static boolean legacyBuild() {
        return build() == BUILD_LEGACY;
    }

    static int build() {
        Integer cached = build;
        if (cached != null) return cached;
        int found = BUILD_NONE;
        try {
            Class<?> fragment = Class.forName("com.stremio.tv.views.player.PlayerFragment", false,
                    FrameRateModes.class.getClassLoader());
            fragment.getDeclaredMethod("restoreDisplayMode");
            fragment.getDeclaredMethod("playbackFromState");
            found = BUILD_LEGACY;
        } catch (Throwable ignored) {
            // Not the 1.6.12 shape; the other builds are tried below.
        }
        if (found == BUILD_NONE) {
            try {
                ClassLoader loader = FrameRateModes.class.getClassLoader();
                Class<?> matcher = Class.forName("com.stremio.common.players.FrameRateMatcher", false, loader);
                matcher.getDeclaredMethod("adjustDisplayMode",
                        Class.forName("com.stremio.common.viewmodels.state.MediaInfo", false, loader));
                matcher.getDeclaredMethod("restoreDisplayMode");
                found = BUILD_110;
            } catch (Throwable ignored) {
                // Not the 1.10.4 shape.
            }
        }
        if (found == BUILD_NONE) {
            try {
                // 1.12.0 renames everything: the matcher is bn2 in the default package, built from
                // (Activity, Profile.Settings) with the supports check as method a(). A later build that
                // renames it again falls back to no silent switch, never to a broken start.
                ClassLoader loader = FrameRateModes.class.getClassLoader();
                Class<?> matcher = Class.forName("bn2", false, loader);
                if (matcher.getDeclaredMethod("a").getReturnType() == boolean.class) {
                    java.lang.reflect.Constructor<?>[] ctors = matcher.getDeclaredConstructors();
                    for (int i = 0; i < ctors.length; i++) {
                        Class<?>[] p = ctors[i].getParameterTypes();
                        if (p.length == 2 && "android.app.Activity".equals(p[0].getName())
                                && "com.stremio.core.types.profile.Profile$Settings".equals(p[1].getName())) {
                            found = BUILD_112;
                        }
                    }
                }
            } catch (Throwable ignored) {
                // Not the 1.12.0 shape.
            }
        }
        // The shape only says which build this looks like; the switch counts when the patch placed its hooks.
        int placed = landed();
        if (placed >= 0 && placed != found) found = BUILD_NONE;
        build = found;
        return found;
    }

    /**
     * The BUILD_* whose hooks the patch really placed, BUILD_NONE when none: the patch rewrites this body. The -1 here
     * only survives in an unpatched class (unit tests).
     */
    static int landed() {
        return -1;
    }

    static boolean usableFps(float fps) {
        return fps >= MIN_FPS && fps <= MAX_FPS;
    }

    static boolean isMultiple(float hz, float fps) {
        if (!usableFps(fps) || hz <= 0f) return false;
        int k = Math.round(hz / fps);
        return k >= 1 && Math.abs(hz - k * fps) <= TOLERANCE * hz;
    }

    /**
     * The mode to show this frame rate on: the current one when it already fits, else a mode of the same resolution.
     * Film (about 24 fps) takes its exact rate first. Everything else takes the lowest full rate first (25 on 50,
     * 29.97 on 59.94, 30 on 60) and falls back to 25p or 30p. NONE: unusable frame rate, or no mode fits.
     */
    static int pick(Mode[] modes, Mode current, float fps) {
        if (modes == null || current == null || !usableFps(fps)) return NONE;
        if (isMultiple(current.hz, fps)) return current.id;
        boolean film = fps >= 23.5f && fps <= 24.5f;
        Mode best = null;
        for (Mode mode : modes) {
            if (mode == null || mode.width != current.width || mode.height != current.height) continue;
            if (!isMultiple(mode.hz, fps)) continue;
            if (best == null || better(mode, best, film)) best = mode;
        }
        return best != null ? best.id : NONE;
    }

    private static boolean better(Mode a, Mode b, boolean film) {
        if (!film) {
            boolean aFull = a.hz >= FULL_RATE_HZ;
            boolean bFull = b.hz >= FULL_RATE_HZ;
            if (aFull != bFull) return aFull;
        }
        return a.hz < b.hz;
    }
}
