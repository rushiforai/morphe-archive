package nl.johninnl.eclipse.app;

import com.eclipse.android.core.audio.PlaybackService;
import com.eclipse.android.data.models.Song;

/** Stand-in for the app's car callback class. */
public class cm7 {
    /** The playback service (a Context) the callback belongs to. */
    public final PlaybackService a = null;

    /** The app's own car search: a List of s06, capped at 30. A suspend function. */
    public static Object a(cm7 callback, String query, vz1 completion) { return null; }

    /**
     * A browsable folder item: id, media type (20 mixed folder, 21 albums, 24 playlists, 10 album,
     * 11 artist, 13 playlist), title, subtitle and artwork URL (both nullable). It carries the content
     * style extras (grid for folders, list for songs).
     */
    public final s06 b(String id, int mediaType, String title, String subtitle, String artUrl) { return null; }

    /** Play a media id with its metadata, as the media session would. */
    public final void d(String mediaId, p16 metadata) { }

    /** A playable song item with the given media id. */
    public final s06 h(Song song, String id) { return null; }
}
