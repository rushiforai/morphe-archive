/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.function.Consumer;

/** Registers player observers without linking the Java event API to the Kotlin runtime. */
final class YandexPlayerEvents {
    private YandexPlayerEvents() { }

    static <T> Runnable observe(Object event, Consumer<T> observer) {
        try {
            Method add;
            Object listener;
            try {
                add = event.getClass().getMethod("addObserver", Consumer.class);
                listener = observer;
            } catch (NoSuchMethodException legacyEvent) {
                // Only older Morphe bases need Kotlin. Never resolve these classes
                // on Java-only bases, whose patched APK may contain no Kotlin runtime.
                ClassLoader loader = event.getClass().getClassLoader();
                Class<?> function = Class.forName("kotlin.jvm.functions.Function1", false, loader);
                Object unit = Class.forName("kotlin.Unit", true, loader).getField("INSTANCE").get(null);
                add = event.getClass().getMethod("addObserver", function);
                listener = Proxy.newProxyInstance(loader, new Class<?>[]{function}, (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "invoke":
                            @SuppressWarnings("unchecked") T value = (T) args[0];
                            observer.accept(value);
                            return unit;
                        case "equals":
                            return proxy == args[0];
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        case "toString":
                            return "YandexPlayerObserver";
                        default:
                            throw new UnsupportedOperationException(method.getName());
                    }
                });
            }
            Method remove = event.getClass().getMethod("removeObserver", add.getParameterTypes()[0]);
            Object registeredListener = listener;
            add.invoke(event, listener);
            // Keep the exact listener object, including the legacy proxy, for removal.
            return () -> {
                try {
                    remove.invoke(event, registeredListener);
                } catch (ReflectiveOperationException error) {
                    throw new IllegalStateException("Cannot remove Yandex player observer", error);
                }
            };
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Cannot register Yandex player observer", error);
        }
    }
}
