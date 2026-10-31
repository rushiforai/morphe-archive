package t7;

/**
 * Sync's settings store, which is not the one an app has by default.
 *
 * <p>Sync keeps a separate set of settings for each account signed in, in a file named after
 * that account, and points its settings screens at it. Anything reading what those screens
 * wrote has to be pointed at the same place.
 *
 * <p>Compile only, and named as the app names it: the extension refers to this class by the
 * same descriptor, so the name is not ours to choose. Only the members used are declared.
 */
public class z {
    /** Whether settings are being kept per account rather than in the one default file. */
    public static boolean i() {
        throw new UnsupportedOperationException("Stub");
    }

    /** The name of the file the settings of the account now signed in are kept in. */
    public static String a() {
        throw new UnsupportedOperationException("Stub");
    }
}
