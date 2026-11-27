package app.ayham.extension.music.features;

import android.content.Context;
import android.util.Log;

/**
 * Morphe's in-app downloads save the song; this saves what our player shows with it (lyrics, the
 * animated art, the video type) through {@link OfflineExtras}. Read only: the response is not changed.
 */
public final class OfflineSave {
    private static final String TAG = "AyhamDownloads";

    private OfflineSave() {
    }

    /**
     * Injection point: start of Morphe's BaseInAppDownloadsPatch.replaceDeclinedOfflinePlayerResponse,
     * which YT calls with the player response of every song it saves.
     */
    public static void onOfflinePlayerResponse(Object playerResponse) {
        try {
            if (playerResponse == null) return;
            byte[] bytes = (byte[]) playerResponse.getClass().getMethod("toByteArray").invoke(playerResponse);
            String videoId = savedVideoId(bytes);
            if (videoId == null) return;
            if (Features.appContext == null) {
                Features.appContext = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
            }
            DownloadChoice.Choice choice = DownloadChoice.choiceFor(videoId);
            if (choice == null) {
                // saved without the popup (smart downloads, a refresh, the popup off): YouTube's audio alone
                Log.i(TAG, "saved " + videoId + " without the popup: YouTube's download only");
                return;
            }
            OfflineExtras.saved(videoId, choice);
        } catch (Throwable t) {
            Log.w(TAG, "offline save hook failed", t);
        }
    }

    /** The video id of a response that carries an offline state (field 14), else null. */
    static String savedVideoId(byte[] playerResponse) {
        ProtoWire response = new ProtoWire(playerResponse);
        if (!response.has(14)) return null;
        String id = response.message(11).string(1);
        return id.isEmpty() ? null : id;
    }
}
