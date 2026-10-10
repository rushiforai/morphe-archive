package app.noam.extension.chesscom.arrows;

import android.app.Activity;
import android.content.Context;
import android.view.View;

import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.Deque;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.theme.Accent;
import kotlin.jvm.functions.Function0;

/**
 * Arrows and Clear in the Compose bottom bar of bot and coach games. The bar reads our Compose
 * state while drawing them, so it redraws them whenever that state changes.
 */
public final class ArrowsBar {
    /** The state (a counter), made by the patch with the app's own mutableStateOf. */
    private static Object state;
    private static Method getValue, setValue;

    private static final Function0<Object> ARROWS = () -> {
        View screen = screen();
        if (screen != null) Arrows.toggleDrawing(screen);
        return null;
    };

    private static final Function0<Object> CLEAR = () -> {
        View screen = screen();
        if (screen != null) Arrows.clear(screen);
        return null;
    };

    private ArrowsBar() {}

    public static boolean show() {
        return Arrows.enabled();
    }

    public static boolean needsState() {
        return state == null;
    }

    /** Keeps the state and finds its value getter (State's one method) and setter (MutableState's). */
    public static void bind(Object created) {
        try {
            Method getter = null, setter = null;
            Deque<Class<?>> types = new ArrayDeque<>();
            for (Class<?> type = created.getClass(); type != null; type = type.getSuperclass()) {
                for (Class<?> implemented : type.getInterfaces()) types.add(implemented);
            }
            while (!types.isEmpty()) {
                Class<?> type = types.poll();
                Method[] methods = type.getDeclaredMethods();
                if (methods.length == 1 && methods[0].getParameterTypes().length == 0 && methods[0].getReturnType() == Object.class) {
                    getter = methods[0];
                }
                for (Method method : methods) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if (parameters.length == 1 && parameters[0] == Object.class && method.getReturnType() == void.class) setter = method;
                }
                for (Class<?> parent : type.getInterfaces()) types.add(parent);
            }
            if (getter == null || setter == null) throw new IllegalStateException("Not a mutable state: " + created.getClass());
            getValue = getter;
            setValue = setter;
            state = created;
        } catch (Throwable throwable) {
            Utils.logError("Arrows bar state failed", throwable);
        }
    }

    /** Arrows or Clear changed: the bar draws its buttons again. */
    static void changed() {
        if (state == null) return;
        try {
            Object value = getValue.invoke(state);
            setValue.invoke(state, value instanceof Integer ? (Integer) value + 1 : 0);
        } catch (Throwable throwable) {
            Utils.logError("Arrows bar update failed", throwable);
        }
    }

    /** Reading the state while the bar is drawn makes the bar follow it. */
    private static void read() {
        if (state == null) return;
        try {
            getValue.invoke(state);
        } catch (Throwable ignored) {
            // Drawn once, without updates.
        }
    }

    /** The Arrows button's colour as a Compose colour: the accent while drawing, else 0 (the usual colour). */
    public static long arrowsColor() {
        read();
        View screen = screen();
        if (screen == null || !Arrows.drawing(screen)) return 0;
        return ((long) Accent.current() & 0xFFFFFFFFL) << 32;
    }

    public static boolean clearEnabled() {
        read();
        View screen = screen();
        return screen != null && Arrows.hasMarks(screen);
    }

    public static int arrowsIcon() {
        return Utils.resourceId("glyph_arrow_line_diagonal_top_right", "drawable");
    }

    public static int clearIcon() {
        return Utils.resourceId("glyph_board_simple_badge_cross", "drawable");
    }

    public static String arrowsLabel() {
        return string("morphe_arrows", "Arrows");
    }

    public static String clearLabel() {
        return string("morphe_clear_arrows", "Clear");
    }

    public static Function0<Object> onArrows() {
        return ARROWS;
    }

    public static Function0<Object> onClear() {
        return CLEAR;
    }

    private static String string(String name, String fallback) {
        Context context = Utils.context();
        int id = Utils.resourceId(name, "string");
        return context != null && id != 0 ? context.getString(id) : fallback;
    }

    private static View screen() {
        Activity activity = Utils.resumedActivity();
        return activity == null ? null : activity.getWindow().getDecorView();
    }
}
