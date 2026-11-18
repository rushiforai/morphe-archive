package app.afterglow.extension.menus;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.video.VideoState;

/** Native interaction entry points for the independently installed Long-press tools. */
public final class LongPressTools {
    /** Added to the native Pause command; unavailable controls keep the clipboard intact. */
    public interface PauseCommand { boolean afterglow_canPause(); }

    private LongPressTools() {}

    private static boolean enabled(String key) {
        return InstalledTweaks.has("long-press-tools") && LiteMode.effectiveBool(key);
    }

    /** Called only after the native PLAYING branch of the actual Pause button's onClick. */
    public static void pauseClicked(PauseCommand command) {
        try {
            if (!enabled("copyWithTimestamp") || command == null || !command.afterglow_canPause()
                    || VideoState.isAdPlaying() || VideoState.isShortsPlayerInFront()
                    || !VideoState.playerType().isMaximizedOrFullscreen()) return;
            String link = LongPressPolicy.timestampLink(VideoState.videoId(), VideoState.videoTime());
            if (link != null) copyText(link);
        } catch (Throwable error) {
            Afterglow.error("LongPressTools.pauseClicked", error);
        }
    }

    private static void copyText(String value) {
        Context context = Afterglow.context();
        if (context == null) throw new IllegalStateException("Clipboard context unavailable");
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) throw new IllegalStateException("Clipboard service unavailable");
        clipboard.setPrimaryClip(ClipData.newPlainText("", value));
    }
}
