/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.settings;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.lang.reflect.Proxy;

/**
 * Values for the "Nyandex" row that the patch adds to the app's settings screen.
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    private static volatile Object onClick;

    private SettingsEntry() {
    }

    public static String header() {
        return "Nyandex";
    }

    public static String title() {
        return NyandexSettings.text("Nyandex Settings", "Настройки Nyandex");
    }

    public static String subtitle() {
        return NyandexSettings.text("Bottom bar tabs and other Nyandex options",
                "Вкладки нижней панели и другие настройки Nyandex");
    }

    /**
     * A {@code kotlin.jvm.functions.Function0} that opens the Nyandex settings page. The app's own
     * Kotlin runtime provides the interface, so it is implemented with a dynamic proxy.
     */
    public static Object onClick() {
        Object current = onClick;
        if (current != null) return current;
        try {
            Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0",
                    false, SettingsEntry.class.getClassLoader());
            current = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0},
                    (proxy, method, arguments) -> {
                        switch (method.getName()) {
                            case "invoke":
                                open();
                                return null;
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "equals":
                                return arguments != null && proxy == arguments[0];
                            case "toString":
                                return "NyandexSettingsEntry";
                            default:
                                return null;
                        }
                    });
            onClick = current;
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to create the settings click handler", throwable);
        }
        return current;
    }

    private static void open() {
        try {
            Context context = NyandexSettings.context();
            if (context == null) return;
            Intent intent = new Intent(context, NyandexSettingsActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to open the Nyandex settings", throwable);
        }
    }
}
