package semicoloncolonel.mobilestream.extension.kouponai.misc;

import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Koupon: keeps the "Best Promo Codes, New users only" window open.
 *
 * The app counts that window down from the time it stores under
 * {@code kp_device_fv} in React Native's AsyncStorage: the first time the app
 * was opened on the device, or the account's creation time once you sign in.
 * Seven days later the home screen card and its codes disappear. The codes
 * themselves are public, so only the date decides.
 *
 * Every AsyncStorage read passes through AsyncStorageModule.multiGet, which
 * calls {@link #beforeMultiGet} first. When the read includes
 * {@code kp_device_fv}, the stored value becomes the current time before the
 * read runs, so the window always shows seven days left. Reads run in order on
 * the module's serial executor, after this synchronous write.
 *
 * The module's ReactDatabaseSupplier is reached by reflection, so this compiles
 * without React Native.
 */
@SuppressWarnings("unused")
public final class PromoWindow {
    private static final String TAG = "MSP-KOUPON";
    private static final String KEY = "kp_device_fv";

    private PromoWindow() {
    }

    /** Called at the start of AsyncStorageModule.multiGet(keys, callback). */
    public static void beforeMultiGet(Object module, Object keys) {
        try {
            if (keys == null || !contains(keys)) {
                return;
            }
            Field field = module.getClass().getDeclaredField("mReactDatabaseSupplier");
            field.setAccessible(true);
            Object supplier = field.get(module);
            SQLiteDatabase database = (SQLiteDatabase) supplier.getClass().getMethod("get").invoke(supplier);
            database.execSQL(
                    "INSERT OR REPLACE INTO catalystLocalStorage (key, value) VALUES (?, ?)",
                    new Object[]{KEY, String.valueOf(System.currentTimeMillis())});
        } catch (Throwable error) {
            Log.w(TAG, "could not refresh " + KEY, error);
        }
    }

    private static boolean contains(Object keys) throws Exception {
        Method size = keys.getClass().getMethod("size");
        Method getString = keys.getClass().getMethod("getString", int.class);
        int count = (Integer) size.invoke(keys);
        for (int i = 0; i < count; i++) {
            if (KEY.equals(getString.invoke(keys, i))) {
                return true;
            }
        }
        return false;
    }
}
