package app.starkist.extension.newyorker;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import app.starkist.extension.settings.StarSettings;
import app.starkist.extension.settings.StarSettingsActivity;

/**
 * Adds a "Star settings" row to the New Yorker app's Settings screen, styled like
 * its own "Display Settings" row, and opens the Star settings screen when tapped.
 *
 * The app's classes are obfuscated, so the row is built with reflection from the
 * existing "Display Settings" row. Only names the app keeps stable are used:
 * SettingsViewComponent.type() and the SettingsItemEntity data class.
 */
@SuppressWarnings("unused")
public final class SettingsEntryHooks {

    private static final String TAG = "StarSettings";
    private static final String DESCRIPTION = "Font and text size for the whole app.";
    private static final String ROW_TYPE_TO_COPY = "DISPLAY";

    /**
     * Injected at the start of the method that publishes the settings list.
     *
     * @param listObject The list of SettingsViewComponent items about to be shown.
     * @return The same list, or a copy with the Star settings row added.
     */
    public static Object addSettingsEntry(Object listObject) {
        try {
            if (!(listObject instanceof List)) return listObject;
            List<?> list = (List<?>) listObject;

            int displayIndex = -1;
            for (int i = 0; i < list.size(); i++) {
                Object item = list.get(i);
                if (StarSettings.TITLE.equals(entityName(item))) return listObject; // Already added.
                if (displayIndex < 0 && ROW_TYPE_TO_COPY.equals(typeName(item))) displayIndex = i;
            }
            if (displayIndex < 0) return listObject;

            Object displayRow = list.get(displayIndex);
            Field entityField = entityField(displayRow.getClass());
            Object displayEntity = entityField.get(displayRow);
            Object starEntity = copyEntity(displayEntity, StarSettings.TITLE, DESCRIPTION);

            Constructor<?> rowConstructor = displayRow.getClass().getConstructor(entityField.getType());
            Object starRow = rowConstructor.newInstance(starEntity);

            List<Object> newList = new ArrayList<>(list);
            newList.add(displayIndex + 1, starRow);
            return newList;
        } catch (Throwable t) {
            Log.e(TAG, "Could not add the settings entry", t);
            return listObject;
        }
    }

    /**
     * Injected at the start of the settings screen's row click handler.
     *
     * @return True if the click was on the Star settings row and was handled.
     */
    public static boolean onSettingsRowClicked(View view) {
        try {
            if (view == null || !containsText(view, StarSettings.TITLE)) return false;
            Context context = view.getContext();
            context.startActivity(new Intent(context, StarSettingsActivity.class));
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Could not open settings", t);
            return false;
        }
    }

    // region Reflection helpers

    /** Name of the SettingType enum value a row returns from type(), or null. */
    private static String typeName(Object row) {
        try {
            Method type = row.getClass().getMethod("type");
            Object value = type.invoke(row);
            return value instanceof Enum ? ((Enum<?>) value).name() : null;
        } catch (Exception e) {
            return null;
        }
    }

    /** Name stored in a row's SettingsItemEntity, or null if it has none. */
    private static String entityName(Object row) {
        try {
            Object entity = entityField(row.getClass()).get(row);
            return (String) fieldValue(entity, "name");
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Reads a SettingsItemEntity field. Fields are used instead of getters because
     * the app's getters are compiled as component1(), component2(), and so on.
     */
    private static Object fieldValue(Object entity, String fieldName) throws Exception {
        Field field = entity.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(entity);
    }

    private static Field entityField(Class<?> rowClass) throws NoSuchFieldException {
        for (Field field : rowClass.getDeclaredFields()) {
            if (field.getType().getName().endsWith(".SettingsItemEntity")) {
                field.setAccessible(true);
                return field;
            }
        }
        throw new NoSuchFieldException("SettingsItemEntity field in " + rowClass.getName());
    }

    /** Calls the data class's copy(name, description, ...) keeping every other value. */
    private static Object copyEntity(Object entity, String name, String description) throws Exception {
        Class<?> entityClass = entity.getClass();
        for (Method method : entityClass.getMethods()) {
            if (!method.getName().equals("copy") || method.getParameterTypes().length != 6) continue;
            return method.invoke(entity,
                    name,
                    description,
                    fieldValue(entity, "isEnabled"),
                    fieldValue(entity, "pref"),
                    fieldValue(entity, "hasDivider"),
                    fieldValue(entity, "isEligibleForTrial"));
        }
        throw new NoSuchMethodException("copy in " + entityClass.getName());
    }

    private static boolean containsText(View view, String text) {
        if (view instanceof TextView) {
            return text.contentEquals(((TextView) view).getText());
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (containsText(group.getChildAt(i), text)) return true;
            }
        }
        return false;
    }

    // endregion
}
