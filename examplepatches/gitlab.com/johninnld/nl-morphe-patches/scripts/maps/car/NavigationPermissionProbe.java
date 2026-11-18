package nl.johninnl.mapsprojectionprobe;

import android.app.Instrumentation;
import android.os.Bundle;
import java.lang.reflect.Constructor;

/** Executes the emitted Maps preflight while preserving the actual optional-speed flag. */
public final class NavigationPermissionProbe extends Instrumentation {
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Class<?> type = getTargetContext().getClassLoader().loadClass("tpr");
            Constructor<?> constructor = type.getDeclaredConstructor(boolean.class, boolean.class);
            constructor.setAccessible(true);
            int checks = 0;
            for (boolean location : new boolean[]{false, true}) for (boolean speed : new boolean[]{false, true}) {
                Object policy = constructor.newInstance(location, speed);
                boolean ready = (Boolean) type.getMethod("a").invoke(policy);
                if (ready != location) throw new AssertionError("GPS readiness was blocked or granted incorrectly: location=" + location + ", speed=" + speed);
                checks++;
                if (type.getField("b").getBoolean(policy) != speed) throw new AssertionError("Optional vehicle-speed permission was fabricated");
                checks++;
            }
            result.putString("result", "PASS " + checks + " emitted-DEX GPS/optional-speed preflight checks");
        } catch (Throwable error) { result.putString("result", "FAIL " + android.util.Log.getStackTraceString(error)); }
        finish(-1, result);
    }
}
