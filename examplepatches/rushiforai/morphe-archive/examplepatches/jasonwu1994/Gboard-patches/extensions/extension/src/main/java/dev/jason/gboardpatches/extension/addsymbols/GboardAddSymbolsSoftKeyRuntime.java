package dev.jason.gboardpatches.extension.addsymbols;

import android.content.Context;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

@SuppressWarnings("unused")
public final class GboardAddSymbolsSoftKeyRuntime {
    private static final String SOFT_KEY_VIEW_CLASS =
            "com.google.android.libraries.inputmethod.widgets.SoftKeyView";
    private static final String POINTER_TRACKER_CLASS = "ofk";
    private static final String ACTION_TYPE_CLASS = "nxi";
    private static final String ACTION_SET_CLASS = "oaa";
    private static final String ACTION_DEF_CLASS = "nxl";
    private static final String ACTION_DATA_CLASS = "nyf";
    private static final String ACTION_DEF_BUILDER_CLASS = "nxj";
    private static final String ACTION_SET_BUILDER_CLASS = "nzv";
    private static final String INTENTION_CLASS = "nye";
    private static final String KEYBOARD_TYPE_CLASS = "nzd";
    private static final String GESTURE_DISPATCHER_CLASS = "ofi";
    private static final String PREFERENCE_MANAGER_CLASS = "oql";

    private static final String ACTION_NAME_PRESS = "PRESS";
    private static final String ACTION_NAME_LONG_PRESS = "LONG_PRESS";
    private static final String ACTION_NAME_SLIDE_UP = "SLIDE_UP";
    private static final String ACTION_NAME_SLIDE_DOWN = "SLIDE_DOWN";
    private static final String INTENTION_NAME_COMMIT = "COMMIT";

    private static final int SWITCH_KEYBOARD_KEYCODE = -0x2714;
    private static final int SWITCH_TO_ONE_HANDED_MODE_KEYCODE = -0x2749;
    private static final int OPEN_EXTENSION_KEYCODE = -0x274a;
    private static final int LAUNCH_PREFERENCE_ACTIVITY_KEYCODE = -0x2723;
    private static final int SWITCH_KEYBOARD_FROM_ACCESS_POINT_KEYCODE = -0x278b;
    private static final int SWITCH_KEYBOARD_FROM_ACCESS_POINT_AND_CLOSE_EXTENSION_KEYCODE = -0x2791;
    private static final int ZHTW_SYMBOL_SHORTCUT_POPUP_ICON_RES_ID = 0x7f080576;
    private static final int ZHUYIN_COMMA_POPUP_LAYOUT_RES_ID = 0x7f0e05fd;
    private static final String ZHTW_SYMBOL_SHORTCUT_POPUP_LABEL = "♥";
    private static final String JASONDEV_SYMBOL_KEYBOARD_DATA = "jasondev_symbol";
    private static final String EMOJI_OR_GIF_EXTENSION_INTERFACE_CLASS =
            "com.google.android.apps.inputmethod.libs.expression.extension.IEmojiOrGifExtension";

    private static final Map<ClassLoader, ReflectionHandles> REFLECTION_BY_LOADER =
            new WeakHashMap<>();

    private GboardAddSymbolsSoftKeyRuntime() {
    }

    public static Object patchSoftKeyMetadata(Object softKeyView, Object keyMetadata) {
        if (softKeyView == null || keyMetadata == null) {
            return keyMetadata;
        }
        try {
            ClassLoader classLoader = softKeyView.getClass().getClassLoader();
            if (classLoader == null) {
                return keyMetadata;
            }
            ReflectionHandles handles = reflectionHandles(classLoader);
            if (!isCommaLikeKey(handles, keyMetadata)) {
                return keyMetadata;
            }
            Object templateAction = findShortcutTemplateAction(handles, keyMetadata);
            if (templateAction == null || hasCustomSymbolShortcut(handles, keyMetadata)) {
                return keyMetadata;
            }

            int replaceIndex = findXdShortcutEntryIndex(handles, templateAction);
            if (!isZhuyinCommaTemplateAction(handles, templateAction)) {
                replaceIndex = -1;
            }
            Object customKeyboardType = handles.buildKeyboardType(JASONDEV_SYMBOL_KEYBOARD_DATA);
            Object patchedLongPress = replaceIndex >= 0
                    ? handles.buildLongPressShortcutActionByReplacingEntry(
                    templateAction,
                    replaceIndex,
                    SWITCH_KEYBOARD_FROM_ACCESS_POINT_AND_CLOSE_EXTENSION_KEYCODE,
                    customKeyboardType,
                    ZHTW_SYMBOL_SHORTCUT_POPUP_LABEL,
                    ZHTW_SYMBOL_SHORTCUT_POPUP_ICON_RES_ID)
                    : handles.buildLongPressShortcutActionByAppendingEntry(
                    templateAction,
                    SWITCH_KEYBOARD_FROM_ACCESS_POINT_AND_CLOSE_EXTENSION_KEYCODE,
                    customKeyboardType,
                    ZHTW_SYMBOL_SHORTCUT_POPUP_LABEL,
                    ZHTW_SYMBOL_SHORTCUT_POPUP_ICON_RES_ID);
            if (patchedLongPress == null) {
                return keyMetadata;
            }

            Object builder = handles.keyMetadataBuilderConstructor.newInstance();
            handles.copyKeyMetadataMethod.invoke(builder, keyMetadata);
            handles.replaceActionOnKeyMetadataBuilder(builder, handles.longPressActionType, patchedLongPress);
            return handles.buildKeyMetadataMethod.invoke(builder);
        } catch (Throwable throwable) {
            return keyMetadata;
        }
    }

    private static boolean isCommaLikeKey(
            ReflectionHandles handles,
            Object keyMetadata) throws Throwable {
        Object pressAction = handles.findExactAction(keyMetadata, handles.pressActionType);
        String pressText = handles.extractSinglePayloadToken(pressAction);
        String primaryLabel = handles.extractPrimaryLabel(keyMetadata);
        return "，".equals(pressText) || "，".equals(primaryLabel)
                || ",".equals(pressText) || ",".equals(primaryLabel);
    }

    private static boolean hasCustomSymbolShortcut(
            ReflectionHandles handles,
            Object keyMetadata) throws Throwable {
        for (Object actionDef : handles.extractActionDefs(keyMetadata)) {
            if (!handles.isActionType(actionDef, handles.longPressActionType)) {
                continue;
            }
            for (Object actionEntry : handles.extractActionEntries(actionDef)) {
                Integer keycode = handles.extractActionEntryKeycode(actionEntry);
                if (keycode == null) {
                    continue;
                }
                int numericKeycode = keycode.intValue();
                if (numericKeycode != SWITCH_KEYBOARD_FROM_ACCESS_POINT_AND_CLOSE_EXTENSION_KEYCODE
                        && numericKeycode != SWITCH_KEYBOARD_KEYCODE) {
                    continue;
                }
                String data = handles.extractActionEntryPayload(actionEntry);
                if (JASONDEV_SYMBOL_KEYBOARD_DATA.equals(data)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static Object findShortcutTemplateAction(
            ReflectionHandles handles,
            Object keyMetadata) throws Throwable {
        if (!isCommaLikeKey(handles, keyMetadata)) {
            return null;
        }
        for (Object actionDef : handles.extractActionDefs(keyMetadata)) {
            if (!handles.isActionType(actionDef, handles.longPressActionType)) {
                continue;
            }
            if (!isZhuyinCommaTemplateAction(handles, actionDef)) {
                continue;
            }
            if (findXdShortcutEntryIndex(handles, actionDef) >= 0) {
                return actionDef;
            }
        }
        for (Object actionDef : handles.extractActionDefs(keyMetadata)) {
            if (!handles.isActionType(actionDef, handles.longPressActionType)) {
                continue;
            }
            if (isExpressionAccessPointTemplateAction(handles, actionDef)) {
                return actionDef;
            }
        }
        return null;
    }

    private static boolean isZhuyinCommaTemplateAction(
            ReflectionHandles handles,
            Object actionDef) throws Throwable {
        return actionDef != null
                && handles.extractPopupLayoutRes(actionDef) == ZHUYIN_COMMA_POPUP_LAYOUT_RES_ID;
    }

    private static boolean isExpressionAccessPointTemplateAction(
            ReflectionHandles handles,
            Object actionDef) throws Throwable {
        if (actionDef == null || handles.extractPopupLayoutRes(actionDef) == 0) {
            return false;
        }
        if (findXdShortcutEntryIndex(handles, actionDef) >= 0) {
            return true;
        }
        for (Object actionEntry : handles.extractActionEntries(actionDef)) {
            if (actionEntry == null) {
                continue;
            }
            Integer keycode = handles.extractActionEntryKeycode(actionEntry);
            if (keycode != null) {
                int numericKeycode = keycode.intValue();
                if (numericKeycode == OPEN_EXTENSION_KEYCODE
                        || numericKeycode == LAUNCH_PREFERENCE_ACTIVITY_KEYCODE
                        || numericKeycode == SWITCH_TO_ONE_HANDED_MODE_KEYCODE
                        || numericKeycode == SWITCH_KEYBOARD_FROM_ACCESS_POINT_KEYCODE
                        || numericKeycode
                        == SWITCH_KEYBOARD_FROM_ACCESS_POINT_AND_CLOSE_EXTENSION_KEYCODE) {
                    return true;
                }
            }
            String payload = handles.extractActionEntryPayload(actionEntry);
            if (EMOJI_OR_GIF_EXTENSION_INTERFACE_CLASS.equals(payload)) {
                return true;
            }
        }
        return false;
    }

    private static int findXdShortcutEntryIndex(
            ReflectionHandles handles,
            Object actionDef) throws Throwable {
        if (actionDef == null) {
            return -1;
        }
        Object[] actionEntries = handles.extractActionEntries(actionDef);
        String[] popupLabels = handles.extractPopupLabels(actionDef);
        for (int index = 0; index < actionEntries.length; index++) {
            String popupLabel = index < popupLabels.length ? popupLabels[index] : null;
            if ("XD".equals(popupLabel)) {
                return index;
            }
        }
        return -1;
    }

    private static ReflectionHandles reflectionHandles(ClassLoader classLoader) throws Throwable {
        synchronized (REFLECTION_BY_LOADER) {
            ReflectionHandles cached = REFLECTION_BY_LOADER.get(classLoader);
            if (cached != null) {
                return cached;
            }
            ReflectionHandles created = new ReflectionHandles(classLoader);
            REFLECTION_BY_LOADER.put(classLoader, created);
            return created;
        }
    }

    private static Class<?> resolveClass(ClassLoader classLoader, String className)
            throws ClassNotFoundException {
        return Class.forName(className, false, classLoader);
    }

    private static final class ReflectionHandles {
        final Field actionDefsField;
        final Field keyLabelTextsField;
        final Field keyLabelIdsField;
        final Method exactActionLookupMethod;
        final Field actionDefTypeField;
        final Field actionEntriesField;
        final Field actionPopupLayoutField;
        final Field actionPopupLabelsField;
        final Field actionPopupIconsField;
        final Field actionPayloadField;
        final Field actionKeycodeField;
        final Field actionIntentionField;
        final Constructor<?> actionDataConstructor;
        final Method keyboardTypeFromStringMethod;
        final Field keyboardTypeNameField;
        final Constructor<?> actionBuilderConstructor;
        final Field actionTypeField;
        final Field actionBuilderEntriesField;
        final Field popupIconField;
        final Field popupLabelField;
        final Field contentDescriptionField;
        final Method setSingleActionMethod;
        final Method buildActionMethod;
        final Method copyActionMethod;
        final Constructor<?> keyMetadataBuilderConstructor;
        final Field keyMetadataBuilderActionsField;
        final Method copyKeyMetadataMethod;
        final Method buildKeyMetadataMethod;
        final Object commitIntention;
        final Object longPressActionType;
        final Object slideUpActionType;
        final Object slideDownActionType;
        final Object pressActionType;

        ReflectionHandles(ClassLoader classLoader) throws Throwable {
            Class<?> softKeyViewClass = resolveClass(classLoader, SOFT_KEY_VIEW_CLASS);
            Class<?> pointerTrackerClass = resolveClass(classLoader, POINTER_TRACKER_CLASS);
            Class<?> actionTypeClass = resolveClass(classLoader, ACTION_TYPE_CLASS);
            Class<?> actionSetClass = resolveClass(classLoader, ACTION_SET_CLASS);
            Class<?> actionDefClass = resolveClass(classLoader, ACTION_DEF_CLASS);
            Class<?> actionDataClass = resolveClass(classLoader, ACTION_DATA_CLASS);
            Class<?> actionDefBuilderClass = resolveClass(classLoader, ACTION_DEF_BUILDER_CLASS);
            Class<?> actionSetBuilderClass = resolveClass(classLoader, ACTION_SET_BUILDER_CLASS);
            Class<?> intentionClass = resolveClass(classLoader, INTENTION_CLASS);
            Class<?> keyboardTypeClass = resolveClass(classLoader, KEYBOARD_TYPE_CLASS);
            Class<?> gestureDispatcherClass = resolveClass(classLoader, GESTURE_DISPATCHER_CLASS);
            Class<?> preferenceManagerClass = resolveClass(classLoader, PREFERENCE_MANAGER_CLASS);

            softKeyViewClass.getDeclaredField("e").setAccessible(true);
            actionDefsField = actionSetClass.getDeclaredField("m");
            actionDefsField.setAccessible(true);
            keyLabelTextsField = actionSetClass.getDeclaredField("n");
            keyLabelTextsField.setAccessible(true);
            keyLabelIdsField = actionSetClass.getDeclaredField("o");
            keyLabelIdsField.setAccessible(true);

            pointerTrackerClass.getDeclaredMethod("i").setAccessible(true);
            pointerTrackerClass.getDeclaredMethod("h", float.class, float.class, actionTypeClass)
                    .setAccessible(true);

            exactActionLookupMethod = actionSetClass.getDeclaredMethod("a", actionTypeClass);
            exactActionLookupMethod.setAccessible(true);

            actionDefTypeField = actionDefClass.getDeclaredField("c");
            actionDefTypeField.setAccessible(true);
            actionEntriesField = actionDefClass.getDeclaredField("d");
            actionEntriesField.setAccessible(true);
            actionPopupLayoutField = actionDefClass.getDeclaredField("g");
            actionPopupLayoutField.setAccessible(true);
            actionPopupLabelsField = actionDefClass.getDeclaredField("n");
            actionPopupLabelsField.setAccessible(true);
            actionPopupIconsField = actionDefClass.getDeclaredField("o");
            actionPopupIconsField.setAccessible(true);

            actionPayloadField = actionDataClass.getDeclaredField("e");
            actionPayloadField.setAccessible(true);
            actionKeycodeField = actionDataClass.getDeclaredField("c");
            actionKeycodeField.setAccessible(true);
            actionIntentionField = actionDataClass.getDeclaredField("d");
            actionIntentionField.setAccessible(true);
            actionDataConstructor = actionDataClass.getDeclaredConstructor(
                    int.class, intentionClass, Object.class);
            actionDataConstructor.setAccessible(true);

            keyboardTypeFromStringMethod = keyboardTypeClass.getDeclaredMethod("a", String.class);
            keyboardTypeFromStringMethod.setAccessible(true);
            keyboardTypeNameField = keyboardTypeClass.getDeclaredField("k");
            keyboardTypeNameField.setAccessible(true);

            actionBuilderConstructor = actionDefBuilderClass.getDeclaredConstructor();
            actionBuilderConstructor.setAccessible(true);
            actionTypeField = actionDefBuilderClass.getDeclaredField("a");
            actionTypeField.setAccessible(true);
            actionBuilderEntriesField = actionDefBuilderClass.getDeclaredField("b");
            actionBuilderEntriesField.setAccessible(true);
            popupIconField = actionDefBuilderClass.getDeclaredField("d");
            popupIconField.setAccessible(true);
            popupLabelField = actionDefBuilderClass.getDeclaredField("c");
            popupLabelField.setAccessible(true);
            contentDescriptionField = actionDefBuilderClass.getDeclaredField("m");
            contentDescriptionField.setAccessible(true);
            setSingleActionMethod = actionDefBuilderClass.getDeclaredMethod(
                    "p", int.class, intentionClass, Object.class);
            setSingleActionMethod.setAccessible(true);
            buildActionMethod = actionDefBuilderClass.getDeclaredMethod("c");
            buildActionMethod.setAccessible(true);
            copyActionMethod = actionDefBuilderClass.getDeclaredMethod("j", actionDefClass);
            copyActionMethod.setAccessible(true);

            keyMetadataBuilderConstructor = actionSetBuilderClass.getDeclaredConstructor();
            keyMetadataBuilderConstructor.setAccessible(true);
            keyMetadataBuilderActionsField = actionSetBuilderClass.getDeclaredField("b");
            keyMetadataBuilderActionsField.setAccessible(true);
            actionSetBuilderClass.getDeclaredField("g").setAccessible(true);
            actionSetBuilderClass.getDeclaredField("h").setAccessible(true);
            actionSetBuilderClass.getDeclaredField("z").setAccessible(true);
            copyKeyMetadataMethod = actionSetBuilderClass.getDeclaredMethod("j", actionSetClass);
            copyKeyMetadataMethod.setAccessible(true);
            actionSetBuilderClass.getDeclaredMethod("q", actionDefClass).setAccessible(true);
            buildKeyMetadataMethod = actionSetBuilderClass.getDeclaredMethod("d");
            buildKeyMetadataMethod.setAccessible(true);
            actionSetBuilderClass.getDeclaredMethod("t", int[].class, CharSequence[].class)
                    .setAccessible(true);

            gestureDispatcherClass.getDeclaredField("c").setAccessible(true);
            preferenceManagerClass.getDeclaredMethod("O", Context.class).setAccessible(true);
            preferenceManagerClass.getDeclaredMethod("au", String.class).setAccessible(true);
            preferenceManagerClass.getDeclaredMethod("f", String.class, boolean.class)
                    .setAccessible(true);

            commitIntention = Enum.valueOf(intentionClass.asSubclass(Enum.class),
                    INTENTION_NAME_COMMIT);
            pressActionType = Enum.valueOf(actionTypeClass.asSubclass(Enum.class),
                    ACTION_NAME_PRESS);
            longPressActionType = Enum.valueOf(actionTypeClass.asSubclass(Enum.class),
                    ACTION_NAME_LONG_PRESS);
            slideUpActionType = Enum.valueOf(actionTypeClass.asSubclass(Enum.class),
                    ACTION_NAME_SLIDE_UP);
            slideDownActionType = Enum.valueOf(actionTypeClass.asSubclass(Enum.class),
                    ACTION_NAME_SLIDE_DOWN);
        }

        Object findExactAction(Object keyMetadata, Object actionType) throws Throwable {
            return exactActionLookupMethod.invoke(keyMetadata, actionType);
        }

        Object[] extractActionDefs(Object keyMetadata) throws Throwable {
            if (keyMetadata == null) {
                return new Object[0];
            }
            Object actionDefsObject = actionDefsField.get(keyMetadata);
            return actionDefsObject instanceof Object[] ? (Object[]) actionDefsObject
                    : new Object[0];
        }

        boolean isActionType(Object actionDef, Object actionType) throws Throwable {
            if (actionDef == null || actionType == null) {
                return false;
            }
            return actionType.equals(actionDefTypeField.get(actionDef));
        }

        int extractPopupLayoutRes(Object actionDef) throws Throwable {
            if (actionDef == null) {
                return 0;
            }
            Object popupLayout = actionPopupLayoutField.get(actionDef);
            return popupLayout instanceof Integer ? ((Integer) popupLayout).intValue() : 0;
        }

        String[] extractPopupLabels(Object actionDef) throws Throwable {
            if (actionDef == null) {
                return new String[0];
            }
            Object popupLabels = actionPopupLabelsField.get(actionDef);
            return popupLabels instanceof String[] ? (String[]) popupLabels : new String[0];
        }

        int[] extractPopupIcons(Object actionDef) throws Throwable {
            if (actionDef == null) {
                return new int[0];
            }
            Object popupIcons = actionPopupIconsField.get(actionDef);
            return popupIcons instanceof int[] ? (int[]) popupIcons : new int[0];
        }

        Object[] extractActionEntries(Object actionDef) throws Throwable {
            if (actionDef == null) {
                return new Object[0];
            }
            Object actionsObject = actionEntriesField.get(actionDef);
            return actionsObject instanceof Object[] ? (Object[]) actionsObject : new Object[0];
        }

        Integer extractActionEntryKeycode(Object actionEntry) throws Throwable {
            if (actionEntry == null) {
                return null;
            }
            Object keycode = actionKeycodeField.get(actionEntry);
            return keycode instanceof Integer ? (Integer) keycode : null;
        }

        String extractActionEntryPayload(Object actionEntry) throws Throwable {
            if (actionEntry == null) {
                return null;
            }
            Object payload = actionPayloadField.get(actionEntry);
            if (payload instanceof CharSequence) {
                return payload.toString();
            }
            if (payload != null && keyboardTypeNameField.getDeclaringClass().isInstance(payload)) {
                Object value = keyboardTypeNameField.get(payload);
                return value instanceof String ? (String) value : null;
            }
            return null;
        }

        String extractSinglePayloadToken(Object actionDef) throws Throwable {
            Object[] actionEntries = extractActionEntries(actionDef);
            if (actionEntries.length == 0) {
                return null;
            }
            return extractActionEntryPayload(actionEntries[0]);
        }

        String extractPrimaryLabel(Object keyMetadata) throws Throwable {
            if (keyMetadata == null) {
                return null;
            }
            Object labelsObject = keyLabelTextsField.get(keyMetadata);
            if (!(labelsObject instanceof CharSequence[])) {
                return null;
            }
            CharSequence[] labels = (CharSequence[]) labelsObject;
            for (CharSequence label : labels) {
                if (label == null) {
                    continue;
                }
                String value = label.toString();
                if (!value.isBlank()) {
                    return value;
                }
            }
            return null;
        }

        Object buildKeyboardType(String keyboardType) throws Throwable {
            return keyboardTypeFromStringMethod.invoke(null, keyboardType);
        }

        void replaceActionOnKeyMetadataBuilder(Object builder, Object actionType, Object actionDef)
                throws Throwable {
            if (builder == null || actionType == null || actionDef == null) {
                return;
            }
            Object actionsObject = keyMetadataBuilderActionsField.get(builder);
            if (actionsObject instanceof Map<?, ?>) {
                @SuppressWarnings("unchecked")
                Map<Object, Object> actionMap = (Map<Object, Object>) actionsObject;
                actionMap.put(actionType, actionDef);
            }
        }

        Object buildLongPressShortcutActionByAppendingEntry(Object templateAction,
                int keycode, Object data, String popupLabel, int popupIconResId)
                throws Throwable {
            if (templateAction == null) {
                return null;
            }

            Object builder = actionBuilderConstructor.newInstance();
            copyActionMethod.invoke(builder, templateAction);
            actionTypeField.set(builder, longPressActionType);

            Object[] existingEntries = extractActionEntries(templateAction);
            Object updatedEntries = Array.newInstance(
                    actionDataConstructor.getDeclaringClass(), existingEntries.length + 1);
            System.arraycopy(existingEntries, 0, updatedEntries, 0, existingEntries.length);
            Array.set(updatedEntries, existingEntries.length,
                    actionDataConstructor.newInstance(keycode, null, data));
            actionBuilderEntriesField.set(builder, updatedEntries);

            popupLabelField.set(builder, appendPopupLabels(
                    extractPopupLabels(templateAction),
                    existingEntries.length, popupLabel));
            popupIconField.set(builder, appendPopupIcons(
                    extractPopupIcons(templateAction),
                    existingEntries.length, popupIconResId));
            return buildActionMethod.invoke(builder);
        }

        Object buildLongPressShortcutActionByReplacingEntry(Object templateAction,
                int targetEntryIndex, int keycode, Object data, String popupLabel,
                int popupIconResId) throws Throwable {
            if (templateAction == null || targetEntryIndex < 0) {
                return null;
            }

            Object[] existingEntries = extractActionEntries(templateAction);
            if (targetEntryIndex >= existingEntries.length) {
                return null;
            }

            Object builder = actionBuilderConstructor.newInstance();
            copyActionMethod.invoke(builder, templateAction);
            actionTypeField.set(builder, longPressActionType);

            Object updatedEntries = Array.newInstance(
                    actionDataConstructor.getDeclaringClass(), existingEntries.length);
            System.arraycopy(existingEntries, 0, updatedEntries, 0, existingEntries.length);
            Array.set(updatedEntries, targetEntryIndex,
                    actionDataConstructor.newInstance(keycode, null, data));
            actionBuilderEntriesField.set(builder, updatedEntries);

            popupLabelField.set(builder, replacePopupLabel(
                    extractPopupLabels(templateAction), existingEntries.length,
                    targetEntryIndex, popupLabel));
            popupIconField.set(builder, replacePopupIcon(
                    extractPopupIcons(templateAction), existingEntries.length,
                    targetEntryIndex, popupIconResId));
            return buildActionMethod.invoke(builder);
        }

        private String[] appendPopupLabels(String[] source, int existingEntryCount,
                String appendedLabel) {
            String[] safeSource = source != null ? source : new String[0];
            String[] result = new String[existingEntryCount + 1];
            if (safeSource.length == 1 && existingEntryCount > 1) {
                for (int index = 0; index < existingEntryCount; index++) {
                    result[index] = safeSource[0];
                }
            } else if (safeSource.length > 0) {
                System.arraycopy(safeSource, 0, result, 0,
                        Math.min(safeSource.length, existingEntryCount));
            }
            result[existingEntryCount] = appendedLabel;
            return result;
        }

        private int[] appendPopupIcons(int[] source, int existingEntryCount, int appendedIcon) {
            int[] safeSource = source != null ? source : new int[0];
            int[] result = new int[existingEntryCount + 1];
            if (safeSource.length == 1 && existingEntryCount > 1) {
                for (int index = 0; index < existingEntryCount; index++) {
                    result[index] = safeSource[0];
                }
            } else if (safeSource.length > 0) {
                System.arraycopy(safeSource, 0, result, 0,
                        Math.min(safeSource.length, existingEntryCount));
            }
            result[existingEntryCount] = appendedIcon;
            return result;
        }

        private String[] replacePopupLabel(String[] source, int entryCount, int targetEntryIndex,
                String replacementLabel) {
            String[] result = normalizePopupLabels(source, entryCount);
            result[targetEntryIndex] = replacementLabel;
            return result;
        }

        private int[] replacePopupIcon(int[] source, int entryCount, int targetEntryIndex,
                int replacementIcon) {
            int[] result = normalizePopupIcons(source, entryCount);
            result[targetEntryIndex] = replacementIcon;
            return result;
        }

        private String[] normalizePopupLabels(String[] source, int entryCount) {
            String[] safeSource = source != null ? source : new String[0];
            String[] result = new String[entryCount];
            if (safeSource.length == 1 && entryCount > 1) {
                for (int index = 0; index < entryCount; index++) {
                    result[index] = safeSource[0];
                }
                return result;
            }
            if (safeSource.length > 0) {
                System.arraycopy(safeSource, 0, result, 0,
                        Math.min(safeSource.length, entryCount));
            }
            return result;
        }

        private int[] normalizePopupIcons(int[] source, int entryCount) {
            int[] safeSource = source != null ? source : new int[0];
            int[] result = new int[entryCount];
            if (safeSource.length == 1 && entryCount > 1) {
                for (int index = 0; index < entryCount; index++) {
                    result[index] = safeSource[0];
                }
                return result;
            }
            if (safeSource.length > 0) {
                System.arraycopy(safeSource, 0, result, 0,
                        Math.min(safeSource.length, entryCount));
            }
            return result;
        }
    }
}
