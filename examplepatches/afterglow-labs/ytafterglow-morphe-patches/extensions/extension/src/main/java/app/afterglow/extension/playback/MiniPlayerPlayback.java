package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/** The default-OFF iOS {@code miniplayer} override, owned by the Mini player tweak. */
@SuppressWarnings("unused")
public final class MiniPlayerPlayback {
    private MiniPlayerPlayback() {}

    /**
     * Called only at the two native mini-player pause-only comparisons. In 21.43.523,
     * decoded mode 5 pauses made-for-kids playback while minimized. Zero follows the
     * existing no-restriction branch at both sites. Other modes, including unknown
     * values, remain native. The server renderer and saved playback state are untouched.
     */
    public static int playbackMode(int original) {
        if (original != 5) return original;
        try {
            return InstalledTweaks.has("miniplayer") && LiteMode.effectiveBool("miniplayer")
                    ? 0 : original;
        } catch (Throwable error) {
            Afterglow.error("MiniPlayerPlayback.playbackMode", error);
            return original;
        }
    }
}
