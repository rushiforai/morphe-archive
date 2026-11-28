/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inspector.WindowInspector;
import android.widget.ImageButton;
import android.widget.ImageView;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.Features;

/**
 * Two buttons of the markdown toolbars, each with its own switch: one puts a collapsible section in the text and one a
 * table, around what is selected. The text goes in the way a keyboard types it, so the same code serves the Compose
 * editors and the one made of views. Android before 10 cannot say which window has the focus, so it gets no buttons.
 */
@SuppressWarnings("unused")
public final class CommentToolbar {
    private static final String TAG = "FakhCommentToolbar";
    private static final String TABLE = "fakh_table_button";
    // For each button: its switch, then its icon and its label, both added by the patch.
    private static final String[][] BUTTONS = {
            {"fakh_details_button", "ic_unfold_24", "fakh_markdown_details"},
            {TABLE, "fakh_table_24", "fakh_markdown_table"},
    };

    private CommentToolbar() {
    }

    /**
     * The buttons' places in a Compose toolbar.
     *
     * @param content The app's name for a composable function of three arguments.
     * @param click   The app's name for a function without arguments.
     * @param toolbar The class that draws the toolbar.
     * @param button  The name of its method that draws one button: icon, label, flags, action, composer and modifier.
     * @return What each added item of the toolbar draws; empty with both switches off.
     */
    public static Object[] items(Class<?> content, Class<?> click, Class<?> toolbar, String button) {
        List<String[]> shown = shown();
        if (shown.isEmpty()) return new Object[0];
        Context context = context();
        for (Method draw : toolbar.getDeclaredMethods()) {
            Class<?>[] types = draw.getParameterTypes();
            if (context == null || !draw.getName().equals(button) || types.length != 6 || types[3] != click) continue;
            Object[] items = new Object[shown.size()];
            for (int index = 0; index < items.length; index++) {
                boolean table = TABLE.equals(shown.get(index)[0]);
                int icon = id(context, shown.get(index)[1], "drawable");
                int label = id(context, shown.get(index)[2], "string");
                Object action = function(click, arguments -> {
                    insert(table);
                    return null;
                });
                items[index] = function(content, arguments -> draw.invoke(null, icon, label, 0, action, arguments[1],
                        null));
            }
            return items;
        }
        Log.w(TAG, "Toolbar button not found");
        return new Object[0];
    }

    /**
     * Adds the buttons to a toolbar of views.
     *
     * @param toolbar The app's markdown toolbar.
     */
    public static void attach(View toolbar) {
        Context context = toolbar.getContext();
        ViewGroup actions = toolbar.findViewById(id(context, "markdown_bar_actions", "id"));
        if (actions == null || actions.findViewWithTag(TAG) != null) return;
        float density = context.getResources().getDisplayMetrics().density;
        for (String[] shown : shown()) {
            boolean table = TABLE.equals(shown[0]);
            ImageButton button = new ImageButton(context);
            button.setTag(TAG);
            button.setImageResource(id(context, shown[1], "drawable"));
            button.setScaleType(ImageView.ScaleType.FIT_CENTER);
            TypedValue value = new TypedValue();
            context.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, value, true);
            button.setBackgroundResource(value.resourceId);
            button.setImageTintList(ColorStateList.valueOf(context.getColor(id(context, "textPrimary", "color"))));
            String label = context.getString(id(context, shown[2], "string"));
            button.setContentDescription(label);
            button.setTooltipText(label);
            // A 24 dp icon in a 44 dp touch target.
            int pad = Math.round(10 * density);
            button.setPadding(pad, pad, pad, pad);
            button.setOnClickListener(v -> insert(table));
            actions.addView(button, new ViewGroup.LayoutParams(Math.round(44 * density), Math.round(44 * density)));
        }
    }

    /** The code of a function of the app. */
    private interface Body {
        Object run(Object[] arguments) throws ReflectiveOperationException;
    }

    /** An object of one of the app's function types, whose names are known only when patching. */
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
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {type}, handler);
    }

    /** The buttons the toolbars get: those switched on. */
    private static List<String[]> shown() {
        List<String[]> shown = new ArrayList<>();
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return shown;
        for (String[] button : BUTTONS) {
            if (Features.on(button[0])) shown.add(button);
        }
        return shown;
    }

    /** The app's resource of this name and type. */
    @SuppressLint("DiscouragedApi")
    private static int id(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    /** A context of the app, or null before it shows a window. */
    @SuppressLint("NewApi")
    private static Context context() {
        for (View root : WindowInspector.getGlobalWindowViews()) return root.getContext();
        return null;
    }

    /** Types into the focused text field, as a keyboard would. */
    @SuppressLint("NewApi")
    private static void insert(boolean table) {
        View focused = null;
        for (View root : WindowInspector.getGlobalWindowViews()) {
            if (root.hasWindowFocus()) focused = root.findFocus();
        }
        InputConnection input = focused == null ? null : focused.onCreateInputConnection(new EditorInfo());
        if (input == null) {
            Log.w(TAG, "No text field has the focus");
            return;
        }
        // A word the keyboard is still composing would be replaced.
        input.finishComposingText();
        CharSequence before = input.getTextBeforeCursor(Integer.MAX_VALUE / 2, 0);
        CharSequence selected = input.getSelectedText(0);
        if (before != null) {
            String[] parts = parts(table, before.toString(), selected == null ? "" : selected.toString());
            int cursor = before.length() + parts[0].length();
            input.beginBatchEdit();
            input.commitText(parts[0] + parts[1], 1);
            input.setSelection(cursor, cursor);
            input.endBatchEdit();
        }
        input.closeConnection();
    }

    /**
     * What replaces the selection, split where the cursor goes.
     *
     * @param table    Whether to make a table instead of a collapsible section.
     * @param before   The text in front of the selection.
     * @param selected The selected text.
     * @return What precedes the cursor and what follows it.
     */
    static String[] parts(boolean table, String before, String selected) {
        // Both need an empty line before them to be read as blocks.
        String gap = before.isEmpty() || before.endsWith("\n\n") ? "" : before.endsWith("\n") ? "\n" : "\n\n";
        if (table) {
            return new String[] {gap + "| Column 1 | Column 2 |\n| --- | --- |\n| " + selected,
                    " |  |\n|  |  |\n"};
        }
        return new String[] {gap + "<details>\n<summary>Details</summary>\n\n" + selected, "\n\n</details>\n"};
    }
}
