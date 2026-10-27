import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.View;
import android.view.Window;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

final class UiFullscreenStateProbe {
    static void verify(Context context) throws Exception {
        ProbeActivity activity = new ProbeActivity(context);
        Class<?> type = Class.forName("dev.twitchpatches.extension.ui.UiFullscreenPolicy$Session");
        Constructor<?> constructor = type.getDeclaredConstructor(Activity.class);
        constructor.setAccessible(true);
        Object session = constructor.newInstance(activity);
        Method fullscreen = type.getDeclaredMethod("fullscreen", Activity.class);
        fullscreen.setAccessible(true);
        Field modern = type.getDeclaredField("modernFullscreen");
        modern.setAccessible(true);
        Field players = type.getDeclaredField("nativePlayers");
        players.setAccessible(true);
        Map<?, ?> nativePlayers = (Map<?, ?>) players.get(session);
        PlayerView root = new PlayerView(activity);
        check(fullscreen, session, activity, false, "Home in landscape");
        modern.setBoolean(session, true);
        check(fullscreen, session, activity, true, "modern fullscreen");
        modern.setBoolean(session, false);
        check(fullscreen, session, activity, false, "modern miniplayer");
        Map.class.getMethod("put", Object.class, Object.class).invoke(nativePlayers, root, true);
        check(fullscreen, session, activity, true, "native fullscreen");
        root.setPadding(65, 68, 135, 0);
        check(fullscreen, session, activity, true, "insets cannot change playback state");
        root.shown = false;
        check(fullscreen, session, activity, false, "hidden native player");
        root.shown = true;
        root.attached = false;
        check(fullscreen, session, activity, false, "detached native player");
        root.attached = true;
        Map.class.getMethod("put", Object.class, Object.class).invoke(nativePlayers, root, false);
        check(fullscreen, session, activity, false, "native miniplayer");
        modern.setBoolean(session, true);
        activity.orientation = Configuration.ORIENTATION_PORTRAIT;
        check(fullscreen, session, activity, false, "portrait before state propagation");
        activity.orientation = Configuration.ORIENTATION_LANDSCAPE;
        check(fullscreen, session, activity, true, "return to landscape");
        System.out.println("PASS fullscreen state: native/modern entry, minimization, attachment, orientation and inset independence");
    }

    private static void check(Method method, Object session, Activity activity, boolean expected, String label) throws Exception {
        if (!Boolean.valueOf(expected).equals(method.invoke(session, activity))) throw new AssertionError(label);
    }

    private static final class PlayerView extends View {
        boolean shown = true, attached = true;
        PlayerView(Context context) { super(context); }
        @Override public boolean isAttachedToWindow() { return attached; }
        @Override public boolean isShown() { return shown; }
    }

    private static final class ProbeActivity extends Activity {
        private final Window window;
        private final Resources resources;
        int orientation = Configuration.ORIENTATION_LANDSCAPE;
        ProbeActivity(Context context) {
            attachBaseContext(context);
            window = new ProbeWindow(context);
            Resources original = context.getResources();
            resources = new Resources(original.getAssets(), original.getDisplayMetrics(), original.getConfiguration());
        }
        @Override public Window getWindow() { return window; }
        @Override public Resources getResources() {
            resources.getConfiguration().orientation = orientation;
            return resources;
        }
    }
}
