package com.google.common.util.concurrent;

import java.util.concurrent.Executor;
import java.util.concurrent.Future;

/* loaded from: classes.dex */
public interface ListenableFuture extends Future {
    void b(Runnable runnable, Executor executor);
}
