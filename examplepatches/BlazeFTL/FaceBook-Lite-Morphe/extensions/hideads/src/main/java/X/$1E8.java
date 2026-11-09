package X;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import app.fblite.extension.hideads.SponsoredPosts;

/**
 * Replacement for Facebook Lite's props decoder X.1E8 (the build strips the "$" from class names in
 * package X, since Java cannot start a class name with a digit).
 *
 * Every method delegates to the original, loaded from the app's secondary dex. After A02 decodes a
 * container, sponsored posts in the feed are hidden. Names are for Facebook Lite 536.0.0.11.107.
 */
@SuppressWarnings("unused")
public abstract class $1E8 {
    private static Method a00, a01, a02;

    public static Object A00($0hc component, $0Fn input, int flags) {
        return invoke(0, component, input, flags);
    }

    public static void A01($1I5 target, $0Fn input, int flags, boolean update) {
        invoke(1, target, input, flags, update);
    }

    public static void A02($0hg container, $0Fn input, int flags, boolean update) {
        invoke(2, container, input, flags, update);
        SponsoredPosts.afterDecode(container);
    }

    /** Tests bit (i % 8) of b. Called very often, so it is not delegated. */
    public static boolean A03(byte b, int i) {
        return (b & (1 << (i % 8))) != 0;
    }

    private static Object invoke(int which, Object... args) {
        if (a02 == null) load();
        try {
            return (which == 0 ? a00 : which == 1 ? a01 : a02).invoke(null, args);
        } catch (InvocationTargetException e) {
            throw $1E8.<RuntimeException>rethrow(e.getCause());
        } catch (IllegalAccessException e) {
            throw new IllegalStateException(e);
        }
    }

    private static synchronized void load() {
        if (a02 != null) return;
        try {
            Class<?> original = app.fblite.extension.hideads.OriginalDecoder.load();
            ClassLoader app = $1E8.class.getClassLoader();
            Class<?> component = Class.forName("X.0hc", false, app);
            Class<?> input = Class.forName("X.0Fn", false, app);
            Class<?> target = Class.forName("X.1I5", false, app);
            Class<?> container = Class.forName("X.0hg", false, app);
            a00 = original.getMethod("A00", component, input, int.class);
            a01 = original.getMethod("A01", target, input, int.class, boolean.class);
            a02 = original.getMethod("A02", container, input, int.class, boolean.class);
        } catch (Throwable t) {
            // Without the original the feed cannot be decoded at all.
            throw new IllegalStateException("Could not load the original X.1E8", t);
        }
    }

    /** Rethrows the original exception unchanged, checked or not. */
    @SuppressWarnings("unchecked")
    private static <T extends Throwable> T rethrow(Throwable t) throws T {
        throw (T) t;
    }
}
