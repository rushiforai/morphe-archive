package com.google.firebase.crashlytics.internal.concurrency;

import be.f;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import f5.c;
import fi.b;
import fi.j;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final class CrashlyticsTasks {
    private static final Executor DIRECT = new c(0);

    private CrashlyticsTasks() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Task lambda$race$0(j jVar, AtomicBoolean atomicBoolean, b bVar, Task task) throws Exception {
        if (task.q()) {
            jVar.c(task.m());
        } else if (task.l() != null) {
            jVar.b(task.l());
        } else if (atomicBoolean.getAndSet(true)) {
            bVar.a();
        }
        return Tasks.d(null);
    }

    public static <T> Task<T> race(Task<T> task, Task<T> task2) {
        b bVar = new b();
        j jVar = new j(bVar.f55134a);
        f fVar = new f(2, jVar, new AtomicBoolean(false), bVar);
        Executor executor = DIRECT;
        task.k(executor, fVar);
        task2.k(executor, fVar);
        return jVar.f55135a;
    }
}
