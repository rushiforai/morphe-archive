package dev.jason.gboardpatches.extension.spacebarlogo;

import android.util.Log;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

public final class GboardSpacebarLogo1777Runtime {
    private static final String TAG = "GboardPatches";
    private static final String ACTION_TYPE_CLASS = "oth";
    private static final String ACTION_DEF_CLASS = "otk";
    private static final String ACTION_ENTRY_CLASS = "oud";
    private static final int KEYCODE_SPACE = 62;
    public static final int SPACEBAR_VIEW_ID = 0x7f0b05e0;
    public static final int PRIMARY_LABEL_VIEW_ID = 0x7f0b062a;
    public static final int GOOGLE_G_DRAWABLE_ID = 0x7f08045c;
    public static final int HEART_DRAWABLE_ID = 0x7f080448;
    public static final int EMOJI_DRAWABLE_ID = 0x7f080489;
    private static final GboardSpacebarLogoRuntime.ViewBindings VIEW_BINDINGS =
            new GboardSpacebarLogoRuntime.ViewBindings(
                    SPACEBAR_VIEW_ID, PRIMARY_LABEL_VIEW_ID, GOOGLE_G_DRAWABLE_ID,
                    HEART_DRAWABLE_ID, EMOJI_DRAWABLE_ID);
    private static final Map<ClassLoader, Decoder> DECODERS = new WeakHashMap<>();
    private static final Map<Object, Boolean> INCOMING_SPACE_ACTIONS = new WeakHashMap<>();

    private GboardSpacebarLogo1777Runtime() {
    }

    public static void beforeSoftKeyBound(Object receiver, Object metadata) {
        try {
            rememberIncomingSpaceAction(receiver, metadata);
        } catch (Throwable throwable) {
            forgetIncomingSpaceActionSafely(receiver);
            logWarningSafely("Failed to decode incoming spacebar bind", throwable);
        }
        try {
            if (receiver instanceof View) {
                GboardSpacebarLogoRuntime.beforeSoftKeyBound((View) receiver, VIEW_BINDINGS);
            }
        } catch (Throwable throwable) {
            logWarningSafely("Failed to restore spacebar before bind", throwable);
        }
    }

    public static void afterSoftKeyBound(Object receiver, Object metadata) {
        if (!(receiver instanceof View)) return;
        View view = (View) receiver;
        try {
            boolean isSpaceAction = resolveSpaceAction(receiver, metadata);
            GboardSpacebarLogoRuntime.afterSoftKeyBound(
                    view, isSpaceAction, GboardSpacebarLogoSettings.snapshot(view.getContext()),
                    VIEW_BINDINGS);
        } catch (Throwable throwable) {
            restoreDisabledAppearanceSafely(view);
            logWarningSafely("Failed to decode spacebar bind", throwable);
        }
    }

    public static int[] iconDrawableResourceIds() {
        return new int[] {GOOGLE_G_DRAWABLE_ID, HEART_DRAWABLE_ID, EMOJI_DRAWABLE_ID};
    }

    private static void rememberIncomingSpaceAction(Object receiver, Object metadata)
            throws Throwable {
        if (receiver == null) return;
        boolean isSpaceAction = metadata != null
                && decoder(metadata.getClass().getClassLoader()).isSpaceAction(metadata);
        synchronized (INCOMING_SPACE_ACTIONS) {
            INCOMING_SPACE_ACTIONS.put(receiver, Boolean.valueOf(isSpaceAction));
        }
    }

    private static void forgetIncomingSpaceAction(Object receiver) {
        if (receiver == null) return;
        synchronized (INCOMING_SPACE_ACTIONS) {
            INCOMING_SPACE_ACTIONS.remove(receiver);
        }
    }

    private static void forgetIncomingSpaceActionSafely(Object receiver) {
        try {
            forgetIncomingSpaceAction(receiver);
        } catch (Throwable ignored) {
            // Runtime ABI entries must never propagate failures into the host bind path.
        }
    }

    private static void restoreDisabledAppearanceSafely(View view) {
        try {
            GboardSpacebarLogoRuntime.afterSoftKeyBound(
                    view, false, new GboardSpacebarLogoRuntime.SettingsSnapshot(
                            false, false, 0, GboardSpacebarLogoContract.DEFAULT_ICON),
                    VIEW_BINDINGS);
        } catch (Throwable ignored) {
            // Best-effort stock restore; the host bind must continue even if cleanup fails.
        }
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Logging is diagnostic only and must not escape a runtime ABI boundary.
        }
    }

    private static boolean resolveSpaceAction(Object receiver, Object metadata) throws Throwable {
        Boolean incoming = null;
        if (receiver != null) {
            synchronized (INCOMING_SPACE_ACTIONS) {
                incoming = INCOMING_SPACE_ACTIONS.remove(receiver);
            }
        }
        if (incoming != null) return incoming.booleanValue();
        if (metadata == null) return false;
        return decoder(metadata.getClass().getClassLoader()).isSpaceAction(metadata);
    }

    private static Decoder decoder(ClassLoader classLoader) throws Throwable {
        synchronized (DECODERS) {
            Decoder cached = DECODERS.get(classLoader);
            if (cached != null) return cached;
            Decoder created = new Decoder(classLoader);
            DECODERS.put(classLoader, created);
            return created;
        }
    }

    private static final class Decoder {
        private final Method pressActionMethod;
        private final Method primaryEntryMethod;
        private final Field keycodeField;
        private final Object pressActionType;

        Decoder(ClassLoader classLoader) throws Throwable {
            Class<?> metadataClass = Class.forName("owd", false, classLoader);
            Class<?> actionTypeClass = Class.forName(ACTION_TYPE_CLASS, false, classLoader);
            Class<?> actionDefClass = Class.forName(ACTION_DEF_CLASS, false, classLoader);
            Class<?> actionEntryClass = Class.forName(ACTION_ENTRY_CLASS, false, classLoader);
            pressActionMethod = metadataClass.getDeclaredMethod("h", actionTypeClass);
            primaryEntryMethod = actionDefClass.getDeclaredMethod("b");
            keycodeField = actionEntryClass.getDeclaredField("c");
            pressActionType = enumValue(actionTypeClass, "PRESS");
            pressActionMethod.setAccessible(true);
            primaryEntryMethod.setAccessible(true);
            keycodeField.setAccessible(true);
        }

        boolean isSpaceAction(Object metadata) throws Throwable {
            Object action = pressActionMethod.invoke(metadata, pressActionType);
            Object entry = action == null ? null : primaryEntryMethod.invoke(action);
            return entry != null && keycodeField.getInt(entry) == KEYCODE_SPACE;
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static Object enumValue(Class<?> enumClass, String name) {
        return Enum.valueOf((Class<? extends Enum>) enumClass.asSubclass(Enum.class), name);
    }
}
