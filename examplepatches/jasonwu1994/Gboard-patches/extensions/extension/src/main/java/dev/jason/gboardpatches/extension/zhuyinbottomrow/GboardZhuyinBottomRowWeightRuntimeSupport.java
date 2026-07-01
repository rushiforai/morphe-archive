package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

final class GboardZhuyinBottomRowWeightRuntimeSupport {
    private static final String ACTION_TYPE_CLASS = "nxi";
    private static final String ACTION_SET_CLASS = "oaa";
    private static final String ACTION_DEF_CLASS = "nxl";
    private static final String ACTION_DATA_CLASS = "nyf";
    private static final String ACTION_NAME_PRESS = "PRESS";
    private static final String ACTION_NAME_LONG_PRESS = "LONG_PRESS";
    private static final String ACTION_NAME_SLIDE_UP = "SLIDE_UP";
    private static final String ACTION_NAME_SLIDE_DOWN = "SLIDE_DOWN";

    private static final Map<ClassLoader, ReflectionHandles> REFLECTION_BY_LOADER =
            Collections.synchronizedMap(new WeakHashMap<ClassLoader, ReflectionHandles>());

    private GboardZhuyinBottomRowWeightRuntimeSupport() {
    }

    enum LegacyKeyboardKind {
        NONE,
        ZHUYIN
    }

    static final class KeyBehavior {
        final String primaryLabel;
        final String pressText;
        final LegacyKeyboardKind legacyKeyboardKind;

        KeyBehavior(String primaryLabel, String pressText, LegacyKeyboardKind legacyKeyboardKind) {
            this.primaryLabel = primaryLabel;
            this.pressText = pressText;
            this.legacyKeyboardKind = legacyKeyboardKind;
        }
    }

    static ReflectionHandles reflectionHandles(ClassLoader classLoader) throws Throwable {
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

    static KeyBehavior inspectKeyBehavior(ReflectionHandles handles, Object keyMetadata)
            throws Throwable {
        String primaryLabel = handles.extractPrimaryLabel(keyMetadata);
        Object pressAction = handles.findExactAction(keyMetadata, handles.pressActionType);
        String pressText = handles.extractSinglePayloadToken(pressAction);
        Object longPressAction = handles.findExactAction(keyMetadata, handles.longPressActionType);
        String[] tokens = handles.extractPayloadTokens(longPressAction);
        boolean hasSlideUpAction =
                handles.findExactAction(keyMetadata, handles.slideUpActionType) != null;
        boolean hasSlideDownAction =
                handles.findExactAction(keyMetadata, handles.slideDownActionType) != null;
        boolean legacyZhuyinCandidate =
                isLegacyZhuyinSlideCandidate(primaryLabel, tokens, hasSlideUpAction,
                        hasSlideDownAction);
        return new KeyBehavior(primaryLabel, pressText,
                legacyZhuyinCandidate ? LegacyKeyboardKind.ZHUYIN : LegacyKeyboardKind.NONE);
    }

    private static boolean isLegacyZhuyinSlideCandidate(String primaryLabel, String[] tokens,
            boolean hasSlideUpAction, boolean hasSlideDownAction) {
        if (primaryLabel != null && isZhuyinSymbolToken(primaryLabel)) {
            return hasSlideUpAction || hasSlideDownAction;
        }
        if (tokens == null || tokens.length < 2) {
            return false;
        }
        String primaryToken = firstNonBlankToken(tokens);
        return primaryToken != null && isZhuyinSymbolToken(primaryToken)
                && (hasSlideUpAction || hasSlideDownAction);
    }

    private static String firstNonBlankToken(String[] tokens) {
        if (tokens == null) {
            return null;
        }
        for (String token : tokens) {
            if (token != null && !token.isBlank()) {
                return token;
            }
        }
        return null;
    }

    private static boolean isZhuyinSymbolToken(String token) {
        if (token == null || token.length() != 1) {
            return false;
        }
        char value = token.charAt(0);
        return (value >= '\u3105' && value <= '\u3129')
                || value == '\u00B7'
                || value == '\u02CA'
                || value == '\u02C7'
                || value == '\u02CB'
                || value == '\u02D9';
    }

    static final class ReflectionHandles {
        final Field softKeyMetadataField;
        final Field keyLabelTextsField;
        final Method exactActionLookupMethod;
        final Field actionEntriesField;
        final Field actionPayloadField;
        final Object pressActionType;
        final Object longPressActionType;
        final Object slideUpActionType;
        final Object slideDownActionType;

        ReflectionHandles(ClassLoader classLoader) throws Throwable {
            Class<?> actionTypeClass = Class.forName(ACTION_TYPE_CLASS, false, classLoader);
            Class<?> actionSetClass = Class.forName(ACTION_SET_CLASS, false, classLoader);
            Class<?> actionDefClass = Class.forName(ACTION_DEF_CLASS, false, classLoader);
            Class<?> actionDataClass = Class.forName(ACTION_DATA_CLASS, false, classLoader);
            Class<?> softKeyViewClass = Class.forName(
                    "com.google.android.libraries.inputmethod.widgets.SoftKeyView",
                    false,
                    classLoader);

            softKeyMetadataField = softKeyViewClass.getDeclaredField("e");
            softKeyMetadataField.setAccessible(true);

            keyLabelTextsField = actionSetClass.getDeclaredField("n");
            keyLabelTextsField.setAccessible(true);

            exactActionLookupMethod = actionSetClass.getDeclaredMethod("a", actionTypeClass);
            exactActionLookupMethod.setAccessible(true);

            actionEntriesField = actionDefClass.getDeclaredField("d");
            actionEntriesField.setAccessible(true);

            actionPayloadField = actionDataClass.getDeclaredField("e");
            actionPayloadField.setAccessible(true);

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

        String extractPrimaryLabel(Object keyMetadata) throws Throwable {
            if (keyMetadata == null) {
                return null;
            }
            Object labelsObject = keyLabelTextsField.get(keyMetadata);
            if (!(labelsObject instanceof CharSequence[] labels)) {
                return null;
            }
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

        String[] extractPayloadTokens(Object actionDef) throws Throwable {
            if (actionDef == null) {
                return new String[0];
            }
            Object actionsObject = actionEntriesField.get(actionDef);
            if (!(actionsObject instanceof Object[] actionEntries) || actionEntries.length == 0) {
                return new String[0];
            }
            List<String> tokens = new ArrayList<String>();
            for (Object actionEntry : actionEntries) {
                if (actionEntry == null) {
                    continue;
                }
                Object payload = actionPayloadField.get(actionEntry);
                if (payload instanceof CharSequence charSequence) {
                    String token = charSequence.toString();
                    if (!token.isBlank()) {
                        tokens.add(token);
                    }
                }
            }
            return tokens.toArray(String[]::new);
        }

        String extractSinglePayloadToken(Object actionDef) throws Throwable {
            String[] tokens = extractPayloadTokens(actionDef);
            return tokens.length == 0 ? null : tokens[0];
        }
    }
}
