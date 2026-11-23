package nl.johninnl.eclipse.app;

import com.eclipse.android.data.models.Song;
import java.util.ArrayList;
import java.util.List;

/** Stand-in for the app's play queue. */
public class le8 {
    public static final ry6 x = null;

    /** The whole context queue (List of Song). */
    public final vi8 c = null;
    /** Index of the current song in {@link #c}; -1 when none. */
    public final vi8 e = null;
    /** User-queued songs, consumed first (List of Song). */
    public final vi8 k = null;

    /** Queue a song after the current one. */
    public final void a(Song song) { }
    /** Make {@code index} the current context index without touching Up Next. */
    public final void A(int index) { }
    /** Remove the Up Next entry at {@code index}. */
    public final void E(int index) { }
    /** Clear Up Next. */
    public final void f() { }
    /** True while a remote session owns the queue. */
    public final boolean o() { return false; }
    /** The context songs after the current one. */
    public final List q() { return null; }
    /** Up Next followed by the context tail. */
    public final ArrayList r() { return null; }
    /** Display name of the queue's origin. */
    public final String k() { return null; }
}
