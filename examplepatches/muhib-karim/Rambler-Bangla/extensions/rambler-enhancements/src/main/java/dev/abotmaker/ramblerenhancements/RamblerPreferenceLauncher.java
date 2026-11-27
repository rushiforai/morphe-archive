package dev.abotmaker.ramblerenhancements;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.lang.reflect.Field;

/**
 * Intercepts clicks on our injected {@code <Preference><intent ... /></Preference>} rows inside
 * {@code androidx.preference.Preference.performClick()} and converts the internal action into an
 * explicit {@link Intent} targeting {@code context.getPackageName()} +
 * {@link RamblerEnhancementsActivity}.
 *
 * <p>Android 14+ (API 34–37) blocks implicit intents from matching {@code android:exported="false"}
 * activities ("No application found to handle the action"). Resolving {@code context.getPackageName()}
 * at click time satisfies Android 14+ explicit-intent rules while staying 100% immune to GboardWu's
 * {@code Package Rename} regardless of patch order.</p>
 */
public final class RamblerPreferenceLauncher {
    private static final String TAG = "RamblerEnhancements";
    public static final String ACTION_OPEN_SETTINGS =
            "dev.abotmaker.ramblerenhancements.OPEN_SETTINGS";

    private static volatile PrefFieldHandles cachedHandles;

    private RamblerPreferenceLauncher() {
    }

    static void clearForTesting() {
        cachedHandles = null;
    }

    /**
     * Called at the top of {@code androidx.preference.Preference.performClick()}.
     *
     * @return {@code true} if the preference belonged to Rambler Enhancements and was launched
     *         explicitly; {@code false} to let Gboard handle the click normally.
     */
    public static boolean maybeLaunch(Object preference) {
        if (preference == null) {
            return false;
        }
        try {
            PrefFieldHandles handles = resolveHandles(preference.getClass());
            if (handles == null || handles.intentField == null || handles.contextField == null) {
                return false;
            }
            Object rawIntent = handles.intentField.get(preference);
            if (!(rawIntent instanceof Intent intent)) {
                return false;
            }
            if (!ACTION_OPEN_SETTINGS.equals(intent.getAction())) {
                return false;
            }
            Object rawContext = handles.contextField.get(preference);
            if (!(rawContext instanceof Context context)) {
                return false;
            }
            Intent explicit = buildExplicitIntent(context, intent);
            context.startActivity(explicit);
            return true;
        } catch (Throwable throwable) {
            logWarningSafely("Failed to launch Rambler Enhancements settings", throwable);
            return false;
        }
    }

    static Intent buildExplicitIntent(Context context, Intent sourceIntent) {
        Intent explicit = new Intent(sourceIntent);
        explicit.setClassName(
                context.getPackageName(),
                RamblerEnhancementsActivity.class.getName());
        if (!(context instanceof Activity)) {
            explicit.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        return explicit;
    }

    private static PrefFieldHandles resolveHandles(Class<?> preferenceClass) {
        PrefFieldHandles existing = cachedHandles;
        if (existing != null && existing.ownerClass.isAssignableFrom(preferenceClass)) {
            return existing;
        }
        PrefFieldHandles resolved = PrefFieldHandles.find(preferenceClass);
        if (resolved != null) {
            cachedHandles = resolved;
        }
        return resolved;
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Hooks must never throw into Gboard.
        }
    }

    private static final class PrefFieldHandles {
        final Class<?> ownerClass;
        final Field contextField;
        final Field intentField;

        private PrefFieldHandles(Class<?> ownerClass, Field contextField, Field intentField) {
            this.ownerClass = ownerClass;
            this.contextField = contextField;
            this.intentField = intentField;
        }

        static PrefFieldHandles find(Class<?> startClass) {
            Field contextField = findField(
                    startClass, RamblerDynamicConfig.PREF_CONTEXT_FIELD, Context.class);
            Field intentField = findField(
                    startClass, RamblerDynamicConfig.PREF_INTENT_FIELD, Intent.class);
            if (contextField == null || intentField == null) {
                return null;
            }
            Class<?> owner = contextField.getDeclaringClass();
            return new PrefFieldHandles(owner, contextField, intentField);
        }

        private static Field findField(
                Class<?> startClass, String preferredName, Class<?> expectedType) {
            for (Class<?> cls = startClass; cls != null && cls != Object.class; cls = cls.getSuperclass()) {
                if (preferredName != null && !preferredName.isEmpty()) {
                    try {
                        Field f = cls.getDeclaredField(preferredName);
                        if (expectedType.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            return f;
                        }
                    } catch (Throwable ignored) {
                        // Continue searching superclasses / scanning by type.
                    }
                }
            }
            for (Class<?> cls = startClass; cls != null && cls != Object.class; cls = cls.getSuperclass()) {
                for (Field candidate : cls.getDeclaredFields()) {
                    if (candidate.getType() == expectedType) {
                        candidate.setAccessible(true);
                        return candidate;
                    }
                }
            }
            return null;
        }
    }
}
