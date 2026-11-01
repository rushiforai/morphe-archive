package patches.bright;

/**
 * Immutable effective selections, written once by patch-injected code at the
 * webview plugin's engine-attach callback and only read afterwards. Every
 * flag defaults to false: installing the shared runtime alone activates none
 * of the controls.
 */
public final class BrightPolicy {

    public static volatile boolean articles;
    public static volatile boolean ads;
    public static volatile boolean tracking;
    public static volatile boolean consent;

    private BrightPolicy() {
    }

    public static boolean any() {
        return articles || ads || tracking || consent;
    }
}
