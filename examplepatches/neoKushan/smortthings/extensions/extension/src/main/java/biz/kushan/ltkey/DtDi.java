package biz.kushan.ltkey;

import android.content.Context;

import java.lang.reflect.Method;

/**
 * Resolves the app's loaded {@code CryptoManager} singleton through its Dagger graph, using the
 * obfuscated accessors confirmed for OneConnect 1.8.52.23 and re-confirmed on 1.8.54.23:
 *
 * <pre>
 *   comp = sk.b.a(context)      // static accessor, returns the component (interface sk.a / impl f4)
 *   cm   = comp.X()             // -&gt; com.samsung.android.oneconnect.base.security.CryptoManager
 * </pre>
 *
 * These names are version-specific; the patch is pinned to 1.8.52.23 / 1.8.54.23. All reflective,
 * all guarded — returns null (→ no key, no row) if anything about the graph differs.
 */
final class DtDi {

    static Object cryptoManager(Context ctx) {
        try {
            Class<?> skb = Class.forName("sk.b");
            Method a = skb.getMethod("a", Context.class);
            Object comp = a.invoke(null, ctx);
            if (comp == null) return null;
            Method x = comp.getClass().getMethod("X");
            Object cm = x.invoke(comp);
            // Sanity: it must be the CryptoManager with a decryptString-shaped method.
            if (cm == null) return null;
            cm.getClass().getMethod("a", String.class);   // throws if not present
            return cm;
        } catch (Throwable t) {
            DtLog.w("cryptoManager() resolve failed", t);
            return null;
        }
    }
}
