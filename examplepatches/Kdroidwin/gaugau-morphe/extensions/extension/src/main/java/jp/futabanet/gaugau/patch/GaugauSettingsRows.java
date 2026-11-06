package jp.futabanet.gaugau.patch;

import android.util.Log;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** Adds the patch settings rows to GauGau's existing Compose settings section. */
public final class GaugauSettingsRows {
    private static final String TAG = "GauGauPatch";
    private static final Object[] callbacks = new Object[2];

    private GaugauSettingsRows() { }

    public static void addRows(Object composer) {
        try {
            addRow(composer, "アプリ内ID", callback(0));
            addRow(composer, "お気に入りの移行", callback(1));
        } catch (Throwable error) {
            Log.w(TAG, "設定項目を表示できませんでした", error);
        }
    }

    private static void addRow(Object composer, String title, Object callback) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Class<?> rowClass = Class.forName("oa.a", false, loader);
        Method row = null;
        for (Method candidate : rowClass.getDeclaredMethods()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (candidate.getName().equals("b") && parameters.length == 10 &&
                    parameters[0] == String.class && parameters[3].isInstance(callback) &&
                    parameters[7].isInstance(composer)) {
                row = candidate;
                break;
            }
        }
        if (row == null) throw new NoSuchMethodException("GauGau settings row");
        row.invoke(null, title, null, null, callback, null, false, null, composer, 0, 118);
    }

    private static synchronized Object callback(final int action) throws Exception {
        if (callbacks[action] != null) return callbacks[action];
        Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0");
        callbacks[action] = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0},
                (proxy, method, args) -> {
                    if (method.getName().equals("invoke")) {
                        if (action == 0) GaugauActivityBridge.openDeviceIdEditor();
                        else GaugauActivityBridge.openFavoritesTransfer();
                        return null;
                    }
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == (args == null ? null : args[0]);
                    if (method.getName().equals("toString")) return "GauGauPatchSettingsAction";
                    return null;
                });
        return callbacks[action];
    }
}
