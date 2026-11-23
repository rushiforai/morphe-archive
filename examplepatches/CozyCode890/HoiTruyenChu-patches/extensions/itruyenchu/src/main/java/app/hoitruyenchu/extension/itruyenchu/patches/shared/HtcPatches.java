package app.hoitruyenchu.extension.itruyenchu.patches.shared;

/**
 * Which patches were applied, and the version of the patches. Every method returns false / a
 * placeholder here; the patch of the same name makes it return true (see the Kotlin
 * {@code enablePatchFlag}), so the settings screen only shows the patches that are in the app.
 */
@SuppressWarnings("unused")
public final class HtcPatches {
    private HtcPatches() {
    }

    public static boolean ttsReliability() {
        return false;
    }

    public static boolean backgroundReading() {
        return false;
    }

    public static boolean rememberSpeed() {
        return false;
    }

    public static boolean mediaControls() {
        return false;
    }

    public static boolean resumeListening() {
        return false;
    }

    public static boolean tapToSeek() {
        return false;
    }

    public static boolean chapterTitles() {
        return false;
    }

    public static boolean autoSync() {
        return false;
    }

    public static boolean googleLogin() {
        return false;
    }

    /** Version of the patches, e.g. "2.0.0" (set by the settings patch). */
    public static String version() {
        return "";
    }
}
