import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Insets;
import android.os.Looper;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;

public final class UiFullscreenWindowProbe {
    private static final String PREFIX = "dev.twitchpatches.extension.ui.";
    public static void main(String[] args) throws Exception {
        try { run(); }
        catch (Throwable error) { error.printStackTrace(); System.exit(1); }
    }

    private static void run() throws Exception {
        if (Looper.getMainLooper() == null) Looper.prepareMainLooper();
        Class<?> thread = Class.forName("android.app.ActivityThread");
        Object systemThread = thread.getMethod("systemMain").invoke(null);
        Context context = (Context) thread.getMethod("getSystemContext").invoke(systemThread);
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.orientation = Configuration.ORIENTATION_LANDSCAPE;
        Context themed = new ContextThemeWrapper(context.createConfigurationContext(configuration), android.R.style.Theme_Material);
        UiFullscreenStateProbe.verify(themed);
        UiWindowBarsProbe.verify(themed);
        Window window = new ProbeWindow(themed);
        ProbeActivity activity = new ProbeActivity(window, themed);

        Class<?> settings = Class.forName(PREFIX + "UiSettings");
        Field instance = field(settings, "instance");
        Constructor<?> settingsConstructor = settings.getDeclaredConstructor(Application.class);
        settingsConstructor.setAccessible(true);
        Object registry = settingsConstructor.newInstance(new ProbeApplication(true, true));
        instance.set(null, registry);
        Object features = field(settings, "features").get(registry);
        Method enabled = features.getClass().getMethod("enabled", String.class);
        if (!Boolean.TRUE.equals(enabled.invoke(features, "fullscreen_hide_status_bar"))) throw new AssertionError("status preference");
        if (!Boolean.TRUE.equals(enabled.invoke(features, "fullscreen_hide_navigation_bar"))) throw new AssertionError("navigation preference");

        Class<?> policy = Class.forName(PREFIX + "UiFullscreenPolicy");
        Class<?> sessionType = Class.forName(PREFIX + "UiFullscreenPolicy$Session");
        Constructor<?> sessionConstructor = sessionType.getDeclaredConstructor(Activity.class);
        sessionConstructor.setAccessible(true);
        Object session = sessionConstructor.newInstance(activity);
        field(sessionType, "modernFullscreen").setBoolean(session, true);
        field(sessionType, "subscription").set(session, (AutoCloseable) () -> { });
        Map<?, ?> sessions = (Map<?, ?>) field(policy, "sessions").get(null);
        Map.class.getMethod("put", Object.class, Object.class).invoke(sessions, activity, session);
        verifyRequests(activity, settingsConstructor, instance, registry);
        Method filter = policy.getDeclaredMethod("filterInsets", Activity.class, int.class);
        filter.setAccessible(true);
        Method viewFilter = policy.getDeclaredMethod("filterInsets", View.class, int.class);
        viewFilter.setAccessible(true);
        View fullscreen = new View(new ContextThemeWrapper(activity, android.R.style.Theme_Material));
        fullscreen.setId(1234);
        checkView(viewFilter, fullscreen, 524, "fullscreen container with a themed activity context");
        fullscreen.setId(1235);
        checkView(viewFilter, fullscreen, 655, "other container retains insets");
        fullscreen.setId(View.NO_ID);
        checkView(viewFilter, fullscreen, 655, "unidentified view retains insets");

        // First insets can precede the session's first landscape layout callback.
        check(filter, activity, 524, "first landscape insets with stale session flags");
        field(sessionType, "hideStatus").setBoolean(session, true);
        field(sessionType, "hideNavigation").setBoolean(session, true);
        check(filter, activity, 524, "bound viewer activity after layout");
        instance.set(null, settingsConstructor.newInstance(new ProbeApplication(true, false)));
        check(filter, activity, 526, "status override preserves navigation");
        instance.set(null, settingsConstructor.newInstance(new ProbeApplication(false, true)));
        check(filter, activity, 653, "navigation override preserves cutout");
        instance.set(null, settingsConstructor.newInstance(new ProbeApplication(false, false)));
        check(filter, activity, 655, "disabled preferences");
        instance.set(null, registry);
        check(filter, new ProbeActivity(window, themed), 655, "unrelated activity");
        verifyToggleRefresh(settingsConstructor, instance, session, sessionType, activity, viewFilter);
        instance.set(null, registry);
        activity.orientation = Configuration.ORIENTATION_PORTRAIT;
        check(filter, activity, 655, "return to portrait before layout");
        activity.orientation = Configuration.ORIENTATION_LANDSCAPE;
        field(sessionType, "subscription").set(session, null);
        check(filter, activity, 655, "paused viewer");
        sessions.clear();
        instance.set(null, null);
        System.out.println("PASS fullscreen window policy: container scope, rotation, independent toggles, live re-enable with unchanged insets and pause");
    }

    private static void verifyToggleRefresh(Constructor<?> settings, Field instance, Object session, Class<?> type,
            Activity activity, Method filter) throws Exception {
        WindowInsets snapshot = new WindowInsets.Builder()
                .setInsets(WindowInsets.Type.statusBars(), Insets.of(0, 68, 0, 0))
                .setInsets(WindowInsets.Type.displayCutout(), Insets.of(65, 0, 0, 0))
                .setInsets(WindowInsets.Type.ime(), Insets.of(0, 0, 0, 111)).build();
        View container = new View(activity) {
            @Override public boolean isAttachedToWindow() { return true; }
            @Override public WindowInsets getRootWindowInsets() { return snapshot; }
        };
        container.setId(1234);
        int[] calls = {0};
        container.setOnApplyWindowInsetsListener((view, insets) -> {
            try {
                int mask = (Integer) filter.invoke(null, view, 655);
                Insets edges = insets.getInsets(mask & 255);
                view.setPadding(edges.left, edges.top, edges.right, edges.bottom);
                calls[0]++;
                return insets;
            } catch (Exception error) { throw new AssertionError(error); }
        });
        container.dispatchApplyWindowInsets(snapshot);
        Method layout = type.getDeclaredMethod("onGlobalLayout");
        layout.setAccessible(true);
        instance.set(null, settings.newInstance(new ProbeApplication(false, false)));
        layout.invoke(session);
        container.dispatchApplyWindowInsets(snapshot);
        checkPadding(container, 65, 68, "turn off");
        instance.set(null, settings.newInstance(new ProbeApplication(true, true)));
        layout.invoke(session);
        checkPadding(container, 0, 0, "re-enable with the same native insets");
        int count = calls[0];
        for (int index = 0; index < 20; index++) layout.invoke(session);
        if (calls[0] != count) throw new AssertionError("unchanged layout repeatedly dispatches insets");
        field(type, "subscription").set(session, null);
        instance.set(null, settings.newInstance(new ProbeApplication(false, false)));
        layout.invoke(session);
        if (calls[0] != count) throw new AssertionError("queued layout applied after pause");
        field(type, "subscription").set(session, (AutoCloseable) () -> { });
    }

    private static void checkPadding(View view, int left, int top, String label) {
        if (view.getPaddingLeft() != left || view.getPaddingTop() != top || view.getPaddingBottom() != 111)
            throw new AssertionError(label + ": wrong padding or keyboard inset lost");
    }

    private static void verifyRequests(ProbeActivity activity, Constructor<?> settings, Field instance, Object registry) throws Exception {
        int[] shown = {0};
        var controller = (android.view.WindowInsetsController) Proxy.newProxyInstance(
                android.view.WindowInsetsController.class.getClassLoader(), new Class<?>[] {android.view.WindowInsetsController.class},
                (p, method, args) -> { if (method.getName().equals("show")) { shown[0] |= (int) args[0]; return null; }
                    throw new UnsupportedOperationException(method.getName()); });
        Window original = activity.window;
        activity.window = new ProbeWindow(activity) {
            @Override public android.view.WindowInsetsController getInsetsController() { return controller; }
        };
        try {
            View decor = activity.window.getDecorView();
            int bars = WindowInsets.Type.statusBars() | WindowInsets.Type.navigationBars();
            for (int i = 0; i < 20; i++) {
                dev.twitchpatches.extension.ui.UiSettings.setSystemUiVisibility(decor, View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
                dev.twitchpatches.extension.ui.UiSettings.showSystemBars(controller, bars);
            }
            int flags = decor.getSystemUiVisibility();
            if (shown[0] != 0 || (flags & View.SYSTEM_UI_FLAG_FULLSCREEN) == 0 ||
                    (flags & View.SYSTEM_UI_FLAG_HIDE_NAVIGATION) == 0 || (flags & View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR) == 0)
                throw new AssertionError("host requests must be filtered before showing bars");
            dev.twitchpatches.extension.ui.UiSettings.showSystemBars(controller, WindowInsets.Type.ime());
            if (shown[0] != WindowInsets.Type.ime()) throw new AssertionError("IME request changed");
            instance.set(null, settings.newInstance(new ProbeApplication(false, false)));
            dev.twitchpatches.extension.ui.UiSettings.setSystemUiVisibility(decor, 0);
            dev.twitchpatches.extension.ui.UiSettings.showSystemBars(controller, bars);
            if (decor.getSystemUiVisibility() != 0 || (shown[0] & bars) != bars)
                throw new AssertionError("disabled overrides must pass through host requests");
            System.out.println("PASS host bar requests: no show/hide oscillation, independent IME and live disable");
        } finally { activity.window = original; instance.set(null, registry); }
    }

    private static Field field(Class<?> type, String name) throws Exception {
        Field value = type.getDeclaredField(name);
        value.setAccessible(true);
        return value;
    }

    private static void check(Method filter, Activity activity, int expected, String label) throws Exception {
        Object actual = filter.invoke(null, activity, 655);
        if (!Integer.valueOf(expected).equals(actual)) throw new AssertionError(label + ": expected " + expected + ", got " + actual);
    }

    private static void checkView(Method filter, View view, int expected, String label) throws Exception {
        Object actual = filter.invoke(null, view, 655);
        if (!Integer.valueOf(expected).equals(actual)) throw new AssertionError(label + ": expected " + expected + ", got " + actual);
    }

    private static final class ProbeApplication extends Application {
        private final boolean status, navigation;
        ProbeApplication(boolean status, boolean navigation) { this.status = status; this.navigation = navigation; }
        @Override public SharedPreferences getSharedPreferences(String name, int mode) {
            return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(), new Class<?>[] {SharedPreferences.class},
                    (proxy, method, args) -> {
                        if (method.getName().equals("contains")) return false;
                        if (method.getName().equals("getBoolean")) {
                            if (args[0].equals("fullscreen_hide_status_bar")) return status;
                            if (args[0].equals("fullscreen_hide_navigation_bar")) return navigation;
                            return false;
                        }
                        throw new UnsupportedOperationException(method.getName());
                    });
        }
    }

    private static final class ProbeActivity extends Activity {
        private Window window;
        private final Resources resources;
        int orientation = Configuration.ORIENTATION_LANDSCAPE;
        ProbeActivity(Window window, Context context) {
            this.window = window;
            Resources original = context.getResources();
            this.resources = new Resources(original.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
                @Override public String getResourceEntryName(int id) {
                    if (id == 1234) return "fullscreen_layout";
                    if (id == 1235) return "dialog_layout";
                    return super.getResourceEntryName(id);
                }
            };
            attachBaseContext(context);
        }
        @Override public Window getWindow() { return window; }
        @Override public Resources getResources() {
            resources.getConfiguration().orientation = orientation;
            return resources;
        }
        @Override public int getRequestedOrientation() { return ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE; }
    }
}
