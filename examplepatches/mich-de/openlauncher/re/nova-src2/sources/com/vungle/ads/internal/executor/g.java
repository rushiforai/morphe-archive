package com.vungle.ads.internal.executor;

import java.util.concurrent.Callable;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {
    public static final h a(Runnable runnable, Runnable runnable2) {
        int i5 = j.f46834b;
        return runnable instanceof com.vungle.ads.internal.task.i ? new e(runnable, runnable2) : new f(runnable, runnable2);
    }

    public static Callable b(Callable callable, i iVar) {
        return new b.i(5, callable, iVar);
    }

    public static final Object a(Callable command, Function0 failFallback) {
        Intrinsics.g(command, "$command");
        Intrinsics.g(failFallback, "$failFallback");
        try {
            return command.call();
        } catch (OutOfMemoryError unused) {
            failFallback.invoke();
            return null;
        }
    }
}
