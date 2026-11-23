package nl.johninnl.eclipse.app;

import android.content.Context;
import com.eclipse.android.data.models.Song;

/** Stand-in for the linked-library helper: loads a linked playlist and builds the song for one of its entries. */
public final class ja5 {
    public static final ja5 a = null;

    /** True when the entry is a track that can play. */
    public static boolean s(n95 entry) { return false; }

    /** The entry's artists joined with ", ". */
    public static String a(n95 entry) { return null; }

    public static Song v(String id, String title, String artist, String album, int durationSeconds, String cover, String extra,
                         Boolean explicit) { return null; }

    /** Suspend call answering l95 (found), k95 or j95; {@code progress} receives partial results. */
    public final Object c(Context context, String provider, String providerPlaylistId, boolean refresh, qi0 progress, vz1 completion) { return null; }
}
