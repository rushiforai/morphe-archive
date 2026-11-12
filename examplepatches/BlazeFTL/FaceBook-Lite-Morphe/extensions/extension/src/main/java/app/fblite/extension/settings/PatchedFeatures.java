package app.fblite.extension.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Which of the video features were patched in. Each of their patches calls {@link #mark} at the start of
 * Application.attachBaseContext. A feature whose patch was not selected is off and has no switch in the Morphe settings
 * screen, whatever its saved value.
 */
public final class PatchedFeatures {
    private static final Set<String> MARKED = Collections.synchronizedSet(new HashSet<String>());
    private static final Set<String> GATED = new HashSet<>(Arrays.asList(
            MorpheSettings.VIDEO_DOWNLOAD,
            MorpheSettings.ASK_DOWNLOAD_QUALITY,
            MorpheSettings.AUTO_NEXT_REEL,
            MorpheSettings.SHORT_VIDEO_CONTROLS,
            MorpheSettings.DOUBLE_TAP_SEEK,
            MorpheSettings.PROFILE_WHEN_NO_REELS,
            MorpheSettings.PROFILE_ALWAYS));

    private PatchedFeatures() {
    }

    /** Called by the patches (by smali). */
    @SuppressWarnings("unused")
    public static void mark(String key) {
        MARKED.add(key);
    }

    /** True when the feature's patch is in this app, or the setting does not belong to a feature patch. */
    public static boolean allowed(String key) {
        return !GATED.contains(key) || MARKED.contains(key);
    }
}
