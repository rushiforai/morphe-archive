package app.noam.extension.spotify.settings;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.noam.extension.spotify.Utils;

public final class SettingsTile {
    private SettingsTile() {}

    private static String navigationHolderClassName() {
        return "";
    }

    private static String destinationActionClassName() {
        return "";
    }

    private static final String MORPHE_DESTINATION = "morphe://settings";

    private static volatile Object tile;

    public static Object[] captureTile(Object[] rows) {
        try {
            if (tile == null) tile = buildTile(rows);
        } catch (Throwable ex) {
            Utils.logError("Could not build the Morphe settings tile", ex);
        }
        return rows;
    }

    public static void addToMainMenu(List<Object> items) {
        try {
            if (tile == null || items == null) return;

            int logout = indexOfLogout(items);
            if (logout >= 0) {
                items.add(logout, tile);
            } else {
                items.add(tile);
            }
        } catch (Throwable ex) {
            Utils.logError("Could not add the Morphe row to the main settings menu", ex);
        }
    }

    private static int indexOfLogout(List<Object> items) {
        for (int i = items.size() - 1; i >= 0; i--) {
            Object item = items.get(i);
            if (item == null) continue;

            for (Field field : item.getClass().getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                field.setAccessible(true);
                try {
                    if ("logout".equals(field.get(item))) return i;
                } catch (IllegalAccessException ignored) {
                }
            }
        }
        return -1;
    }

    private static Object buildTile(Object[] items) throws Exception {
        Class<?> holderClass = Class.forName(navigationHolderClassName());
        Class<?> actionClass = Class.forName(destinationActionClassName());

        Object template = null;
        Field templateHolderField = null;
        for (Object item : items) {
            for (Field field : item.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(item);
                if (value != null && holderClass.isInstance(value)) {
                    template = item;
                    templateHolderField = field;
                    break;
                }
            }
            if (template != null) break;
        }
        if (template == null) throw new IllegalStateException("no navigation row to use as a template");

        Object templateHolder = templateHolderField.get(template);

        Constructor<?> holderConstructor = constructorWithParameterCount(holderClass, 2);
        Object navigationMetadata = firstFieldAssignableTo(
                templateHolder, holderConstructor.getParameterTypes()[0]);

        Constructor<?> actionConstructor = actionClass.getDeclaredConstructor(String.class);
        actionConstructor.setAccessible(true);

        Object action = actionConstructor.newInstance(MORPHE_DESTINATION);
        Object accessor = holderConstructor.newInstance(navigationMetadata, action);

        return buildRow(template, items, accessor);
    }

    private static Object buildRow(Object template, Object[] rows, Object accessor) throws Exception {
        Class<?> rowClass = template.getClass();

        Constructor<?> rowConstructor = null;
        for (Constructor<?> candidate : rowClass.getDeclaredConstructors()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (parameters.length >= 10 && parameters[0] == String.class
                    && (rowConstructor == null
                        || parameters.length > rowConstructor.getParameterTypes().length)) {
                rowConstructor = candidate;
            }
        }
        if (rowConstructor == null) throw new IllegalStateException("no usable settings row constructor");
        rowConstructor.setAccessible(true);

        Field[] fields = rowClass.getDeclaredFields();
        Object[] shared = new Object[fields.length];
        for (int i = 0; i < fields.length; i++) {
            fields[i].setAccessible(true);
            shared[i] = sharedValue(fields[i], rows, rowClass);
        }

        Class<?>[] parameterTypes = rowConstructor.getParameterTypes();
        Object[] arguments = new Object[parameterTypes.length];
        Map<Class<?>, Integer> seenPerType = new HashMap<>();

        for (int i = 0; i < parameterTypes.length; i++) {
            Class<?> parameterType = parameterTypes[i];
            arguments[i] = defaultFor(parameterType);
            if (parameterType.isPrimitive()) continue;

            Integer previous = seenPerType.get(parameterType);
            int occurrence = previous == null ? 0 : previous;
            seenPerType.put(parameterType, occurrence + 1);
            int seen = 0;
            for (int f = 0; f < fields.length; f++) {
                if (fields[f].getType() != parameterType) continue;
                if (seen++ != occurrence) continue;

                if (isFlow(parameterType)) {
                    Object templateFlow = fields[f].get(template);
                    arguments[i] = templateFlow == null ? null : flowLike(templateFlow);
                } else {
                    arguments[i] = shared[f];
                }
                break;
            }
        }

        arguments[0] = "morphe";
        arguments[1] = MorpheSettingsActivity.titleResourceId();
        arguments[2] = MorpheSettingsActivity.descriptionResourceId();
        arguments[accessorParameterIndex(parameterTypes, accessor)] = accessor;

        return rowConstructor.newInstance(arguments);
    }

    private static boolean isFlow(Class<?> type) {
        if (!type.isInterface()) return false;
        for (Method method : type.getMethods()) {
            if (method.getName().equals("collect")) return true;
        }
        return false;
    }

    private static Object flowLike(Object templateFlow) {
        try {
            Class<?> flowClass = templateFlow.getClass();

            Field valueField = null;
            Field tagField = null;
            for (Field field : flowClass.getDeclaredFields()) {
                field.setAccessible(true);
                if (field.getType() == int.class && tagField == null) {
                    tagField = field;
                } else if (!field.getType().isPrimitive() && valueField == null) {
                    valueField = field;
                }
            }

            if (valueField == null || tagField == null) return templateFlow;
            if (!(valueField.get(templateFlow) instanceof Boolean)) return templateFlow;

            Constructor<?> constructor = flowClass.getDeclaredConstructor(Object.class, int.class);
            constructor.setAccessible(true);
            return constructor.newInstance(Boolean.TRUE, tagField.getInt(templateFlow));
        } catch (Throwable ex) {
            Utils.log("Could not build the Morphe row flow: " + ex);
            return templateFlow;
        }
    }

    private static Object sharedValue(Field field, Object[] rows, Class<?> rowClass) throws Exception {
        for (int i = 0; i < rows.length; i++) {
            if (rows[i] == null || rows[i].getClass() != rowClass) continue;
            Object value = field.get(rows[i]);
            if (value == null) continue;

            for (int j = i + 1; j < rows.length; j++) {
                if (rows[j] == null || rows[j].getClass() != rowClass) continue;
                if (field.get(rows[j]) == value) return value;
            }
        }
        return null;
    }

    private static int accessorParameterIndex(Class<?>[] parameterTypes, Object accessor) {
        for (int i = 0; i < parameterTypes.length; i++) {
            if (parameterTypes[i].isInstance(accessor)) return i;
        }
        throw new IllegalStateException("settings row does not accept the action accessor");
    }

    private static Constructor<?> constructorWithParameterCount(Class<?> type, int count) {
        for (Constructor<?> candidate : type.getDeclaredConstructors()) {
            if (candidate.getParameterTypes().length == count) {
                candidate.setAccessible(true);
                return candidate;
            }
        }
        throw new IllegalStateException(type + " has no constructor taking " + count + " arguments");
    }

    private static Object firstFieldAssignableTo(Object instance, Class<?> type) throws Exception {
        for (Field field : instance.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            Object value = field.get(instance);
            if (value != null && type.isInstance(value)) return value;
        }
        return null;
    }

    private static Object defaultFor(Class<?> type) {
        if (!type.isPrimitive()) return null;
        if (type == boolean.class) return Boolean.FALSE;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == float.class) return 0f;
        if (type == double.class) return 0d;
        if (type == short.class) return (short) 0;
        if (type == byte.class) return (byte) 0;
        if (type == char.class) return (char) 0;
        return null;
    }
}
