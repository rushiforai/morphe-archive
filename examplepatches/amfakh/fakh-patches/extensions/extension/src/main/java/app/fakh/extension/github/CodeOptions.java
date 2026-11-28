/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.os.SystemClock;
import android.util.Log;
import android.view.Choreographer;

import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/**
 * The switches of the Code section on GitHub's Code Options screen: a row per switch, a slider for the tab width like the
 * one of the font size while its switch is on, and a preview that follows them. The screen is drawn with Compose, whose names are known only
 * when patching, so the patch hands over its classes. A Compose state, read while the screen is composed and changed
 * with every switch, has the screen drawn again.
 */
@SuppressWarnings("unused")
public final class CodeOptions {
    private static final String TAG = "FakhCodeOptions";
    private static final String TAB_FEATURE = "fakh_tab_width";
    // The widths of the slider's three stops.
    private static final List<Integer> WIDTHS = Arrays.asList(2, 4, 8);
    // The indent of the app's preview lines, which stands for one tab.
    private static final String INDENT = "&nbsp;&nbsp;&nbsp;&nbsp;";

    // The Compose state, a counter of the changes, with its getter and setter.
    private static Object state;
    private static Method get;
    private static Method set;
    // The state of the rows' scrolling, with the name of its method that moves it.
    private static WeakReference<Object> scroll = new WeakReference<>(null);
    private static String mover;

    private CodeOptions() {
    }

    /**
     * Prepares a screen that is being created.
     *
     * @param type   The app's class of a Compose state of a float.
     * @param getter The name of its method that reads the value.
     * @param setter The name of its method that changes the value.
     * @param move   The name of the method of the app's scroll state that scrolls by a distance and returns how far it
     *               got.
     */
    public static void open(Class<?> type, String getter, String setter, String move) {
        mover = move;
        if (state != null) return;
        try {
            get = type.getMethod(getter);
            set = type.getMethod(setter, float.class);
            state = type.getConstructor(float.class).newInstance(0f);
        } catch (ReflectiveOperationException error) {
            Log.w(TAG, "Screen state", error);
        }
    }

    /**
     * Keeps the scrolling of the rows of the screen being composed.
     *
     * @param state The app's scroll state.
     */
    public static void scroller(Object state) {
        scroll = new WeakReference<>(state);
    }

    /** @return The header above the rows. */
    public static String header() {
        return "Fakh Patches";
    }

    /**
     * The switch rows, the one of the tab width last, right above its slider. Switching that one off picks the app's
     * width, and on again the one picked before.
     *
     * @param function The app's name for a function of one argument.
     * @return Per row its title, whether it is on and what to call with the new position.
     */
    public static Object[] rows(Class<?> function) {
        subscribe();
        List<Object> rows = new ArrayList<>();
        for (Features.Feature feature : Features.all()) {
            if (!feature.section.equals("Code") || feature.id.equals(TAB_FEATURE)) continue;
            addRow(rows, function, feature, on -> {
            });
        }
        for (Features.Feature feature : Features.all()) {
            if (!feature.id.equals(TAB_FEATURE)) continue;
            addRow(rows, function, feature, on -> {
                MarkdownSettings.overrideTabWidth(on);
                if (on) showSlider();
            });
        }
        return rows.toArray();
    }

    /** Adds the row of a switch, which saves its position and passes it on. */
    private static void addRow(List<Object> rows, Class<?> function, Features.Feature feature,
            Consumer<Boolean> then) {
        rows.add(I18n.tr(feature.title));
        rows.add(Features.saved(feature.id));
        rows.add(function(function, arguments -> {
            boolean on = (Boolean) arguments[0];
            Features.set(feature.id, on);
            then.accept(on);
            changed();
            return null;
        }));
    }

    /** @return Whether there is a tab width slider: the Override tab width patch is applied. */
    public static boolean hasSlider() {
        return Features.has(TAB_FEATURE);
    }

    /** @return Whether the slider shows: its switch is on. */
    public static boolean sliderShown() {
        subscribe();
        return Features.saved(TAB_FEATURE);
    }

    /**
     * What draws the slider inside the animation that shows and hides it. While it fades out, it stays at the width it
     * had.
     *
     * @param content  The app's name for the function the animation draws, of three arguments.
     * @param function The app's name for a function of one argument.
     * @param owner    The class of the slider.
     * @return A function of the animation's scope, the composer and its flags.
     */
    public static Object slider(Class<?> content, Class<?> function, Class<?> owner) {
        Object listener = tabListener(function);
        return function(content, arguments -> {
            int width = sliderShown() ? MarkdownSettings.pickedTabWidth() : MarkdownSettings.lastTabWidth();
            drawSlider(owner, listener, Math.max(0, WIDTHS.indexOf(width)), arguments[1], 0);
            return null;
        });
    }

    /** Draws the slider at a stop. */
    private static void drawSlider(Class<?> owner, Object listener, int index, Object composer, int flags)
            throws ReflectiveOperationException {
        for (Method method : owner.getDeclaredMethods()) {
            if (method.getName().equals("fakhTabWidth")) method.invoke(null, null, listener, index, composer, flags);
        }
    }

    /** What the slider calls when it is let go: a function that takes the stop and saves its width. */
    private static Object tabListener(Class<?> function) {
        return function(function, arguments -> {
            Features.setText(MarkdownSettings.TAB_WIDTH, String.valueOf(WIDTHS.get((Integer) arguments[0])));
            changed();
            return null;
        });
    }

    /** @return The values of the slider's stops, of which only the number matters to the app. */
    public static List<Integer> widths() {
        return WIDTHS;
    }

    /**
     * What draws the slider again, in place of the app's code that would draw the font size slider.
     *
     * @param function The app's name for a function of two arguments.
     * @param owner    The class of the slider.
     * @param listener What the slider calls when it is let go.
     * @param index    The slider's stop.
     * @return A function of the composer that draws the slider.
     */
    public static Object restart(Class<?> function, Class<?> owner, Object listener, int index) {
        return function(function, arguments -> {
            drawSlider(owner, listener, index, arguments[0], 1);
            return null;
        });
    }

    /**
     * The lines of the preview as the switches show code: tabs as wide as picked, whitespace marked, and two lines for
     * links and two for a change, which the app's preview has none of. With the change, the whole preview is a diff.
     *
     * @param app The app's lines, as HTML with the tags of its syntax colors.
     * @return The lines to show.
     */
    public static List<String> lines(List<String> app) {
        subscribe();
        List<String> lines = new ArrayList<>(app);
        boolean diff = Features.has("fakh_hide_diff_signs");
        if (diff) {
            // A no-break space written as itself, which stays unmarked.
            boolean hidden = Features.on("fakh_hide_diff_signs");
            lines.add("<span>" + tag("ghmd", "pl-md", (hidden ? "\u00A0" : "-") + INDENT + "return&nbsp;nil")
                    + "</span>");
            lines.add("<span>" + tag("ghmi1", "pl-mi1", (hidden ? "\u00A0" : "+") + INDENT + "return&nbsp;n")
                    + "</span>");
        }
        boolean marked = Features.on("fakh_whitespace");
        int width = Features.has(TAB_FEATURE) ? MarkdownSettings.pickedTabWidth() : 4;
        StringBuilder tab = new StringBuilder(marked ? tag("ghc", "pl-c", "»") : "&nbsp;");
        for (int column = 1; column < width; column++) tab.append("&nbsp;");
        for (int i = 0; i < lines.size(); i++) {
            String line = lines.get(i).replace(INDENT, "\t");
            if (marked) line = line.replace("&nbsp;", tag("ghc", "pl-c", "·"));
            lines.set(i, line.replace("\t", tab));
        }
        if (Features.has("fakh_linkify_code")) {
            // Added after the marking: the app loses a tag's color when the same tag sits inside it, as a mark would
            // in a comment, so the space here takes the comment's color.
            String space = marked ? "\u00B7" : "&nbsp;";
            int at = app.size();
            for (String link : new String[]{"https://cli.github.com", "cli/cli#1"}) {
                if (Features.on("fakh_linkify_code")) link = tag("ghcorl", "pl-corl", link);
                lines.add(at++, "<span>" + tag("ghc", "pl-c", "//" + space + link) + "</span>");
            }
        }
        if (diff) {
            // The lines before the two of the change get the column their sign would take, unmarked as in a diff.
            for (int i = 0; i < lines.size() - 2; i++) {
                lines.set(i, lines.get(i).replaceFirst("<span>", "<span>\u00A0"));
            }
        }
        return lines;
    }

    /** Keeps the rows at their end, where the slider is, while it grows into view. */
    private static void showSlider() {
        Object state = scroll.get();
        if (state == null) return;
        long end = SystemClock.uptimeMillis() + 600;
        Choreographer.getInstance().postFrameCallback(new Choreographer.FrameCallback() {
            @Override
            public void doFrame(long time) {
                boolean last = SystemClock.uptimeMillis() >= end;
                // The distance to the end: as far as a long scroll gets. A part of it is kept each frame, all of it
                // with the last.
                float distance = scrollBy(state, Integer.MAX_VALUE);
                scrollBy(state, (last ? 0 : -0.75f) * distance);
                if (!last) Choreographer.getInstance().postFrameCallback(this);
            }
        });
    }

    /** Scrolls by a distance and returns how far that got, or 0 without a way to scroll. */
    private static float scrollBy(Object state, float distance) {
        try {
            return (Float) state.getClass().getMethod(mover, float.class).invoke(state, distance);
        } catch (ReflectiveOperationException error) {
            Log.w(TAG, "Scroll", error);
            return 0;
        }
    }

    /** A text in one of the tags the app colors. */
    private static String tag(String name, String style, String text) {
        return "<" + name + " class=\"" + style + "\">" + text + "</" + name + ">";
    }

    /** Reads the state, which has the part of the screen being composed drawn again once it changes. */
    private static void subscribe() {
        read();
    }

    /** Changes the state, so the screen is drawn again. */
    private static void changed() {
        try {
            if (state != null) set.invoke(state, read() + 1);
        } catch (ReflectiveOperationException error) {
            Log.w(TAG, "Screen state", error);
        }
    }

    /** The value of the state, or 0 without one. */
    private static float read() {
        try {
            return state == null ? 0 : (Float) get.invoke(state);
        } catch (ReflectiveOperationException error) {
            Log.w(TAG, "Screen state", error);
            return 0;
        }
    }

    /** The code of a function of the app. */
    private interface Body {
        Object run(Object[] arguments) throws ReflectiveOperationException;
    }

    /** An object of one of the app's function types. */
    private static Object function(Class<?> type, Body body) {
        InvocationHandler handler = (proxy, method, arguments) -> {
            if (method.getDeclaringClass() != Object.class) return body.run(arguments);
            switch (method.getName()) {
                case "equals":
                    return proxy == arguments[0];
                case "hashCode":
                    return System.identityHashCode(proxy);
                default:
                    return TAG;
            }
        };
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, handler);
    }
}
