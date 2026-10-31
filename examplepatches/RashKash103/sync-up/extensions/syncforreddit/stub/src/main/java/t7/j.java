package t7;

import androidx.fragment.app.FragmentManager;

import com.laurencedawson.reddit_sync.ui.activities.BaseActivity;

/**
 * What Sync works out from a context alone, which is how its own code carries out an action
 * from somewhere that holds nothing else to go on.
 *
 * <p>Compile only, and named as the app names it. Only the members used are declared, and each
 * exactly as the app declares it: a return type is part of how a call is resolved.
 */
public class j {
    /** The activity a context belongs to. */
    public static BaseActivity a(android.content.Context context) {
        throw new UnsupportedOperationException("Stub");
    }

    /** What the screen this context belongs to is showing. */
    public static String b(android.content.Context context) {
        throw new UnsupportedOperationException("Stub");
    }

    /** The fragment manager of the activity a context belongs to. */
    public static FragmentManager g(android.content.Context context) {
        throw new UnsupportedOperationException("Stub");
    }
}
