package com.waze.gw;

import android.util.Log;

import java.lang.reflect.Method;

/** Uses Waze's public Java sound wrapper so Waze keeps ownership of mute, focus, queue and AA. */
final class WazeTtsBridge {
    private static final String TAG = "WazeGW-RoadTts";
    private static volatile Object manager;
    private static volatile Method playTts;

    private WazeTtsBridge() { }

    /**
     * playTts(String) up to 5.24. In 5.27 it is the obfuscated SoundNativeManagerBase.j(String message), which
     * posts playTtsNTV to the native looper. (h(String, Function1) beside it is getPathForPrompt, not speech.)
     */
    private static Method ttsMethod(Class<?> type) throws NoSuchMethodException {
        try {
            return type.getMethod("playTts", String.class);
        } catch (NoSuchMethodException legacy) {
            try {
                Method method = type.getMethod("j", String.class);
                if (method.getReturnType() == Void.TYPE && !java.lang.reflect.Modifier.isStatic(method.getModifiers())) {
                    return method;
                }
            } catch (NoSuchMethodException ignored) {
                // fall through to the original error
            }
            throw legacy;
        }
    }

    /**
     * Speaks the Vietnamese source text in the language of the voice selected in Waze. With no translation for that
     * voice it stays silent and still returns true, so callers treat the prompt as handled instead of retrying.
     */
    static boolean speak(String text) {
        if (text == null || text.trim().isEmpty()) return false;
        String spoken = I18n.ttsText(text);
        return spoken == null || speakRaw(spoken);
    }

    /** Same as {@link #speak(String)} for a template with {0}, {1}... placeholders. */
    static boolean speak(String template, Object... args) {
        if (template == null || template.trim().isEmpty()) return false;
        String spoken = I18n.ttsFormat(template, args);
        return spoken == null || speakRaw(spoken);
    }

    /**
     * Speaks text that came from outside the Mod (a map editor's note) exactly as written, in the language it was
     * written in. Stays silent, and returns true so it is not retried, when the selected voice cannot speak free text.
     */
    static boolean speakNote(String text) {
        if (text == null || text.trim().isEmpty()) return false;
        if (!I18n.voiceCanSpeak()) return true;
        return speakRaw(text);
    }

    private static boolean speakRaw(String text) {
        if (text == null || text.trim().isEmpty()) return false;
        Log.i(TAG, "speak: " + text);
        try {
            Method method = playTts;
            Object target = manager;
            if (method == null || target == null) {
                synchronized (WazeTtsBridge.class) {
                    method = playTts;
                    target = manager;
                    if (method == null || target == null) {
                        target = WazeKoin.singleton("com.waze.sound.SoundNativeManager");
                        if (target == null) return false;
                        method = ttsMethod(target.getClass());
                        manager = target;
                        playTts = method;
                    }
                }
            }
            boolean focusBypassArmed = AudioMixPolicy.armForModTts();
            try {
                if (method.getParameterTypes().length == 1) method.invoke(target, text);
                else method.invoke(target, text, null);   // 5.27: playTts(prompt, onDone) with no callback
            } catch (Throwable error) {
                if (focusBypassArmed) AudioMixPolicy.cancelModTtsArm();
                throw error;
            }
            return true;
        } catch (Throwable error) {
            // A null/not-yet-created singleton is expected briefly during early boot.
            Log.w(TAG, "Waze TTS not ready: " + error.getClass().getSimpleName());
            return false;
        }
    }
}
