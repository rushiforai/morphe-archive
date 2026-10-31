package app.bitchord.telegram;

import androidx.media3.common.MediaItem;
import androidx.media3.common.MediaMetadata;
import androidx.media3.common.Player;

/** Acknowledges the actual Telegram item only after playback starts, never during prefetch. */
public final class PlaybackPolicy {
    private PlaybackPolicy() {}

    static String track(String mediaId) {
        String prefix = "src:telegram-native::";
        if (mediaId == null || !mediaId.startsWith(prefix)) return null;
        String id = mediaId.substring(prefix.length());
        if (ZipAlbums.validId(id)) return id;
        if (id.length() > 42 || !id.matches("-?[0-9]+_[0-9]+")) return null;
        int split = id.indexOf('_');
        try {
            long chat = Long.parseLong(id.substring(0, split)),
                    message = Long.parseLong(id.substring(split + 1));
            return chat != 0 && message > 0 && id.equals(chat + "_" + message) ? id : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static void onState(Player player, boolean playing) {
        if (!playing || player == null) return;
        TelegramBridge bridge = TelegramBridge.instance;
        if (bridge == null) return;
        MediaItem item = player.getCurrentMediaItem();
        String id = track(item == null ? null : item.mediaId);
        if (id != null) bridge.played(id);
        else if (item != null && item.mediaMetadata != null) {
            // Another source is playing; Telegram may hold a misnamed copy.
            MediaMetadata about = item.mediaMetadata;
            long duration = player.getDuration();
            if (duration <= 0 && about.durationMs != null) duration = about.durationMs;
            if (duration > 0)
                bridge.heard(text(about.title), text(about.artist), duration, item.mediaId);
            SoundCheck sound = SoundCheck.active;
            if (sound != null && duration > 0)
                sound.playing(
                        text(about.title),
                        text(about.artist),
                        duration,
                        player.getCurrentPosition());
        }
    }

    static String text(CharSequence value) {
        return value == null ? "" : value.toString();
    }

    public static void onTransition(Player player) {
        if (player != null) onState(player, player.isPlaying());
    }
}
