package app.ayham.extension.music.automix;

import android.net.Uri;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.Collections;

import app.ayham.extension.music.addons.StreamCache;

/**
 * media3's DataSource for YT Music 9.30.53 (obfuscated names, read from its dex), reading an addon's
 * audio through {@link StreamCache}: the player streams it in ranges, and what it has read stays
 * on disk. cmj = DataSource.Factory (a: create), cmk = DataSource (b: open(DataSpec) -> length,
 * c: getUri, d: getResponseHeaders, e: addTransferListener, f: close) extending cdf = DataReader
 * (a: read(byte[], int, int), -1 at the end), cmp = DataSpec (a: uri, g: position, h: length, -1 unset).
 */
final class CachedDataSource {
    private CachedDataSource() {
    }

    static Object factory(ClassLoader cl, StreamCache.Entry e) throws Exception {
        final Class<?> cmj = cl.loadClass("cmj"), cmk = cl.loadClass("cmk"), cmp = cl.loadClass("cmp");
        final Field uriF = cmp.getField("a"), posF = cmp.getField("g"), lenF = cmp.getField("h");
        return Proxy.newProxyInstance(cl, new Class<?>[]{cmj}, (proxy, m, a) -> {
            Object o = objectMethod(proxy, m.getName(), a);
            if (o != NOT_OBJECT) return o;
            if (m.getReturnType() == cmk) return source(cl, cmk, uriF, posF, lenF, e);
            return null;
        });
    }

    private static final Object NOT_OBJECT = new Object();

    private static Object objectMethod(Object proxy, String name, Object[] a) {
        switch (name) {
            case "hashCode":
                return System.identityHashCode(proxy);
            case "equals":
                return proxy == a[0];
            case "toString":
                return "ayham-stream";
            default:
                return NOT_OBJECT;
        }
    }

    private static Object source(ClassLoader cl, Class<?> cmk, Field uriF, Field posF, Field lenF, StreamCache.Entry e) {
        final Object[] uri = new Object[1];
        final long[] at = new long[2];   // position, bytes left (-1: to the end)
        InvocationHandler h = (proxy, m, a) -> {
            Object o = objectMethod(proxy, m.getName(), a);
            if (o != NOT_OBJECT) return o;
            Class<?>[] p = m.getParameterTypes();
            switch (m.getName()) {
                case "b":   // open(DataSpec)
                    if (p.length == 1) {
                        uri[0] = uriF.get(a[0]);
                        long pos = posF.getLong(a[0]), len = lenF.getLong(a[0]);
                        long total = e.length();
                        if (pos < 0 || (total >= 0 && pos > total)) throw new IOException("position " + pos + " outside the stream");
                        // a length past the end is cut to what is there (DataSource.open returns what will be read)
                        long left = len != -1 ? (total >= 0 ? Math.min(len, total - pos) : len) : total >= 0 ? total - pos : -1;
                        at[0] = pos;
                        at[1] = left;
                        return left;
                    }
                    break;
                case "a":   // read(byte[], int, int)
                    if (p.length == 3) {
                        int len = (Integer) a[2];
                        if (len == 0) return 0;
                        if (at[1] == 0) return -1;
                        int want = at[1] < 0 ? len : (int) Math.min(len, at[1]);
                        int n = e.read(at[0], (byte[]) a[0], (Integer) a[1], want);
                        if (n < 0) return -1;
                        at[0] += n;
                        if (at[1] > 0) at[1] -= n;
                        return n;
                    }
                    break;
                case "c":
                    return uri[0] instanceof Uri ? uri[0] : null;
                case "d":
                    return Collections.emptyMap();
                case "e":
                    return null;
                case "f":   // close: getUri is null again until the next open
                    uri[0] = null;
                    return null;
                default:
                    break;
            }
            return null;
        };
        return Proxy.newProxyInstance(cl, new Class<?>[]{cmk}, h);
    }
}
