import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Looper;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import dev.twitchpatches.extension.reload.NativeReloadHost;
import dev.twitchpatches.extension.reload.NativeReloadOwner;
import dev.twitchpatches.extension.reload.NativeReloadViews;
import dev.twitchpatches.extension.reload.ReloadRuntime;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public final class ReloadViewProbe {
    public static void main(String[] args) {
        try { run(); }
        catch (Throwable error) { error.printStackTrace(); System.exit(1); }
    }

    private static void run() throws Exception {
        if (Looper.getMainLooper() == null) Looper.prepareMainLooper();
        Class<?> thread = Class.forName("android.app.ActivityThread");
        Object system = thread.getMethod("systemMain").invoke(null);
        Context context = (Context) thread.getMethod("getSystemContext").invoke(system);
        context = new ContextThemeWrapper(context, android.R.style.Theme_Material);
        Resources base = context.getResources();
        Resources symbols = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String pkg) {
                return "twitchpatches_reload_button".equals(name) ? 1235 : 0;
            }
        };
        FrameLayout root = new FrameLayout(context) {
            @Override public boolean isAttachedToWindow() { return true; }
            @Override public Resources getResources() { return symbols; }
        };
        ImageView volume = new ImageView(context), reload = new ImageView(context);
        volume.setId(1234); reload.setId(1235);
        root.addView(volume); root.addView(reload);
        Constructor<?> constructor = ReloadRuntime.class.getDeclaredConstructor(Application.class);
        constructor.setAccessible(true);
        Field instance = ReloadRuntime.class.getDeclaredField("instance");
        instance.setAccessible(true);
        Method refresh = NativeReloadViews.class.getDeclaredMethod("refreshPreferences");
        refresh.setAccessible(true);
        instance.set(null, constructor.newInstance(new Preferences(true)));
        Owner first = new Owner(), second = new Owner();
        NativeReloadViews.install(root, first, true, 1234);
        if (!reload.isEnabled()) throw new AssertionError("initial player binding");
        first.player = null;
        refresh.invoke(null);
        if (reload.isEnabled()) throw new AssertionError("released player remains enabled");
        NativeReloadViews.install(root, second, true, 1234);
        if (!reload.isEnabled()) throw new AssertionError("reused controls retained the released player");
        for (int cycle = 0; cycle < 3; cycle++) {
            instance.set(null, constructor.newInstance(new Preferences(false)));
            refresh.invoke(null);
            if (reload.getVisibility() != View.GONE) throw new AssertionError("disable");
            instance.set(null, constructor.newInstance(new Preferences(true)));
            NativeReloadViews.install(root, second, true, 1234);
            if (reload.getVisibility() != View.VISIBLE || !reload.isEnabled()) throw new AssertionError("live restore");
        }
        volume.setEnabled(false);
        refresh.invoke(null);
        if (reload.isEnabled()) throw new AssertionError("native disabled controls ignored");
        volume.setEnabled(true);
        refresh.invoke(null);
        if (!reload.isEnabled()) throw new AssertionError("native enabled controls not restored");
        instance.set(null, null);
        System.out.println("PASS Reload views: initial binding, player release, reused controls, repeated preferences and native availability");
    }

    private static final class Owner implements NativeReloadOwner {
        NativeReloadHost player = new NativeReloadHost() {
            private final Object identity = new Object();
            @Override public Object reloadIdentity() { return identity; }
            @Override public boolean reloadNativeStream() { return true; }
        };
        @Override public Object reloadControlsOwner() { return player; }
    }

    private static final class Preferences extends Application {
        private final boolean enabled;
        Preferences(boolean enabled) { this.enabled = enabled; }
        @Override public SharedPreferences getSharedPreferences(String name, int mode) {
            return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                    new Class<?>[] { SharedPreferences.class }, (proxy, method, args) -> {
                        if (method.getName().equals("getBoolean")) return enabled;
                        throw new UnsupportedOperationException(method.getName());
                    });
        }
    }
}
