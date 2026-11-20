package app.morphe.extension.chmate;

/** Uses the native preference setter so its in-memory value updates immediately. */
public final class NativeResponseOrder {
    public static void save242(Object selected) {
        if (selected == null) return;
        try {
            int value = ((Number) selected.getClass().getMethod("getIndex").invoke(selected)).intValue();
            Class<?> prefs = Class.forName("jp.syoboi.a2chMate.prefs.Prefs", false, selected.getClass().getClassLoader());
            Object key = prefs.getMethod("at").invoke(null);
            prefs.getMethod("d", key.getClass(), int.class).invoke(null, key, value);
        } catch (ReflectiveOperationException error) {
            android.util.Log.w("Haiagaru", "Unable to retain response ordering", error);
        }
    }
    private NativeResponseOrder() { }
}
