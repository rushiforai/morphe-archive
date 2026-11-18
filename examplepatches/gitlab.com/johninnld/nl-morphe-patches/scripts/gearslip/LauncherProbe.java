package nl.johninnl.gearslip.probe;

import android.app.Instrumentation;
import android.content.ComponentName;
import android.os.Bundle;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/** Exercises the installed target's real launcher policy, not a copy of its source. */
public final class LauncherProbe extends Instrumentation {
    private int checks;
    private ClassLoader loader;
    private Method tiles;
    private Class<?> templateClass;
    private Class<?> mediaClass;
    private Bundle arguments;

    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        this.arguments = arguments == null ? new Bundle() : arguments;
        start();
    }

    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            loader = getTargetContext().getClassLoader();
            if (arguments.getString("mode", "launcher").equals("hidden")) {
                checkHidden();
                result.putString("result", "PASS " + checks + " actual-DEX exclusion checks");
                finish(-1, result);
                return;
            }
            templateClass = loader.loadClass("app.seb3thehacker.gearslip.host.TemplateApp");
            mediaClass = loader.loadClass("app.seb3thehacker.gearslip.media.MediaApp");
            for (Method method : loader.loadClass("app.seb3thehacker.gearslip.car.CallOverlayKt").getDeclaredMethods()) {
                if (method.getName().equals("access$tilesFor")) tiles = method;
            }
            if (tiles == null) throw new AssertionError("Target tile selection method missing");
            tiles.setAccessible(true);
            List<?> settingsPlayer = call("SETTINGS", true);
            require(count(settingsPlayer, "$Player") == 1, "SETTINGS service suppressed its player's tile");
            require(settingsPlayer.size() == 1 && count(settingsPlayer, "$Screen") == 0,
                    "SETTINGS service created an unusable second tile");
            require(count(call("SETTINGS", false), "$Screen") == 1, "Settings-only app changed");
            List<?> navigation = call("NAVIGATION", true);
            require(count(navigation, "$Screen") == 1 && count(navigation, "$Player") == 0,
                    "Navigation app lost precedence over incidental audio");
            require(count(call("MEDIA", true), "$Player") == 1, "Existing media player changed");
            require(count(call(null, true), "$Player") == 1, "Browser-only player changed");
            require(call(null, false).isEmpty(), "Empty app generated a tile");
            Class<?> known = loader.loadClass("app.seb3thehacker.gearslip.host.KnownApps");
            Set<?> hidden = (Set<?>) known.getField("hidden").get(null);
            require(hidden.contains("com.google.android.dialer"), "Built-in exclusions were lost");
            result.putString("result", "PASS " + checks + " actual-DEX launcher checks");
            finish(-1, result);
        } catch (Throwable failure) {
            result.putString("result", "FAIL after " + checks + " checks: " + failure);
            finish(1, result);
        }
    }

    private List<?> call(String category, boolean withPlayer) throws Exception {
        ComponentName component = new ComponentName("nl.johninnl.fixture", "nl.johninnl.fixture.Service");
        Object template = category == null ? null : templateClass
                .getConstructor(ComponentName.class, String.class, ArrayList.class)
                .newInstance(component, "Fixture", new ArrayList<>(Collections.singletonList("androidx.car.app.category." + category)));
        Object media = withPlayer ? mediaClass.getConstructor(ComponentName.class, String.class)
                .newInstance(component, "Fixture") : null;
        Object[] arguments = tiles.getParameterTypes().length == 4
                ? new Object[]{template, media, null, "Browse"} : new Object[]{template, media, null};
        return (List<?>) tiles.invoke(null, arguments);
    }

    private static int count(List<?> values, String suffix) {
        int count = 0;
        for (Object value : values) if (value.getClass().getName().endsWith(suffix)) count++;
        return count;
    }

    private void checkHidden() throws Exception {
        Class<?> known = loader.loadClass("app.seb3thehacker.gearslip.host.KnownApps");
        Set<?> hidden = (Set<?>) known.getField("hidden").get(null);
        require(hidden.contains("com.google.android.dialer"), "Built-in exclusions were lost");
        String packages = arguments.getString("hiddenPackages", "");
        for (String name : packages.split(",")) {
            if (!name.isEmpty()) require(hidden.contains(name), "Configured package is visible: " + name);
        }
        require(!hidden.contains("nl.johninnl.fixture.visible"), "Unconfigured package was hidden");
    }

    private void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        checks++;
    }
}
