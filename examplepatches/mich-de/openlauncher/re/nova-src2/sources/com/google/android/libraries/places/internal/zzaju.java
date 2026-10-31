package com.google.android.libraries.places.internal;

import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
enum zzaju implements Executor {
    INSTANCE;

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.run();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "MoreExecutors.directExecutor()";
    }
}
