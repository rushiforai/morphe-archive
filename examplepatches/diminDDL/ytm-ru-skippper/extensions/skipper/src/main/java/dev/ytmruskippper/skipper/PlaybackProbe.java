package dev.ytmruskippper.skipper;

import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class PlaybackProbe {
    private static final String TAG = "YtmPlaybackProbe";

    private PlaybackProbe() {}

    public static void onPlayerResponse(String videoId) {
        Log.i(TAG, "playerResponse videoId=" + videoId);
    }

    public static void onNotificationTrack(Object model, CharSequence title, CharSequence credit) {
        try {
            NotificationTrack track = NotificationTrack.read(model, title, credit);
            JSONArray runs = new JSONArray();
            for (NotificationTrack.CreditRun run : track.runs) {
                runs.put(new JSONObject().put("text", run.text).put("linked", run.linked));
            }
            Log.i(TAG, "notificationTrack " + new JSONObject()
                    .put("videoId", track.videoId == null ? JSONObject.NULL : track.videoId)
                    .put("title", track.title)
                    .put("artistCredit", track.artistCredit)
                    .put("bylineRuns", runs));
        } catch (ReflectiveOperationException | JSONException | RuntimeException error) {
            Log.w(TAG, "Could not inspect notification track model", error);
        }
    }

    public static void onSessionMetadata(MediaSession session, MediaMetadata metadata) {
        if (metadata == null) {
            Log.i(TAG, "sessionMetadata cleared");
            return;
        }

        Log.i(TAG, "sessionMetadata mediaId=" + metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID)
                + " title=" + metadata.getString(MediaMetadata.METADATA_KEY_TITLE)
                + " artist=" + metadata.getString(MediaMetadata.METADATA_KEY_ARTIST)
                + " displayTitle=" + metadata.getString(MediaMetadata.METADATA_KEY_DISPLAY_TITLE)
                + " displaySubtitle=" + metadata.getString(MediaMetadata.METADATA_KEY_DISPLAY_SUBTITLE));
    }
}
