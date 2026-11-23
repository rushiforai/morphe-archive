package app.template.extension.aare.shell;

import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Calls an app's content provider from a shell process (no Context, no package), the way the
 * "content" command and Shizuku's server do. Hidden APIs are open to app_process.
 */
final class Providers {
    private static final String TAG = "AareShell";

    private Providers() {
    }

    static Bundle call(String authority, String method, Bundle extras) throws Exception {
        Object am = Class.forName("android.app.ActivityManager").getMethod("getService").invoke(null);
        Method get = find(am.getClass(), "getContentProviderExternal", 4);
        // The token is null on purpose: the system then counts references (see Shizuku's server).
        Object holder = get.invoke(am, authority, 0, null, authority);
        if (holder == null) throw new IllegalStateException("no provider " + authority);
        Object provider = holder.getClass().getField("provider").get(holder);
        if (provider == null) throw new IllegalStateException("provider not running " + authority);
        try {
            return callCompat(provider, authority, method, extras);
        } finally {
            try {
                if (Build.VERSION.SDK_INT >= 29) {
                    find(am.getClass(), "removeContentProviderExternalAsUser", 3).invoke(am, authority, null, 0);
                } else {
                    find(am.getClass(), "removeContentProviderExternal", 2).invoke(am, authority, null);
                }
            } catch (Throwable t) {
                Log.w(TAG, "removeContentProviderExternal", t);
            }
        }
    }

    private static Bundle callCompat(Object provider, String authority, String method, Bundle extras) throws Exception {
        if (Build.VERSION.SDK_INT >= 31) {
            Object source = new android.content.AttributionSource.Builder(android.os.Process.myUid()).build();
            Method call = provider.getClass().getMethod("call", android.content.AttributionSource.class,
                    String.class, String.class, String.class, Bundle.class);
            return (Bundle) call.invoke(provider, source, authority, method, null, extras);
        } else if (Build.VERSION.SDK_INT >= 30) {
            Method call = provider.getClass().getMethod("call", String.class, String.class, String.class,
                    String.class, String.class, Bundle.class);
            return (Bundle) call.invoke(provider, null, null, authority, method, null, extras);
        } else if (Build.VERSION.SDK_INT >= 29) {
            Method call = provider.getClass().getMethod("call", String.class, String.class, String.class,
                    String.class, Bundle.class);
            return (Bundle) call.invoke(provider, null, authority, method, null, extras);
        } else {
            Method call = provider.getClass().getMethod("call", String.class, String.class, String.class, Bundle.class);
            return (Bundle) call.invoke(provider, null, method, null, extras);
        }
    }

    private static Method find(Class<?> type, String name, int params) throws NoSuchMethodException {
        for (Method m : type.getMethods()) {
            if (m.getName().equals(name) && m.getParameterTypes().length == params) {
                if (name.equals("getContentProviderExternal")) {
                    Class<?>[] p = m.getParameterTypes();
                    if (p[0] != String.class || p[1] != int.class || p[2] != IBinder.class) continue;
                }
                return m;
            }
        }
        throw new NoSuchMethodException(name);
    }

    /** The provider's authority in AARE: the Shizuku API's provider. */
    static String authority(String packageName) {
        return packageName + ".shizuku";
    }
}
