package nl.johninnl.eclipse.app;

import com.eclipse.android.data.models.Song;
import java.util.List;

/** Stand-in for the app's player (R8 name jh0, build 155). Never packaged; see the patch's link check. */
public class jh0 {
    /** The holder whose {@code p(Context)} yields the player singleton. */
    public static final y0c K0 = null;

    /** The current song (Song or null). */
    public final vi8 c = null;
    /** Shuffle mode (an enum whose OFF value means shuffle is off). */
    public final vi8 r = null;

    /** Replace the queue with {@code list} and play from {@code index}. */
    public void P(List list, int index, ke8 origin) { }

    /** Play one song and keep the queue. */
    public void O(Song song) { }

    /** Skip to the next item. */
    public void K(boolean userInitiated) { }

    /** Toggle shuffle. */
    public void r0() { }
}
