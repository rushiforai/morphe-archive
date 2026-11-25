package app.jofslash.extension.youtubekids;

import java.util.List;

/**
 * Used by the Hide Sign in tab patch. The last tab of the bottom bar is "Sign in" while signed out
 * and the profile tab once signed in; only the signed-out one is left out.
 */
@SuppressWarnings("unused")
public final class SignInTab {
    private static volatile boolean signedOut;

    private SignInTab() {
    }

    /** Called when the tab gets its signed-in label. */
    public static void signedIn() {
        signedOut = false;
    }

    /** Called when the tab gets its "Sign in" label instead. */
    public static void signedOut() {
        signedOut = true;
    }

    /** Replaces list.add(tab) for the last tab. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static boolean add(List list, Object tab) {
        if (signedOut) return false;
        return list.add(tab);
    }
}
