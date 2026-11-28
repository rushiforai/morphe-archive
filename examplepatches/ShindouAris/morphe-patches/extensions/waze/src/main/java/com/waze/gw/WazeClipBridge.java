package com.waze.gw;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicBoolean;

/** Waze sound queue, shared with navigation/TTS. Must be called on the main looper. */
final class WazeClipBridge {
    // Kotlin runtime names differ per Waze generation: {Function0, Unit}.
    private static final String[][] KOTLIN = {{"g.h.a.a", "g.ab"}, {"h.g.a.a", "h.ab"}};

    private WazeClipBridge() { }

    static void play(File file, boolean preview, Runnable completed) throws Exception {
        Object manager = WazeKoin.singleton("com.waze.sound.SoundNativeManager");
        if (manager == null) throw new IllegalStateException("SoundNativeManager not ready");

        Class<?> callbackType = null;
        Object unit = null;
        for (String[] names : KOTLIN) {
            try {
                callbackType = Class.forName(names[0]);
                unit = Class.forName(names[1]).getField("a").get(null);
                break;
            } catch (Throwable ignored) { /* next generation */ }
        }
        if (callbackType == null) throw new IllegalStateException("Kotlin runtime not recognised");

        // 5.24 kept the player in SoundNativeManager.soundPlayer; 5.27 holds it in a renamed field of the
        // type that declares play(filePath, cacheKey, ignoreSoftMute, ignoreHardMute, onPlayCompleted).
        Object player = null;
        Method play = null;
        for (Class<?> type = manager.getClass(); type != null && play == null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (clipMethod(field.getType(), callbackType) == null) continue;
                field.setAccessible(true);
                Object value = field.get(manager);
                if (value != null) {
                    player = value;
                    play = clipMethod(value.getClass(), callbackType);
                    break;
                }
            }
        }
        if (player == null || play == null) throw new IllegalStateException("Waze sound player not found");

        // 5.24's player ignored requests until its engine field m was initialised; do not wedge our queue.
        try {
            Field engineField = player.getClass().getDeclaredField("m");
            engineField.setAccessible(true);
            Object engine = engineField.get(player);
            if (engine == null) throw new IllegalStateException("Waze sound engine not ready");
            Method ready = engine.getClass().getDeclaredMethod("v");
            ready.setAccessible(true);
            if (ready.invoke(engine) == null) throw new IllegalStateException("Waze ExoPlayer not ready");
        } catch (NoSuchFieldException | NoSuchMethodException ignored) {
            // 5.27 queues the request itself; the caller's 60 s release covers a dropped callback.
        }

        final Object result = unit;
        AtomicBoolean finished = new AtomicBoolean();
        Object callback = Proxy.newProxyInstance(callbackType.getClassLoader(),
                new Class<?>[]{callbackType}, (proxy, method, args) -> {
                    if (method.getName().equals("invoke")) {
                        if (finished.compareAndSet(false, true)) completed.run();
                        return result;
                    }
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == args[0];
                    return "WazeModClipCompletion";
                });
        // Mod policy already checked sound mode; hard mute/calls remain owned by Waze.
        boolean bypass = preview || WazeSoundMode.allowsClip("overspeed");
        play.invoke(player, file.getAbsolutePath(), null, bypass, false, callback);
    }

    /** The public void method (String, String, boolean, boolean, callbackType) of type, if any. */
    private static Method clipMethod(Class<?> type, Class<?> callbackType) {
        for (Method method : type.getMethods()) {
            Class<?>[] p = method.getParameterTypes();
            if (method.getReturnType() == Void.TYPE && p.length == 5 && p[0] == String.class
                    && p[1] == String.class && p[2] == boolean.class && p[3] == boolean.class
                    && p[4] == callbackType) {
                return method;
            }
        }
        return null;
    }
}
