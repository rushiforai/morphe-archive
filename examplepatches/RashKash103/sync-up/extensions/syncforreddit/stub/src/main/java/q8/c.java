package q8;

import android.content.Context;
import android.content.CursorLoader;

/**
 * How Sync asks its own store for a thread.
 *
 * <p>Compile only, and named as the app names it.
 */
public class c {
    /**
     * @param where What thread to read, as Sync writes such a question.
     * @return A loader for it, which can be read on the thread that asked.
     */
    public static CursorLoader a(Context context, String where, boolean unused,
                                 String alsoUnused) {
        throw new UnsupportedOperationException("Stub");
    }
}
