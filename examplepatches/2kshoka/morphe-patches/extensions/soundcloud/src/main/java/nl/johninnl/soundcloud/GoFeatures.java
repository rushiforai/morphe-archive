package nl.johninnl.soundcloud;

/** V4n1X's three local flag overrides; other feature values are unchanged. */
public final class GoFeatures {
    public static boolean enabled(String name, boolean original) {
        return original || "offline_sync".equals(name) || "no_audio_ads".equals(name) || "hq_audio".equals(name);
    }
    private GoFeatures() {}
}
