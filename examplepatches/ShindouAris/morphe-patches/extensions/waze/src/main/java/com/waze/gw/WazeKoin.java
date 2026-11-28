package com.waze.gw;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/**
 * Finds Waze singletons without compile-time access to the APK.
 *
 * Up to 5.24 the managers had a static getInstance(); 5.27 resolves them from Waze's DI container instead
 * (the static "get(Class)" locator, whose owner class is renamed in every release), so every bridge asks
 * here. The locator list is per Waze generation; the first one that answers wins.
 */
final class WazeKoin {
    private static final String[][] LOCATORS = {
            {"kotlinx.coroutines.db", "u"},   // Waze 5.27
            {"k.z", "j"},                     // Waze 5.24
            {"k.y", "j"},                     // Waze 5.22 / 5.23
    };
    private static volatile Method resolved;

    private WazeKoin() { }

    /** The instance of type from the DI container, or null when no locator knows the type yet. */
    static Object get(Class<?> type) {
        Method locator = resolved;
        if (locator != null) {
            Object value = invoke(locator, type);
            if (value != null) return value;
        }
        for (String[] entry : LOCATORS) {
            try {
                Method method = Class.forName(entry[0]).getMethod(entry[1], Class.class);
                if (!Modifier.isStatic(method.getModifiers())) continue;
                Object value = invoke(method, type);
                if (value != null && type.isInstance(value)) {
                    resolved = method;
                    return value;
                }
            } catch (Throwable ignored) { /* try the next generation */ }
        }
        return null;
    }

    /** className's singleton: static getInstance() when the class still has one, else the DI container. */
    static Object singleton(String className) throws ClassNotFoundException {
        Class<?> type = Class.forName(className);
        try {
            Method getInstance = type.getMethod("getInstance");
            if (Modifier.isStatic(getInstance.getModifiers())) {
                Object value = getInstance.invoke(null);
                if (value != null) return value;
            }
        } catch (Throwable ignored) { /* no getInstance (5.27) */ }
        return get(type);
    }

    private static Object invoke(Method method, Class<?> type) {
        try {
            return method.invoke(null, type);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
