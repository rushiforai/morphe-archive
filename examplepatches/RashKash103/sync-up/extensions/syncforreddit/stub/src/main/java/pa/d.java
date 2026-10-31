package pa;

import android.os.Bundle;

/**
 * The fragment every screen of Sync's settings is: it loads a screen of preferences and the app
 * draws it. A screen of our own is one of these, so that it is drawn exactly as the others are.
 *
 * <p>Compile only, and named as the app names it. Only the members used are declared.
 */
public class d {
    /** The key a screen is given the term to search for under. */
    public static String B0;

    /** Loads a screen of preferences. */
    public void t3(int screen) {
        throw new UnsupportedOperationException("Stub");
    }

    /** Called to build the screen; where the screen to load is chosen. */
    public void C3(Bundle state, String rootKey) {
        throw new UnsupportedOperationException("Stub");
    }

    public void a3(Bundle arguments) {
        throw new UnsupportedOperationException("Stub");
    }

    /** findPreference: the row with the given key, or null where the screen has no such row. */
    public androidx.preference.Preference y(CharSequence key) {
        throw new UnsupportedOperationException("Stub");
    }
}
