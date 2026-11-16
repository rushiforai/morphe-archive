package app.morphe.extension.youtube.patches.utils;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.VideoInformation;

@SuppressWarnings("unused")
public class AlwaysRepeatPatch extends Utils {

    /**
     * Injection point.
     *
     * @return video is repeated.
     */
    public static boolean alwaysRepeat(Enum<?> status) {
        return status != null && "ENDED".equals(status.name()) && alwaysRepeat();
    }

    /**
     * Injection point for targets below 21.13.
     *
     * @return video is repeated.
     */
    public static boolean alwaysRepeat() {
        if (!alwaysRepeatEnabled() || !VideoInformation.overrideVideoTime(0)) return false;

        pauseAfterRepeat();
        return true;
    }

    public static boolean alwaysRepeatEnabled() {
        return Settings.ALWAYS_REPEAT.get()
                && (!Settings.ALWAYS_REPEAT_PAUSE.get() || VideoInformation.isPauseVideoSupported());
    }

    public static void pauseAfterRepeat() {
        if (alwaysRepeatEnabled() && Settings.ALWAYS_REPEAT_PAUSE.get()) VideoInformation.pauseVideo();
    }

}
