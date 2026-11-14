package android.view;

import android.graphics.Insets;
import android.graphics.Rect;
import android.util.Log;

import java.lang.reflect.Constructor;

/**
 * Android 10's WindowInsets.Builder for Android 9, where the class does not exist (patch "Android 9 (API 28)"). A
 * top-level class under the nested class's binary name; loaded only on Android 9 (classes load parent first). AndroidX
 * and the core patch's ApiCompat build insets with it.
 * <p>
 * Without a source, build() uses WindowInsets' hidden constructor that takes the system window insets (on Android 9's
 * light greylist, so allowed); with one, the public copy constructor and replaceSystemWindowInsets. Android 9 has no
 * allowed way to set stable insets: they stay as in the source (consumed without one), which ApiCompat's API 29
 * fallbacks already handle.
 */
public final class WindowInsets$Builder {
    private static final String TAG = "MorpheAndroid9";
    private static Constructor<WindowInsets> systemInsetsConstructor;
    private static boolean stableLogged;

    private final WindowInsets source;
    private Insets systemWindowInsets;
    private Insets stableInsets;

    public WindowInsets$Builder() {
        source = null;
    }

    public WindowInsets$Builder(WindowInsets insets) {
        if (insets == null) throw new NullPointerException("insets");
        source = insets;
    }

    public WindowInsets$Builder setSystemWindowInsets(Insets systemWindowInsets) {
        if (systemWindowInsets == null) throw new NullPointerException("systemWindowInsets");
        this.systemWindowInsets = systemWindowInsets;
        return this;
    }

    public WindowInsets$Builder setStableInsets(Insets stableInsets) {
        if (stableInsets == null) throw new NullPointerException("stableInsets");
        this.stableInsets = stableInsets;
        return this;
    }

    public WindowInsets build() {
        WindowInsets result;
        if (source != null) {
            result = new WindowInsets(source);
            if (systemWindowInsets != null) {
                result = result.replaceSystemWindowInsets(systemWindowInsets.left, systemWindowInsets.top,
                        systemWindowInsets.right, systemWindowInsets.bottom);
            }
        } else {
            Rect system = systemWindowInsets == null ? null : new Rect(systemWindowInsets.left, systemWindowInsets.top,
                    systemWindowInsets.right, systemWindowInsets.bottom);
            result = withSystemInsets(system);
        }
        if (stableInsets != null && !stableLogged) {
            stableLogged = true;
            Log.w(TAG, "Android 9: WindowInsets.Builder keeps the stable insets of its source");
        }
        return result;
    }

    private static WindowInsets withSystemInsets(Rect system) {
        try {
            Constructor<WindowInsets> constructor = systemInsetsConstructor;
            if (constructor == null) {
                constructor = WindowInsets.class.getDeclaredConstructor(Rect.class);
                constructor.setAccessible(true);
                systemInsetsConstructor = constructor;
            }
            return constructor.newInstance(system);
        } catch (ReflectiveOperationException | RuntimeException exception) {
            throw new IllegalStateException("Android 9: WindowInsets(Rect) is not available", exception);
        }
    }
}
