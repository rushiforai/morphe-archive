import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Color;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.SettingEntry;
import dev.twitchpatches.extension.settings.SettingsWindow;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.ui.UiFeatureRegistry;
import dev.twitchpatches.extension.ui.UiSettings;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.Set;

public final class SettingsWindowProbe {
    static void verify(Context context) throws Exception {
        Field uiInstance = field(UiSettings.class, "instance");
        Field patchInstance = field(PatchSettings.class, "instance");
        Object previousUi = uiInstance.get(null), previousPatches = patchInstance.get(null);
        Application application = new Application() {
            @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                SharedPreferences.Editor editor = (SharedPreferences.Editor) Proxy.newProxyInstance(
                        SharedPreferences.Editor.class.getClassLoader(), new Class<?>[] {SharedPreferences.Editor.class},
                        (proxy, method, args) -> method.getReturnType() == SharedPreferences.Editor.class ? proxy : null);
                return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                        new Class<?>[] {SharedPreferences.class}, (proxy, method, args) -> {
                            if (method.getName().equals("edit")) return editor;
                            if (method.getReturnType() == boolean.class) return false;
                            throw new UnsupportedOperationException(method.getName());
                        });
            }
        };
        var constructor = UiSettings.class.getDeclaredConstructor(Application.class);
        constructor.setAccessible(true);
        UiSettings settings = constructor.newInstance(application);
        UiFeatureRegistry registry = (UiFeatureRegistry) field(UiSettings.class, "features").get(settings);
        // The standalone extension does not contain Twitch's generated Compose bridge.
        ((Set<?>) field(UiFeatureRegistry.class, "listeners").get(registry)).clear();
        ToggleSetting status = registry.options().stream().filter(option -> option.key().equals("fullscreen_hide_status_bar")).findFirst().orElseThrow();
        ToggleSetting navigation = registry.options().stream().filter(option -> option.key().equals("fullscreen_hide_navigation_bar")).findFirst().orElseThrow();
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.orientation = Configuration.ORIENTATION_LANDSCAPE;
        Window window = new ProbeWindow(context.createConfigurationContext(configuration));
        int original = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        window.getDecorView().setSystemUiVisibility(original);
        AutoCloseable session = null;
        try {
            uiInstance.set(null, settings);
            patchInstance.set(null, null);
            PatchSettings.initialize(application);
            PatchSettings.register((SettingEntry) settings);
            int listeners = ((Set<?>) field(UiFeatureRegistry.class, "listeners").get(registry)).size();
            session = SettingsWindow.bind(window, Color.BLACK);
            var refresh = (ViewTreeObserver.OnGlobalLayoutListener) session;
            for (int cycle = 0; cycle < 3; cycle++) {
                status.setEnabled(true); navigation.setEnabled(true); refresh.onGlobalLayout();
                check(window.getAttributes().layoutInDisplayCutoutMode == 1, "cutout enabled");
                check((window.getDecorView().getSystemUiVisibility() & View.SYSTEM_UI_FLAG_HIDE_NAVIGATION) != 0, "navigation hidden");
                status.setEnabled(false); refresh.onGlobalLayout();
                check(window.getAttributes().layoutInDisplayCutoutMode == 0, "cutout restored without reopening");
                check((window.getDecorView().getSystemUiVisibility() & View.SYSTEM_UI_FLAG_HIDE_NAVIGATION) != 0, "navigation remains independent");
                navigation.setEnabled(false); refresh.onGlobalLayout();
                check(window.getDecorView().getSystemUiVisibility() == original, "original flags restored");
            }
            status.setEnabled(true); navigation.setEnabled(true); refresh.onGlobalLayout();
            window.getContext().getResources().getConfiguration().orientation = Configuration.ORIENTATION_PORTRAIT;
            refresh.onGlobalLayout();
            check(window.getAttributes().layoutInDisplayCutoutMode == 0, "portrait restores cutout");
            check(window.getDecorView().getSystemUiVisibility() == original, "portrait restores system bars");
            window.getContext().getResources().getConfiguration().orientation = Configuration.ORIENTATION_LANDSCAPE;
            refresh.onGlobalLayout();
            session.close(); session = null;
            check(window.getAttributes().layoutInDisplayCutoutMode == 0, "stop restores original cutout");
            check(((Set<?>) field(UiFeatureRegistry.class, "listeners").get(registry)).size() == listeners, "stop removes subscription");
            refresh.onGlobalLayout();
            check(window.getAttributes().layoutInDisplayCutoutMode == 0, "queued refresh after stop ignored");
            check((window.getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST) == WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                    "keyboard resizing retained");
        } finally {
            if (session != null) session.close();
            uiInstance.set(null, previousUi); patchInstance.set(null, previousPatches);
        }
    }

    private static Field field(Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name); field.setAccessible(true); return field;
    }
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
}
