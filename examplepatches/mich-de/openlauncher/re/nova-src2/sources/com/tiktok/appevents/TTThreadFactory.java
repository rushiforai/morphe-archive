package com.tiktok.appevents;

import com.tiktok.TikTokBusinessSdk;
import java.lang.Thread;
import java.util.concurrent.ThreadFactory;

/* loaded from: classes4.dex */
public class TTThreadFactory implements ThreadFactory {
    static final String TAG = TTInAppPurchaseManager.class.getCanonicalName();

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        Thread thread = new Thread(runnable);
        thread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.tiktok.appevents.TTThreadFactory.1
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread thread2, Throwable th2) {
                TTCrashHandler.handleCrash(TTThreadFactory.TAG, th2, 3);
                if (TikTokBusinessSdk.getCrashListener() != null) {
                    TikTokBusinessSdk.getCrashListener().onCrash(thread2, th2);
                }
            }
        });
        return thread;
    }
}
