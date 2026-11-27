/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.InputType;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RowDrag;
import app.fakh.extension.shared.TabSheet;

/**
 * The Fakh Patches rows that open a sheet: the tabs of the navigation bar, its landscape position, the tab width and
 * the download folder. Each is the shared {@link TabSheet}, drawn in the colors of the app's own sheets. The patch tells this class the Settings
 * fragment, and adds a helper to it that sets the summary of a row.
 */
final class ChoiceSheets {
    /** Keys of the rows that open a sheet. */
    static final String NAV_TABS = "fakh_nav_tabs";
    static final String NAV_POSITION = "fakh_nav_position";
    static final String DOWNLOAD_FOLDER = AssetsDownload.FOLDER_KEY;
    static final String TAB_WIDTH = "fakh_tab_width";
    private static final int[] TAB_WIDTHS = {2, 4, 8};
    private static final String SETTINGS_FRAGMENT = "com.github.android.settings.SettingsFragment";
    private static final String TAG = "FakhPatches";

    private static WeakReference<Object> fragment = new WeakReference<>(null);
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    /** The preference of each row, to update its summary when the user chooses. */
    private static final Map<String, WeakReference<Object>> rows = new HashMap<>();

    private ChoiceSheets() {
    }

    /** Whether the row with this key opens a sheet instead of being a switch. */
    static boolean opens(String key) {
        return NAV_TABS.equals(key) || NAV_POSITION.equals(key) || DOWNLOAD_FOLDER.equals(key) || TAB_WIDTH.equals(key);
    }

    /** The Settings fragment, which the sheets are shown from. */
    static void settings(Object settings) {
        fragment = new WeakReference<>(settings);
    }

    /** Opens the sheet of the row [key] that the user tapped. */
    static void open(Activity from, String key, Object preference) {
        Object settings = fragment.get();
        if (settings == null) return;
        activity = new WeakReference<>(from);
        rows.put(key, new WeakReference<>(preference));
        try {
            if (NAV_TABS.equals(key)) openTabs();
            else if (DOWNLOAD_FOLDER.equals(key)) openDownloadFolder();
            else if (TAB_WIDTH.equals(key)) openTabWidth();
            else openPosition();
        } catch (RuntimeException error) {
            Log.w(TAG, "Choice sheet", error);
        }
    }

    /**
     * The sheet of tabs: a row per tab of the bar with its icon, a check while the tab is shown, and a handle to drag
     * it to another place. Home is checked, disabled and stays first. The bar is built once, so a restart is offered
     * when the sheet closes after a change.
     */
    private static void openTabs() {
        Activity from = activity.get();
        if (from == null || NavigationBar.allTabs.isEmpty()) return;
        int[] colors = colors(from);
        int surface = colors[0];
        int text = colors[1];
        int secondary = colors[2];
        int accent = colors[3];
        float density = from.getResources().getDisplayMetrics().density;
        int size = Math.round(24 * density);
        int grip = from.getResources().getIdentifier("drag_indicator_24", "drawable", from.getPackageName());
        boolean[] changed = {false};
        LinearLayout rows = new LinearLayout(from);
        rows.setOrientation(LinearLayout.VERTICAL);
        for (Object tab : NavigationBar.allTabs) {
            String name = NavigationBar.labelName(tab);
            int label = NavigationBar.labelId(tab);
            boolean home = NavigationBar.HOME_TAB.equals(name);
            LinearLayout row = (LinearLayout) TabSheet.checkRow(from, label == 0 ? name : from.getString(label),
                    !NavigationBar.hidden(name), !home, text, accent, checked -> {
                        Features.set(NavigationBar.HIDE_TAB + name, !checked);
                        changed[0] = true;
                    });
            row.setTag(name);
            ImageView icon = new ImageView(from);
            int iconId = NavigationBar.iconId(tab);
            if (iconId != 0) {
                Drawable drawable = from.getDrawable(iconId).mutate();
                drawable.setTint(text);
                icon.setImageDrawable(drawable);
            }
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(size, size);
            iconParams.setMarginEnd(Math.round(16 * density));
            row.addView(icon, 0, iconParams);
            ImageView handle = new ImageView(from);
            if (!home) {
                if (grip != 0) {
                    Drawable drawable = from.getDrawable(grip).mutate();
                    drawable.setTint(secondary);
                    handle.setImageDrawable(drawable);
                }
                handle.setOnTouchListener(new RowDrag(rows, row, surface, () -> {
                    StringBuilder order = new StringBuilder();
                    for (int i = 1; i < rows.getChildCount(); i++) {
                        if (order.length() > 0) order.append(',');
                        order.append(rows.getChildAt(i).getTag());
                    }
                    Features.setText(NavigationBar.TAB_ORDER, order.toString());
                    changed[0] = true;
                }));
            }
            LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(size, size);
            handleParams.setMarginEnd(Math.round(12 * density));
            row.addView(handle, 0, handleParams);
            rows.addView(row);
        }
        TabSheet.show(from, from.findViewById(android.R.id.content), I18n.tr("Navigation bar tabs"),
                I18n.tr("Home is always shown first. Drag the handle to sort."), surface, text, secondary, rows, () -> {
                    if (!changed[0]) return;
                    refreshSummary(NAV_TABS);
                    MaterialYou.showRestartBar(from);
                });
    }

    /** The sheet of the landscape bar position: left or right, chosen with a tap, which also closes it. */
    private static void openPosition() {
        Activity from = activity.get();
        if (from == null) return;
        int[] colors = colors(from);
        TabSheet[] sheet = new TabSheet[1];
        View rows = TabSheet.radioRows(from, new String[] {I18n.tr("Left"), I18n.tr("Right")},
                Features.saved(NavigationBar.NAV_RIGHT) ? 1 : 0, colors[1], colors[3], colors[2], index -> {
                    boolean right = index == 1;
                    boolean moved = right != Features.saved(NavigationBar.NAV_RIGHT);
                    Features.set(NavigationBar.NAV_RIGHT, right);
                    if (sheet[0] != null) sheet[0].close();
                    if (!moved) return;
                    refreshSummary(NAV_POSITION);
                    MaterialYou.showRestartBar(from);
                });
        sheet[0] = TabSheet.show(from, from.findViewById(android.R.id.content),
                I18n.tr("Landscape navigation bar position"), null, colors[0], colors[1], colors[2], rows, null);
    }

    /** The sheet of the tab width in code blocks, chosen with a tap, which also closes it. */
    private static void openTabWidth() {
        Activity from = activity.get();
        if (from == null) return;
        int[] colors = colors(from);
        String[] labels = new String[TAB_WIDTHS.length];
        int chosen = 0;
        for (int i = 0; i < TAB_WIDTHS.length; i++) {
            labels[i] = spaces(TAB_WIDTHS[i]);
            if (TAB_WIDTHS[i] == MarkdownSettings.pickedTabWidth()) chosen = i;
        }
        TabSheet[] sheet = new TabSheet[1];
        View rows = TabSheet.radioRows(from, labels, chosen, colors[1], colors[3], colors[2], index -> {
            boolean changed = TAB_WIDTHS[index] != MarkdownSettings.pickedTabWidth();
            Features.setText(MarkdownSettings.TAB_WIDTH, String.valueOf(TAB_WIDTHS[index]));
            if (sheet[0] != null) sheet[0].close();
            if (!changed) return;
            refreshSummary(TAB_WIDTH);
            MaterialYou.showRestartBar(from);
        });
        sheet[0] = TabSheet.show(from, from.findViewById(android.R.id.content), I18n.tr("Tab width"),
                I18n.tr("In code blocks of comments and READMEs. The app uses 8."), colors[0], colors[1], colors[2], rows,
                null);
    }

    /** A tab width as the sheet and its row word it. */
    private static String spaces(int width) {
        return width + " " + I18n.tr("spaces");
    }

    /**
     * The colors a sheet is drawn in: the raised surface of the app's own sheets, then the primary and secondary text
     * and the accent.
     */
    private static int[] colors(Activity from) {
        TypedArray theme = from.obtainStyledAttributes(new int[] {android.R.attr.colorBackground,
                android.R.attr.textColorPrimary, android.R.attr.textColorSecondary, android.R.attr.colorAccent});
        int raised = from.getResources().getIdentifier("backgroundElevatedPrimary", "color", from.getPackageName());
        int surface = raised != 0 ? from.getColor(raised) : theme.getColor(0, Color.WHITE);
        int text = theme.getColor(1, Color.BLACK);
        int[] colors = {surface, text, theme.getColor(2, Color.GRAY), theme.getColor(3, text)};
        theme.recycle();
        return colors;
    }

    /** Sets the summary of the row [key] to what it should show now. */
    private static void refreshSummary(String key) {
        try {
            WeakReference<Object> row = rows.get(key);
            if (row == null || row.get() == null) return;
            for (Method method : Class.forName(SETTINGS_FRAGMENT).getDeclaredMethods()) {
                if (method.getName().equals("fakhSummary")) method.invoke(null, row.get(), summary(key));
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Summary", error);
        }
    }

    /** The sheet of the download subfolder under Download, with a text field and Save button. */
    private static void openDownloadFolder() {
        Activity from = activity.get();
        if (from == null) return;
        int[] colors = colors(from);
        int text = colors[1];
        int secondary = colors[2];
        int accent = colors[3];
        float density = from.getResources().getDisplayMetrics().density;
        int padH = Math.round(20 * density);
        int padV = Math.round(12 * density);

        LinearLayout content = new LinearLayout(from);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(padH, 0, padH, padV);

        EditText input = new EditText(from);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setText(AssetsDownload.folder());
        input.setHint(AssetsDownload.DEFAULT_FOLDER);
        input.setTextColor(text);
        input.setHintTextColor(secondary);
        input.setBackgroundTintList(ColorStateList.valueOf(accent));
        input.setSelection(input.getText().length());
        content.addView(input);

        TabSheet[] sheet = new TabSheet[1];
        TextView save = new TextView(from);
        save.setText(I18n.tr("Save"));
        save.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        save.setTextColor(Color.WHITE);
        save.setGravity(Gravity.CENTER);
        save.setPadding(padH, padV, padH, padV);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(accent);
        pill.setCornerRadius(12 * density);
        save.setBackground(pill);
        LinearLayout.LayoutParams saveParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        saveParams.topMargin = Math.round(16 * density);
        save.setOnClickListener(v -> {
            Features.setText(DOWNLOAD_FOLDER, AssetsDownload.sanitize(input.getText().toString()));
            if (sheet[0] != null) sheet[0].close();
            refreshSummary(DOWNLOAD_FOLDER);
        });
        content.addView(save, saveParams);

        sheet[0] = TabSheet.show(from, from.findViewById(android.R.id.content),
                I18n.tr("Download location"),
                I18n.tr("Use \"/\" for nested folders, for example LinkedIn/Media. Leave empty to save directly in the main folder.")
                        .replace("LinkedIn/Media", "GitHub/APKs"),
                colors[0], text, secondary, content, null);
    }

    /** What a row shows under its title: the position, folder, tab width or number of shown tabs; null while unknown. */
    static String summary(String key) {
        if (NAV_POSITION.equals(key)) return I18n.tr(Features.saved(NavigationBar.NAV_RIGHT) ? "Right" : "Left");
        if (DOWNLOAD_FOLDER.equals(key)) return AssetsDownload.location();
        if (TAB_WIDTH.equals(key)) return spaces(MarkdownSettings.pickedTabWidth());
        if (!NAV_TABS.equals(key) || NavigationBar.allTabs.isEmpty()) return null;
        int shown = 0;
        for (Object tab : NavigationBar.allTabs) {
            if (!NavigationBar.hidden(NavigationBar.labelName(tab))) shown++;
        }
        return GlassTabs.summary(shown, NavigationBar.allTabs.size());
    }
}
