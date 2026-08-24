package dev.jason.gboardpatches.extension.longpressquickactions;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.util.TypedValue;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public final class GboardLongPressQuickActions1803ReflectionHandles {
    private static final String SOFT_KEY_VIEW_CLASS =
            "com.google.android.libraries.inputmethod.widgets.SoftKeyView";
    private static final String ACTION_SET_CLASS =
            "com.google.android.libraries.inputmethod.metadata.SoftKeyDef";
    private static final String ACTION_TYPE_CLASS = "pmy";
    private static final String ACTION_DEF_CLASS =
            "com.google.android.libraries.inputmethod.metadata.ActionDef";
    private static final String ACTION_ENTRY_CLASS = "pnu";
    private static final String ACTION_BUILDER_CLASS = "pmz";
    private static final String METADATA_BUILDER_CLASS = "ppo";
    private static final String INTENTION_CLASS = "pnt";
    private static final String EVENT_CLASS = "nur";
    private static final String INPUT_METHOD_SERVICE_CLASS = "oup";
    private static final String POINTER_TRACKER_CLASS = "pvi";

    private static final int SINGLE_ICON_POPUP_LAYOUT_ATTR_ID = 0x7f040288;

    public final Method softKeyBindMethod;
    public final Method inputEventMethod;
    public final Method pointerOwnerMethod;

    private final Field softKeyMetadataField;
    private final Field keyIdField;
    private final Method exactActionLookupMethod;
    private final Field actionEntriesField;
    private final Field popupLabelsField;
    private final Field popupIconsField;
    private final Field entryKeycodeField;
    private final Field entryPayloadField;
    private final Constructor<?> entryConstructor;
    private final Constructor<?> actionBuilderConstructor;
    private final Field actionBuilderTypeField;
    private final Field actionBuilderEntriesField;
    private final Field actionBuilderLabelsField;
    private final Field actionBuilderIconsField;
    private final Field actionBuilderPopupLayoutField;
    private final Method copyActionMethod;
    private final Method buildActionMethod;
    private final Method scheduleLongPressMethod;
    private final Constructor<?> metadataBuilderConstructor;
    private final Method copyMetadataMethod;
    private final Method putActionMethod;
    private final Method buildMetadataMethod;
    private final Field eventActionTypeField;
    private final Field eventEntriesField;
    private final Field eventMetadataField;
    private final Class<?> actionEntryClass;
    private final Object pressActionType;
    private final Object longPressActionType;

    public GboardLongPressQuickActions1803ReflectionHandles(ClassLoader classLoader)
            throws Throwable {
        Class<?> softKeyViewClass = resolve(classLoader, SOFT_KEY_VIEW_CLASS);
        Class<?> actionSetClass = resolve(classLoader, ACTION_SET_CLASS);
        Class<?> actionTypeClass = resolve(classLoader, ACTION_TYPE_CLASS);
        Class<?> actionDefClass = resolve(classLoader, ACTION_DEF_CLASS);
        actionEntryClass = resolve(classLoader, ACTION_ENTRY_CLASS);
        Class<?> actionBuilderClass = resolve(classLoader, ACTION_BUILDER_CLASS);
        Class<?> metadataBuilderClass = resolve(classLoader, METADATA_BUILDER_CLASS);
        Class<?> intentionClass = resolve(classLoader, INTENTION_CLASS);
        Class<?> eventClass = resolve(classLoader, EVENT_CLASS);
        Class<?> inputMethodServiceClass = resolve(classLoader, INPUT_METHOD_SERVICE_CLASS);
        Class<?> pointerTrackerClass = resolve(classLoader, POINTER_TRACKER_CLASS);

        softKeyBindMethod = softKeyViewClass.getDeclaredMethod(
                "r", actionSetClass, long.class);
        inputEventMethod = inputMethodServiceClass.getDeclaredMethod("au", eventClass);
        pointerOwnerMethod = pointerTrackerClass.getDeclaredMethod(
                "B", softKeyViewClass, float.class, float.class, long.class, int.class);
        validateInputEventBinding(inputMethodServiceClass, inputEventMethod);

        softKeyMetadataField = softKeyViewClass.getDeclaredField("e");
        keyIdField = actionSetClass.getDeclaredField("d");
        actionSetClass.getDeclaredField("f").setAccessible(true);
        actionSetClass.getDeclaredField("g").setAccessible(true);
        exactActionLookupMethod = actionSetClass.getDeclaredMethod("h", actionTypeClass);

        actionDefClass.getDeclaredField("c").setAccessible(true);
        actionEntriesField = actionDefClass.getDeclaredField("d");
        actionDefClass.getDeclaredField("g").setAccessible(true);
        popupLabelsField = actionDefClass.getDeclaredField("n");
        popupIconsField = actionDefClass.getDeclaredField("o");
        entryKeycodeField = actionEntryClass.getDeclaredField("c");
        entryPayloadField = actionEntryClass.getDeclaredField("e");
        entryConstructor = actionEntryClass.getDeclaredConstructor(
                int.class, intentionClass, Object.class, int.class);

        actionBuilderConstructor = actionBuilderClass.getDeclaredConstructor();
        actionBuilderTypeField = actionBuilderClass.getDeclaredField("a");
        actionBuilderEntriesField = actionBuilderClass.getDeclaredField("b");
        actionBuilderLabelsField = actionBuilderClass.getDeclaredField("c");
        actionBuilderIconsField = actionBuilderClass.getDeclaredField("d");
        actionBuilderPopupLayoutField = actionBuilderClass.getDeclaredField("g");
        copyActionMethod = actionBuilderClass.getDeclaredMethod("j", actionDefClass);
        buildActionMethod = actionBuilderClass.getDeclaredMethod("c");
        scheduleLongPressMethod = pointerTrackerClass.getDeclaredMethod("y");

        metadataBuilderConstructor = metadataBuilderClass.getDeclaredConstructor();
        copyMetadataMethod = metadataBuilderClass.getDeclaredMethod("j", actionSetClass);
        putActionMethod = metadataBuilderClass.getDeclaredMethod("t", actionDefClass);
        buildMetadataMethod = metadataBuilderClass.getDeclaredMethod("d");

        eventActionTypeField = eventClass.getDeclaredField("a");
        eventEntriesField = eventClass.getDeclaredField("b");
        eventMetadataField = eventClass.getDeclaredField("c");

        setAccessible(
                softKeyBindMethod,
                inputEventMethod,
                pointerOwnerMethod,
                softKeyMetadataField,
                keyIdField,
                exactActionLookupMethod,
                actionEntriesField,
                popupLabelsField,
                popupIconsField,
                entryKeycodeField,
                entryPayloadField,
                entryConstructor,
                actionBuilderConstructor,
                actionBuilderTypeField,
                actionBuilderEntriesField,
                actionBuilderLabelsField,
                actionBuilderIconsField,
                actionBuilderPopupLayoutField,
                copyActionMethod,
                buildActionMethod,
                scheduleLongPressMethod,
                metadataBuilderConstructor,
                copyMetadataMethod,
                putActionMethod,
                buildMetadataMethod,
                eventActionTypeField,
                eventEntriesField,
                eventMetadataField);

        pressActionType = enumValue(actionTypeClass, "PRESS");
        longPressActionType = enumValue(actionTypeClass, "LONG_PRESS");
    }

    public Object extractSoftKeyMetadata(Object softKeyView) throws IllegalAccessException {
        return softKeyView == null ? null : softKeyMetadataField.get(softKeyView);
    }

    public int extractKeyId(Object metadata) throws IllegalAccessException {
        return metadata == null ? 0 : keyIdField.getInt(metadata);
    }

    public String extractPressText(Object metadata) throws Throwable {
        Object pressAction = findExactAction(metadata, pressActionType);
        Object[] entries = extractEntries(pressAction);
        if (entries.length == 0 || entries[0] == null) {
            return null;
        }
        Object payload = entryPayloadField.get(entries[0]);
        return payload instanceof CharSequence ? payload.toString() : null;
    }

    public int[] extractLongPressCodes(Object metadata) throws Throwable {
        Object longPressAction = findExactAction(metadata, longPressActionType);
        Object[] entries = extractEntries(longPressAction);
        int[] result = new int[entries.length];
        for (int index = 0; index < entries.length; index++) {
            result[index] = entries[index] == null ? 0 : entryKeycodeField.getInt(entries[index]);
        }
        return result;
    }

    public Object appendLongPressAction(Context context, Object metadata,
            GboardLongPressQuickActions1803Policy.QuickAction action)
            throws Throwable {
        Object existingAction = findExactAction(metadata, longPressActionType);
        Object actionBuilder = actionBuilderConstructor.newInstance();
        Object[] existingEntries = extractEntries(existingAction);
        String[] existingLabels = popupLabels(existingAction);
        int[] existingIcons = popupIcons(existingAction);

        if (existingAction != null) {
            copyActionMethod.invoke(actionBuilder, existingAction);
        } else {
            int resolvedPopupLayoutResId = resolveSingleIconPopupLayoutResId(context);
            if (resolvedPopupLayoutResId == 0) {
                return null;
            }
            actionBuilderTypeField.set(actionBuilder, longPressActionType);
            actionBuilderPopupLayoutField.setInt(
                    actionBuilder, resolvedPopupLayoutResId);
        }

        Object updatedEntries = Array.newInstance(actionEntryClass, existingEntries.length + 1);
        System.arraycopy(existingEntries, 0, updatedEntries, 0, existingEntries.length);
        Array.set(updatedEntries, existingEntries.length,
                entryConstructor.newInstance(
                        action.actionCode, null, null, Integer.MAX_VALUE));
        actionBuilderEntriesField.set(actionBuilder, updatedEntries);

        String[] labels = normalizeLabels(existingLabels, existingEntries.length + 1);
        labels[existingEntries.length] = null;
        actionBuilderLabelsField.set(actionBuilder, labels);

        int[] icons = normalizeIcons(existingIcons, existingEntries.length + 1);
        icons[existingEntries.length] = action.iconResId;
        actionBuilderIconsField.set(actionBuilder, icons);

        Object patchedAction = buildActionMethod.invoke(actionBuilder);
        if (patchedAction == null) {
            return null;
        }
        Object metadataBuilder = metadataBuilderConstructor.newInstance();
        copyMetadataMethod.invoke(metadataBuilder, metadata);
        putActionMethod.invoke(metadataBuilder, patchedAction);
        return buildMetadataMethod.invoke(metadataBuilder);
    }

    private static int resolveSingleIconPopupLayoutResId(Context context) {
        if (context == null) {
            return 0;
        }
        TypedValue typedValue = new TypedValue();
        boolean resolved = context.getTheme().resolveAttribute(
                SINGLE_ICON_POPUP_LAYOUT_ATTR_ID, typedValue, true);
        return resolved
                && typedValue.resourceId != 0
                && typedValue.resourceId != SINGLE_ICON_POPUP_LAYOUT_ATTR_ID
                ? typedValue.resourceId
                : 0;
    }

    public void scheduleLongPress(Object pointerTracker) throws Throwable {
        if (pointerTracker != null) {
            scheduleLongPressMethod.invoke(pointerTracker);
        }
    }

    public String extractEventActionTypeName(Object event) throws IllegalAccessException {
        Object actionType = event == null ? null : eventActionTypeField.get(event);
        return actionType instanceof Enum<?> ? ((Enum<?>) actionType).name() : null;
    }

    public Object extractEventMetadata(Object event) throws IllegalAccessException {
        return event == null ? null : eventMetadataField.get(event);
    }

    public int extractSelectedEventCode(Object event) throws IllegalAccessException {
        Object value = event == null ? null : eventEntriesField.get(event);
        if (!(value instanceof Object[] entries) || entries.length == 0 || entries[0] == null) {
            return 0;
        }
        return entryKeycodeField.getInt(entries[0]);
    }

    private Object findExactAction(Object metadata, Object actionType) throws Throwable {
        if (metadata == null || actionType == null) {
            return null;
        }
        return exactActionLookupMethod.invoke(metadata, actionType);
    }

    private Object[] extractEntries(Object action) throws IllegalAccessException {
        Object value = action == null ? null : actionEntriesField.get(action);
        return value instanceof Object[] ? (Object[]) value : new Object[0];
    }

    private String[] popupLabels(Object action) throws IllegalAccessException {
        Object value = action == null ? null : popupLabelsField.get(action);
        return value instanceof String[] ? (String[]) value : new String[0];
    }

    private int[] popupIcons(Object action) throws IllegalAccessException {
        Object value = action == null ? null : popupIconsField.get(action);
        return value instanceof int[] ? (int[]) value : new int[0];
    }

    private static String[] normalizeLabels(String[] source, int size) {
        String[] result = new String[size];
        if (source != null && source.length == 1 && size > 1) {
            for (int index = 0; index < size - 1; index++) {
                result[index] = source[0];
            }
        } else if (source != null) {
            System.arraycopy(source, 0, result, 0, Math.min(source.length, size));
        }
        return result;
    }

    private static int[] normalizeIcons(int[] source, int size) {
        int[] result = new int[size];
        if (source != null && source.length == 1 && size > 1) {
            for (int index = 0; index < size - 1; index++) {
                result[index] = source[0];
            }
        } else if (source != null) {
            System.arraycopy(source, 0, result, 0, Math.min(source.length, size));
        }
        return result;
    }

    private static void validateInputEventBinding(Class<?> owner, Method method) {
        if (!InputMethodService.class.isAssignableFrom(owner)
                || method.getDeclaringClass() != owner
                || method.getReturnType() != boolean.class
                || method.getParameterCount() != 1
                || !Modifier.isPublic(method.getModifiers())
                || !Modifier.isFinal(method.getModifiers())) {
            throw new IllegalArgumentException("oup#au(nur) binding shape mismatch");
        }
    }

    private static Class<?> resolve(ClassLoader classLoader, String name)
            throws ClassNotFoundException {
        return Class.forName(name, false, classLoader);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static Object enumValue(Class<?> enumClass, String name) {
        return Enum.valueOf((Class<? extends Enum>) enumClass.asSubclass(Enum.class), name);
    }

    private static void setAccessible(Object... members) {
        for (Object member : members) {
            if (member instanceof Method method) {
                method.setAccessible(true);
            } else if (member instanceof Field field) {
                field.setAccessible(true);
            } else if (member instanceof Constructor<?> constructor) {
                constructor.setAccessible(true);
            }
        }
    }
}
