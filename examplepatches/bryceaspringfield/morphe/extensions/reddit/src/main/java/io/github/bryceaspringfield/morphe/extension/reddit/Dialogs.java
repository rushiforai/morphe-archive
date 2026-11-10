package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;

import static io.github.bryceaspringfield.morphe.extension.reddit.Strings.t;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.preference.PreferenceScreen;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.Toolbar;
import android.util.Log;
import android.util.Pair;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.util.List;
import java.util.function.IntConsumer;

/**
 * The dialogs of this bundle's settings, drawn by Morphe Patches' own dialog classes (read by reflection, since this
 * bundle has no compile-time dependency on Morphe Patches) so they look like Morphe's; plain Android dialogs only
 * when those classes are missing.
 */
@SuppressWarnings("deprecation")
final class Dialogs {

    private static final String CUSTOM_DIALOG = "app.morphe.extension.shared.ui.CustomDialog";
    private static final String LIST_PREFERENCE =
            "app.morphe.extension.shared.settings.preference.CustomDialogListPreference";

    private Dialogs() {
    }

    static void toast(Context context, String message) {
        android.widget.Toast.makeText(context, message, android.widget.Toast.LENGTH_LONG).show();
    }

    /**
     * A text box styled like the one in Morphe's dialogs.
     */
    static EditText editText(Context context) {
        try {
            return (EditText) Class.forName(CUSTOM_DIALOG).getMethod("createEditText", Context.class)
                    .invoke(null, context);
        } catch (Exception ex) {
            return new EditText(context);
        }
    }

    /**
     * Shows a dialog with a message, {@code views} under it, an OK button running {@code onOk}, a Cancel button,
     * and a neutral button when {@code neutral} is set.
     */
    static void show(Context context, String title, CharSequence message, List<View> views, Runnable onOk,
                     String neutral, Runnable onNeutral) {
        title = t(title);
        message = t(message);
        neutral = t(neutral);
        try {
            Method create = Class.forName(CUSTOM_DIALOG).getMethod("create", Context.class, CharSequence.class,
                    CharSequence.class, EditText.class, CharSequence.class, Runnable.class, Runnable.class,
                    CharSequence.class, Runnable.class, boolean.class);
            Pair<?, ?> pair = (Pair<?, ?>) create.invoke(null, context, title, message, null, null, onOk,
                    (Runnable) () -> {
                    }, neutral, onNeutral, true);
            Dialog dialog = (Dialog) pair.first;
            LinearLayout layout = (LinearLayout) pair.second;
            for (View view : views) layout.addView(view, layout.getChildCount() - 1);
            dialog.show();
            resizeForKeyboard(dialog);
            return;
        } catch (Exception ex) {
            Log.w(TAG, "Morphe's dialog is missing; showing a plain one", ex);
        }
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (20 * context.getResources().getDisplayMetrics().density);
        layout.setPadding(pad, pad / 2, pad, 0);
        if (message != null) {
            TextView text = new TextView(context);
            text.setText(message);
            layout.addView(text);
        }
        for (View view : views) layout.addView(view);
        AlertDialog.Builder builder = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(layout)
                .setPositiveButton(android.R.string.ok, (d, w) -> onOk.run())
                .setNegativeButton(android.R.string.cancel, null);
        if (neutral != null) builder.setNeutralButton(neutral, (d, w) -> onNeutral.run());
        resizeForKeyboard(builder.show());
    }

    /** Fits the dialog above the keyboard, with its buttons, in place of letting the keyboard cover its bottom. */
    private static void resizeForKeyboard(Dialog dialog) {
        Window window = dialog.getWindow();
        if (window != null) window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    }

    /**
     * Shows Morphe's single-choice list: tapping an entry passes its index to {@code onPick} and closes the list.
     */
    static void choose(Context context, String title, String[] labels, int selected, IntConsumer onPick) {
        String[] values = new String[labels.length];
        for (int i = 0; i < labels.length; i++) values[i] = Integer.toString(i);
        try {
            Method create = Class.forName(LIST_PREFERENCE).getMethod("createListDialog", Context.class,
                    String.class, CharSequence[].class, CharSequence[].class, String.class, IntConsumer.class);
            ((Dialog) create.invoke(null, context, title, labels, values,
                    selected < 0 ? null : values[selected], onPick)).show();
            return;
        } catch (Exception ex) {
            Log.w(TAG, "Morphe's list dialog is missing; showing a plain one", ex);
        }
        new AlertDialog.Builder(context)
                .setTitle(title)
                .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                    onPick.accept(which);
                    dialog.dismiss();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static int themeColor(String method, int fallback) {
        try {
            return (Integer) Class.forName("app.morphe.extension.shared.theme.ThemeUtils").getMethod(method).invoke(null);
        } catch (Exception ex) {
            return fallback;
        }
    }

    /**
     * Gives a nested screen what Morphe's own settings page has: room for the status bar, and a toolbar with its
     * title and a back arrow.
     */
    static void screen(PreferenceScreen screen) {
        screen.setOnPreferenceClickListener(p -> {
            try {
                decorate(screen);
            } catch (Exception ex) {
                Log.e(TAG, "Could not add the screen's toolbar", ex);
            }
            return false;
        });
    }

    private static void decorate(PreferenceScreen screen) {
        Dialog dialog = screen.getDialog();
        if (dialog == null) return;
        Context context = dialog.getContext();
        int background = themeColor("getAppBackgroundColor", 0xFF000000);
        int foreground = themeColor("getAppForegroundColor", 0xFFFFFFFF);
        ViewGroup root = (ViewGroup) dialog.findViewById(android.R.id.content).getParent();
        root.setBackgroundColor(background);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setStatusBarColor(background);
            window.setNavigationBarColor(background);
            // Dark status and navigation bar icons on a light background, as on Morphe's own page.
            boolean light = Color.luminance(background) > 0.5f;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && window.getInsetsController() != null) {
                int bars = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                window.getInsetsController().setSystemBarsAppearance(light ? bars : 0, bars);
            } else {
                View decor = window.getDecorView();
                int flags = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                decor.setSystemUiVisibility(light ? decor.getSystemUiVisibility() | flags
                        : decor.getSystemUiVisibility() & ~flags);
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                Insets status = insets.getInsets(WindowInsets.Type.statusBars());
                Insets navigation = insets.getInsets(WindowInsets.Type.navigationBars());
                Insets cutout = insets.getInsets(WindowInsets.Type.displayCutout());
                view.setPadding(cutout.left, Math.max(status.top, cutout.top), cutout.right, navigation.bottom);
                return insets;
            });
        } else {
            root.setFitsSystemWindows(true);
        }

        TypedValue value = new TypedValue();
        int height = context.getTheme().resolveAttribute(android.R.attr.actionBarSize, value, true)
                ? TypedValue.complexToDimensionPixelSize(value.data, context.getResources().getDisplayMetrics())
                : (int) (56 * context.getResources().getDisplayMetrics().density);
        Toolbar toolbar = new Toolbar(context);
        toolbar.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        toolbar.setBackgroundColor(background);
        toolbar.setTitle(screen.getTitle());
        toolbar.setTitleTextColor(foreground);
        int icon = context.getResources().getIdentifier("icon_arrow_back", "drawable", context.getPackageName());
        if (icon != 0) {
            Drawable back = context.getDrawable(icon);
            if (back != null) {
                back = back.mutate();
                back.setTint(foreground);
                toolbar.setNavigationIcon(back);
            }
        }
        toolbar.setNavigationContentDescription(t("Back"));
        toolbar.setNavigationOnClickListener(view -> dialog.dismiss());
        toolbar.post(() -> {
            for (int i = 0; i < toolbar.getChildCount(); i++) {
                if (toolbar.getChildAt(i) instanceof TextView) ((TextView) toolbar.getChildAt(i)).setTextSize(18);
            }
        });
        root.addView(toolbar, 0);
    }
}
