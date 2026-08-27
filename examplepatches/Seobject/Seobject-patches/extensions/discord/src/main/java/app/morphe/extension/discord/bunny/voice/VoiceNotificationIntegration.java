package app.morphe.extension.discord.bunny.voice;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/** Adds Bunny controls to Discord's own semantic VOICE_CALL notification model. */
public final class VoiceNotificationIntegration {
    public static final String HEADLESS_TASK = "BunnyVoiceNotificationAction";
    public static final String OPERATION_KEY = "operation";
    public static final String TOGGLE_MUTE = "toggle-mute";
    public static final String TOGGLE_DEAFEN = "toggle-deafen";
    public static final String DISCONNECT = "disconnect";
    private static final String TAG = "BunnyVoiceControls";

    private VoiceNotificationIntegration() {}

    public static Object extendConfiguration(Object configuration) {
        if (configuration == null) return null;
        try {
            Class<?> type = configuration.getClass();
            Object notificationType = getter(type, "getType").invoke(configuration);
            if (notificationType == null || !"VOICE_CALL".equals(notificationType.toString())) {
                return configuration;
            }

            Class<?> actionType = null;
            for (Class<?> nested : type.getDeclaredClasses()) {
                if ("Action".equals(nested.getSimpleName())) actionType = nested;
            }
            if (actionType == null) return configuration;
            Constructor<?> actionConstructor = actionType.getConstructor(
                    String.class, String.class, String.class, Map.class
            );
            Object existingActionsValue =
                    getter(type, "getAuxiliaryActions").invoke(configuration);
            if (!(existingActionsValue instanceof List<?>)) return configuration;

            List<Object> actions = new ArrayList<>((List<?>) existingActionsValue);
            actions.add(actionConstructor.newInstance(
                    "bunny-voice-mute", HEADLESS_TASK, "Mute",
                    Collections.singletonMap(OPERATION_KEY, TOGGLE_MUTE)
            ));
            actions.add(actionConstructor.newInstance(
                    "bunny-voice-deafen", HEADLESS_TASK, "Deafen",
                    Collections.singletonMap(OPERATION_KEY, TOGGLE_DEAFEN)
            ));
            actions.add(actionConstructor.newInstance(
                    "bunny-voice-disconnect", HEADLESS_TASK, "Disconnect",
                    Collections.singletonMap(OPERATION_KEY, DISCONNECT)
            ));

            Constructor<?> configurationConstructor = null;
            for (Constructor<?> candidate : type.getConstructors()) {
                if (candidate.getParameterTypes().length == 8) configurationConstructor = candidate;
            }
            if (configurationConstructor == null) return configuration;
            return configurationConstructor.newInstance(
                    getter(type, "getTitle").invoke(configuration),
                    getter(type, "getContent").invoke(configuration),
                    getter(type, "getPriority").invoke(configuration),
                    getter(type, "getContentAction").invoke(configuration),
                    actions,
                    notificationType,
                    getter(type, "getIcon").invoke(configuration),
                    getter(type, "getColor").invoke(configuration)
            );
        } catch (Throwable error) {
            Log.w(TAG, "Leaving Discord voice notification unchanged", error);
            return configuration;
        }
    }

    private static Method getter(Class<?> type, String name) throws NoSuchMethodException {
        return type.getMethod(name);
    }
}
