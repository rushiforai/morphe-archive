package com.fyber.inneractive.sdk.util;

import java.util.concurrent.ThreadFactory;

/* loaded from: classes3.dex */
public final class b implements ThreadFactory {
    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread thread = new Thread(runnable);
        thread.setDaemon(true);
        return thread;
    }
}
