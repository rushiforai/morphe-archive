package io.github.emotionbug.patches.runtime;

import rikka.shizuku.ShizukuProvider;

/** Configure forwarding before the provider is published, including a cold service start. */
public final class RecorderShizukuProvider extends ShizukuProvider {
    @Override public boolean onCreate() {
        disableAutomaticSuiInitialization();
        enableMultiProcessSupport(true);
        return super.onCreate();
    }
}
