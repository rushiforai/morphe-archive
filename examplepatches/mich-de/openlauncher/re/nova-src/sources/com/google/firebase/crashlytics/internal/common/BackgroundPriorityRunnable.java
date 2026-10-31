package com.google.firebase.crashlytics.internal.common;

import android.os.Process;

/* loaded from: classes3.dex */
public abstract class BackgroundPriorityRunnable implements Runnable {
    public abstract void onRun();

    @Override // java.lang.Runnable
    public final void run() throws SecurityException, IllegalArgumentException {
        Process.setThreadPriority(10);
        onRun();
    }
}
