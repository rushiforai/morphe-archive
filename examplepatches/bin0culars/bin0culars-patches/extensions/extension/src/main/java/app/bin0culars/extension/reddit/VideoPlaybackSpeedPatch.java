package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class VideoPlaybackSpeedPatch {

    private static Class<?> variantClass;

    private VideoPlaybackSpeedPatch() {}

    public static Object variant(Object original) {
        try {
            if (!BinocularsMods.isEnabled("video_playback_speed")) {
                return original;
            }
            if (variantClass == null) {
                variantClass = Class.forName("com.reddit.features.VideoPlaybackSpeedVariant");
            }
            String choice = BinocularsMods.getChoice("video_playback_speed_controls");
            String variantName = "menu".equals(choice) ? "OVERFLOW_MENU" : "COMBINED_WITH_LOCK";
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object variant = Enum.valueOf((Class<Enum>) variantClass, variantName);
            return variant;
        } catch (Throwable ignored) {
            return original;
        }
    }
}
