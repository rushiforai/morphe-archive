package dev.utaa.linimal.extension.features.font;

import android.content.Context;

/** hook はどちらも引数に Context を持たないため、プロセスの Application を取得します。 */
final class FontContext {
    private FontContext() {
    }

    static Context currentApplication() {
        try {
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
