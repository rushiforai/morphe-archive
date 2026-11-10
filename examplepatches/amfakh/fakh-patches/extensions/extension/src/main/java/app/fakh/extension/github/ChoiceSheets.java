package app.fakh.extension.github;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.AppRuntime;

/**
 * The Fakh Patches rows of Settings that open one of GitHub's own choice sheets, the ones its Theme and Language rows
 * use: the single-choice sheet for the landscape bar position, the multi-choice sheet for the tabs of the bar. The
 * fragment API is renamed, so the patch adds static helpers to SettingsFragment that open the sheets, and tells this
 * class the fragment and each result.
 */
final class ChoiceSheets {
    /** Keys of the rows that open a sheet, which are also the request keys of the sheets. */
    static final String NAV_TABS = "fakh_nav_tabs";
    static final String NAV_POSITION = "fakh_nav_position";
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
        return NAV_TABS.equals(key) || NAV_POSITION.equals(key);
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
            if (NAV_TABS.equals(key)) openTabs(settings);
            else openPosition(settings);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Choice sheet", error);
        }
    }

    /** The multi-choice sheet: a check per tab of the bar, checked while the tab is shown; Home is checked and disabled. */
    private static void openTabs(Object settings) throws ReflectiveOperationException {
        Context context = AppRuntime.application();
        if (context == null || NavigationBar.allTabs.isEmpty()) return;
        ArrayList<Object> items = new ArrayList<>();
        ArrayList<String> selected = new ArrayList<>();
        for (Object tab : NavigationBar.allTabs) {
            String name = NavigationBar.labelName(tab);
            int id = NavigationBar.labelId(tab);
            items.add(helper("fakhMultiItem", name, id == 0 ? name : context.getString(id)));
            if (!NavigationBar.hidden(name)) selected.add(name);
        }
        helper("fakhShowMulti", settings, I18n.tr("Navigation bar tabs"), selected, items, NAV_TABS);
    }

    /** The single-choice sheet: left or right. */
    private static void openPosition(Object settings) throws ReflectiveOperationException {
        ArrayList<Object> items = new ArrayList<>();
        items.add(helper("fakhSingleItem", "left", I18n.tr("Left")));
        items.add(helper("fakhSingleItem", "right", I18n.tr("Right")));
        helper("fakhShowSingle", settings, I18n.tr("Landscape navigation bar position"),
                MaterialYou.flag(NavigationBar.NAV_RIGHT) ? "right" : "left", NAV_POSITION, items);
    }

    /** What a row shows under its title: the position, or how many tabs the bar shows; null while unknown. */
    static String summary(String key) {
        if (NAV_POSITION.equals(key)) return I18n.tr(MaterialYou.flag(NavigationBar.NAV_RIGHT) ? "Right" : "Left");
        if (!NAV_TABS.equals(key) || NavigationBar.allTabs.isEmpty()) return null;
        int shown = 0;
        for (Object tab : NavigationBar.allTabs) {
            if (!NavigationBar.hidden(NavigationBar.labelName(tab))) shown++;
        }
        return GlassTabs.summary(shown, NavigationBar.allTabs.size());
    }

    /**
     * Saves what the user chose, as the sheet reports it: the position item, or a tab that was checked or unchecked.
     * The bar and the rail are built once, so a restart is offered.
     */
    static void chosen(String key, Bundle result) {
        try {
            Context context = AppRuntime.application();
            if (context == null) return;
            SharedPreferences.Editor edit = MaterialYou.prefs(context).edit();
            if (NAV_POSITION.equals(key)) {
                Parcelable item = result.getParcelable("key_result_item");
                edit.putBoolean(NavigationBar.NAV_RIGHT, "right".equals(value(item)));
            } else if (NAV_TABS.equals(key)) {
                edit.putBoolean(NavigationBar.HIDE_TAB + result.getString("key_result_value"),
                        !result.getBoolean("key_result_is_selected"));
            } else {
                return;
            }
            edit.commit();
            WeakReference<Object> row = rows.get(key);
            if (row != null && row.get() != null) helper("fakhSummary", row.get(), summary(key));
            Activity from = activity.get();
            if (from != null) MaterialYou.showRestartBar(from);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Choice result", error);
        }
    }

    /** The value of a choice item, the first string it writes to a parcel, whatever the app called its fields. */
    private static String value(Parcelable item) {
        if (item == null) return null;
        Parcel parcel = Parcel.obtain();
        try {
            item.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            return parcel.readString();
        } finally {
            parcel.recycle();
        }
    }

    /** Calls a static helper the patch added to SettingsFragment. */
    private static Object helper(String name, Object... arguments) throws ReflectiveOperationException {
        for (Method method : Class.forName(SETTINGS_FRAGMENT).getDeclaredMethods()) {
            if (method.getName().equals(name)) return method.invoke(null, arguments);
        }
        throw new NoSuchMethodException(name);
    }
}
