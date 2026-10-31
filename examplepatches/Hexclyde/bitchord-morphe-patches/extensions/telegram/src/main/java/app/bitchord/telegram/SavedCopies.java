package app.bitchord.telegram;

import android.net.Uri;

import com.music.bitchord.playback.AudioCache;

import java.util.Collection;

/**
 * Removes BitChord's own saved copy of a YouTube song. A song in BitChord's cache plays straight
 * from it and never reaches the source check, so a Telegram file renamed to match it would not be
 * used until the saved copy is gone.
 */
final class SavedCopies {
    private SavedCopies() {}

    static boolean youtubeId(String id) {
        return id != null && id.matches("[A-Za-z0-9_-]{11}");
    }

    /** Returns how many songs' saved copies were removed. Call off the main thread. */
    static int forget(Collection<String> mediaIds) {
        int removed = 0;
        for (String id : mediaIds) {
            if (!youtubeId(id)) continue;
            try {
                AudioCache.discard(false, Uri.parse("bitchord://watch?v=" + id));
                removed++;
            } catch (Throwable e) {
                // The cache isn't ready or the entry is playing; it is left as it was.
            }
        }
        return removed;
    }
}
