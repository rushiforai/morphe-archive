package software.santodan.extension.nuviomenu;

import java.lang.reflect.*;
import software.santodan.nuvio.NuvioNative;

/** Transfer dialogs render inside Nuvio's existing themed composition. */
public final class SettingsTransferUi {
    interface Action { void run() throws Exception; }
    private static final class Dialog {
        final String title, message, primary, secondary;
        final Action action;
        Dialog(String title, String message, String primary, Action action, String secondary) {
            this.title = title; this.message = message; this.primary = primary; this.action = action; this.secondary = secondary;
        }
    }
    private static volatile Dialog current;
    private static Object revision;
    private static int serial;
    private SettingsTransferUi() {}

    static void busy() { show("Patch settings", "Transferring patch settings...", null, null, null); }
    static void show(String title, String message, String primary, Action action, String secondary) {
        current = new Dialog(title, message, primary, action, secondary);
        changed();
    }
    private static void changed() {
        if (revision != null) try { method(revision.getClass(), "setValue", 1).invoke(revision, ++serial); }
        catch (Exception error) { throw new IllegalStateException("Cannot update settings transfer dialog", error); }
    }
    private static void close(Dialog expected) {
        if (current == expected && expected.primary != null) { current = null; changed(); }
    }
    static void render(Object composer) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(composer.getClass(), "d0", 1).invoke(composer, 0x53544231);
        try {
            if (revision == null) revision = nativeMethod(loader, NuvioNative.REF_COMPOSE_FACTORY_T, 1).invoke(null, serial);
            method(revision.getClass(), "getValue", 0).invoke(revision);
            Dialog dialog = current;
            if (dialog == null) return;
            Object dismiss = click(loader, () -> close(dialog));
            Object content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME)
                .getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(0x53544232,
                    callback(loader, "Function3", args -> {
                        Object nested = args[1];
                        if (dialog.primary != null) {
                            Object actions = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME)
                                .getDeclaredConstructor(int.class, Object.class, boolean.class).newInstance(0x53544233,
                                    callback(loader, "Function3", row -> {
                                        nativeMethod(loader, NuvioNative.REF_SETTINGS_ROWS_D, 7).invoke(null,
                                            dialog.primary, click(loader, () -> {
                                                if (current != dialog) return;
                                                close(dialog);
                                                try { dialog.action.run(); }
                                                catch (Exception error) { show("Patch settings", "Unable to complete action: " + error.getMessage(), "OK", () -> {}, null); }
                                            }), true, true, row[1], 0, 0);
                                        if (dialog.secondary != null) nativeMethod(loader, NuvioNative.REF_SETTINGS_ROWS_D, 7).invoke(null,
                                            dialog.secondary, dismiss, false, true, row[1], 0, 0);
                                        return unit(loader);
                                    }), true);
                            nativeMethod(loader, NuvioNative.REF_SETTINGS_ROWS_E, 5).invoke(null, null, actions, nested, 0, 1);
                        }
                        return unit(loader);
                    }), true);
            nativeMethod(loader, NuvioNative.REF_LIBRARY_CONTENT_Z, 19).invoke(null, dismiss,
                dialog.title, dialog.message, 700f, 0, false, false, null, null,
                0f, 0f, 0f, 0f, null, content, composer, 0, 24576, 16336);
        } finally { method(composer.getClass(), "p", 1).invoke(composer, false); }
    }
    private interface Callback { Object run(Object[] arguments) throws Exception; }
    private static Object callback(ClassLoader loader, String type, Callback callback) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{loader.loadClass("kotlin.jvm.functions." + type)}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) return callback.run(args);
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == args[0];
            return "SantodanTransferDialog";
        });
    }
    private static Object click(ClassLoader loader, Action action) throws Exception {
        return callback(loader, "Function0", args -> { action.run(); return unit(loader); });
    }
    private static Object unit(ClassLoader loader) throws Exception {
        Class<?> type = loader.loadClass("kotlin.Unit");
        try { return type.getField("INSTANCE").get(null); }
        catch (NoSuchFieldException renamed) { return type.getField("a").get(null); }
    }
    private static Method nativeMethod(ClassLoader loader, String reference, int count) throws Exception {
        String owner = reference.substring(1, reference.indexOf(';')).replace('/', '.');
        String name = reference.substring(reference.indexOf("->") + 2, reference.indexOf('('));
        return method(loader.loadClass(owner), name, count);
    }
    private static Method method(Class<?> owner, String name, int count) throws Exception {
        Method result = null;
        for (Method method : owner.getDeclaredMethods()) if (method.getName().equals(name) && method.getParameterCount() == count) {
            if (result != null) throw new NoSuchMethodException("Ambiguous " + owner.getName() + '.' + name);
            result = method;
        }
        if (result == null) throw new NoSuchMethodException(owner.getName() + '.' + name);
        result.setAccessible(true); return result;
    }
}
