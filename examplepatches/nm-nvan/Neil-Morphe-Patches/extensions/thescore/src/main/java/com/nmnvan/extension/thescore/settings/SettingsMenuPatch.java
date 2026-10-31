package com.nmnvan.extension.thescore.settings;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;

import com.nmnvan.extension.thescore.Utils;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Adds a "Morphe Settings" row under "App Preferences" on the My Account screen.
 * <p>
 * The row is a copy of the app's own settings row type (SettingsOptionItem) without a destination,
 * so if the click hook ever fails the row simply does nothing.
 */
@SuppressWarnings("unused")
public final class SettingsMenuPatch {

    public static final String ROW_TITLE = "Morphe Settings";

    private static final String TEXT_CLASS = "com.thescore.commonUtilities.ui.Text";
    private static final String TEXT_RAW_CLASS = "com.thescore.commonUtilities.ui.Text$Raw";
    private static final String CONFIGS_CLASS = "com.thescore.repositories.data.Configs";
    private static final String APP_PREFERENCES_CONFIG_CLASS =
            "com.thescore.repositories.data.AccountsConfig$SettingsConfig$AccountSettingsConfig";

    /**
     * SettingsOptionItem primary constructor shape: (Text title, Text message, Text selected, ?, Configs,
     * boolean hasDivider, Enum tag, Integer background, boolean enabled, String linkUrl, Integer icon).
     */
    private static final int ROW_CONSTRUCTOR_PARAMETER_COUNT = 11;

    /** Rows created by this class. Items are data classes, so equal copies also match. */
    private static final Set<Object> createdRows = Collections.newSetFromMap(new WeakHashMap<>());

    private SettingsMenuPatch() {
    }

    /**
     * Injection point: every return of the My Account rows builder.
     *
     * @param result the list of rows (or null).
     * @return the list with the Morphe Settings row inserted after App Preferences.
     */
    public static Object addSettingsRow(Object result) {
        try {
            if (!(result instanceof List)) return result;
            List<?> rows = (List<?>) result;

            int appPreferencesIndex = -1;
            for (int i = 0; i < rows.size(); i++) {
                Object row = rows.get(i);
                if (isCreatedRow(row)) return result; // Already added.
                if (appPreferencesIndex < 0 && isAppPreferencesRow(row)) appPreferencesIndex = i;
            }
            if (appPreferencesIndex < 0) return result;

            Object settingsRow = createRow(rows.get(appPreferencesIndex).getClass());
            if (settingsRow == null) return result;

            ArrayList<Object> updated = new ArrayList<>(rows);
            updated.add(appPreferencesIndex + 1, settingsRow);
            return updated;
        } catch (Exception ex) {
            Utils.logException("addSettingsRow failure", ex);
            return result;
        }
    }

    /**
     * Injection point: start of the settings row click handler.
     *
     * @return true if the click was handled and the app should not handle it.
     */
    public static boolean onSettingsRowClick(View view, Object row) {
        try {
            if (!isCreatedRow(row)) return false;

            Activity activity = findActivity(view.getContext());
            if (activity != null) SettingsScreen.show(activity);
            return true;
        } catch (Exception ex) {
            Utils.logException("onSettingsRowClick failure", ex);
            return false;
        }
    }

    private static boolean isCreatedRow(Object row) {
        if (row == null) return false;
        synchronized (createdRows) {
            return createdRows.contains(row);
        }
    }

    private static boolean isAppPreferencesRow(Object row) throws Exception {
        Class<?> configsClass = Class.forName(CONFIGS_CLASS);
        Class<?> appPreferencesConfigClass = Class.forName(APP_PREFERENCES_CONFIG_CLASS);

        for (Field field : row.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != configsClass) continue;
            field.setAccessible(true);
            return appPreferencesConfigClass.isInstance(field.get(row));
        }
        return false;
    }

    private static Object createRow(Class<?> rowClass) throws Exception {
        Class<?> textClass = Class.forName(TEXT_CLASS);

        Constructor<?> constructor = null;
        for (Constructor<?> candidate : rowClass.getDeclaredConstructors()) {
            Class<?>[] types = candidate.getParameterTypes();
            if (types.length == ROW_CONSTRUCTOR_PARAMETER_COUNT
                    && types[0] == textClass
                    && types[5] == boolean.class
                    && types[6].isEnum()
                    && types[7] == Integer.class) {
                constructor = candidate;
                break;
            }
        }
        if (constructor == null) return null;
        constructor.setAccessible(true);

        Object title = Class.forName(TEXT_RAW_CLASS)
                .getConstructor(CharSequence.class, Integer.class,
                        Class.forName("com.thescore.commonUtilities.ui.TextTypeface"),
                        Class.forName("com.thescore.commonUtilities.ui.TextRelativeSize"))
                .newInstance(ROW_TITLE, null, null, null);

        Object noTag = constructor.getParameterTypes()[6].getEnumConstants()[0]; // NONE.

        Object row = constructor.newInstance(
                title,
                null,             // Message.
                null,             // Selected value text.
                null,
                null,             // No destination config.
                true,             // Divider.
                noTag,
                middleRowBackground(),
                true,             // Enabled.
                null,             // No link.
                null              // No icon.
        );

        synchronized (createdRows) {
            createdRows.add(row);
        }
        return row;
    }

    /**
     * Same background as rows in the middle of a group (e.g. "Help").
     */
    private static Integer middleRowBackground() {
        Context context = Utils.getContext();
        if (context == null) return null;
        int id = context.getResources().getIdentifier("greyLight", "color", context.getPackageName());
        return id == 0 ? null : id;
    }

    private static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
