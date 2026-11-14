package app.morphe.extension.mapsautomotive.android9;

import android.app.Application;
import android.os.Build;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Patch "Android 9 (API 28)" (issue #11 tester builds): its start-up and the hidden API exemption.
 * <p>
 * The patch sends every Maps call of an Android 10 member to a compat class of this package (one per framework class,
 * its OWNER), which uses the member on Android 10 and newer and an Android 9 equivalent below. Android 10 classes that
 * Android 9 lacks ship in this extension under their framework names (RenderNode, BlendMode, the font classes, ...);
 * Android 10 and newer load their own and never ours.
 * <p>
 * Two of those need Android 9's hidden android.view.RenderNode and android.view.DisplayListCanvas, which are not on
 * Android 9's light greylist. On Android 9 only, an exemption for exactly these two classes is set before the first
 * use, with VMRuntime.setHiddenApiExemptions reached through reflection by the framework's own Class methods.
 */
public final class Android9 {
    static final String TAG = "MorpheAndroid9";
    static final String[] EXEMPTIONS = {"Landroid/view/RenderNode;", "Landroid/view/DisplayListCanvas;"};
    private static final Object lock = new Object();
    private static Boolean exempted;
    private static volatile Boolean carApi;

    private Android9() {
    }

    /** Injection point: the start of Maps' Application onCreate. Logs how this process runs, sets the exemption. */
    public static void onApplicationCreate(Application application) {
        try {
            boolean exemption = ensureHiddenApiExemptions();
            ClassLoader renderNodeLoader = Class.forName("android.graphics.RenderNode").getClassLoader();
            boolean ours = renderNodeLoader == Android9.class.getClassLoader();
            Log9.i("Android 9 patch: API " + Build.VERSION.SDK_INT + ", android.graphics.RenderNode from "
                    + (ours ? "this app" : "the framework") + ", hidden API exemption "
                    + (Build.VERSION.SDK_INT >= 29 ? "not needed" : exemption ? "set" : "FAILED")
                    + ", Car.createCar(Context) " + (carApiUsable() ? "present" : "absent"));
        } catch (Throwable error) {
            Log9.w("Android 9 patch: start-up check failed", error);
        }
    }

    /** Whether android.car has Car.createCar(Context), the method Maps' car setup needs (PackageManager28). */
    static boolean carApiUsable() {
        Boolean usable = carApi;
        if (usable == null) {
            try {
                Class<?> car = Class.forName("android.car.Car", false, Android9.class.getClassLoader());
                car.getMethod("createCar", android.content.Context.class);
                usable = true;
            } catch (ReflectiveOperationException | LinkageError | RuntimeException error) {
                usable = false;
            }
            carApi = usable;
        }
        return usable;
    }

    /** Android 9: sets the exemption once; true when it is set. Android 10+: false, nothing to do. */
    public static boolean ensureHiddenApiExemptions() {
        if (Build.VERSION.SDK_INT >= 29) return false;
        synchronized (lock) {
            if (exempted != null) return exempted;
            boolean result;
            try {
                setExemptions("dalvik.system.VMRuntime", EXEMPTIONS.clone());
                result = true;
                Log9.i("Android 9: hidden API exemption set for " + String.join(", ", EXEMPTIONS));
            } catch (Throwable error) {
                result = false;
                Log9.w("Android 9: could not set the hidden API exemption; Compose layers will fail", error);
            }
            exempted = result;
            return result;
        }
    }

    /**
     * runtimeClass.getRuntime().setHiddenApiExemptions(prefixes), with both methods looked up by Class.getDeclaredMethod
     * called through reflection: that call runs with the framework as caller, so Android 9 does not filter the hidden
     * VMRuntime members it returns. Plain Java, so a host probe checks the reflective arguments
     * (a review found the parameter types wrapped in an extra Object[], which made the lookup throw).
     */
    static void setExemptions(String runtimeClass, String[] prefixes) throws ReflectiveOperationException {
        Method forName = Class.class.getDeclaredMethod("forName", String.class);
        Method getDeclaredMethod = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, Class[].class);
        Class<?> runtime = (Class<?>) forName.invoke(null, runtimeClass);
        Method getRuntime = (Method) getDeclaredMethod.invoke(runtime, "getRuntime", new Class<?>[0]);
        Method setHiddenApiExemptions =
                (Method) getDeclaredMethod.invoke(runtime, "setHiddenApiExemptions", new Class<?>[]{String[].class});
        setHiddenApiExemptions.invoke(getRuntime.invoke(null), new Object[]{prefixes});
    }

    /** The Maps Car report log (the core extension's ReportLog) when present, else logcat. */
    static final class Log9 {
        private static Method info, warning;
        private static boolean looked;

        private Log9() {
        }

        static void i(String message) {
            if (!call(true, message, null)) Log.i(TAG, message);
        }

        static void w(String message, Throwable error) {
            if (!call(false, message, error)) Log.w(TAG, message, error);
        }

        private static synchronized boolean call(boolean isInfo, String message, Throwable error) {
            try {
                if (!looked) {
                    looked = true;
                    Class<?> reportLog = Class.forName("app.morphe.extension.mapsautomotive.patches.ReportLog");
                    info = reportLog.getDeclaredMethod("i", String.class, String.class);
                    warning = reportLog.getDeclaredMethod("w", String.class, String.class, Throwable.class);
                    info.setAccessible(true);
                    warning.setAccessible(true);
                }
                if (isInfo && info != null) {
                    info.invoke(null, TAG, message);
                    return true;
                }
                if (!isInfo && warning != null) {
                    warning.invoke(null, TAG, message, error);
                    return true;
                }
            } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
                info = null;
                warning = null;
            }
            return false;
        }
    }
}
