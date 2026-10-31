package com.google.firebase.crashlytics.internal.concurrency;

import b00.z0;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import fi.c;
import fi.i;
import fi.t;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: classes.dex */
public class CrashlyticsWorker implements Executor {
    private final ExecutorService executor;
    private final Object tailLock = new Object();
    private Task<?> tail = Tasks.d(null);

    public CrashlyticsWorker(ExecutorService executorService) {
        this.executor = executorService;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ void lambda$await$6() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Task lambda$submit$0(Callable callable, Task task) throws Exception {
        return Tasks.d(callable.call());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Task lambda$submit$1(Runnable runnable, Task task) throws Exception {
        runnable.run();
        return Tasks.d(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Task lambda$submitTask$2(Callable callable, Task task) throws Exception {
        return (Task) callable.call();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Task lambda$submitTask$3(Callable callable, Task task) throws Exception {
        return (Task) callable.call();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Task lambda$submitTaskOnSuccess$4(Callable callable, Task task) throws Exception {
        return (Task) callable.call();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Task lambda$submitTaskOnSuccess$5(i iVar, Task task) throws Exception {
        if (task.q()) {
            return iVar.then(task.m());
        }
        if (task.l() != null) {
            return Tasks.c(task.l());
        }
        t tVar = new t();
        tVar.w();
        return tVar;
    }

    public void await() throws ExecutionException, InterruptedException, TimeoutException {
        Tasks.a(submit(new a10.a(4)), 30L, TimeUnit.SECONDS);
        Thread.sleep(1L);
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        this.executor.execute(runnable);
    }

    public ExecutorService getExecutor() {
        return this.executor;
    }

    public <T> Task<T> submit(Callable<T> callable) {
        t tVar;
        synchronized (this.tailLock) {
            tVar = (Task<T>) this.tail.k(this.executor, new a(callable, 0));
            this.tail = tVar;
        }
        return tVar;
    }

    public <T> Task<T> submitTask(Callable<Task<T>> callable) {
        t tVar;
        synchronized (this.tailLock) {
            tVar = (Task<T>) this.tail.k(this.executor, new a(callable, 1));
            this.tail = tVar;
        }
        return tVar;
    }

    public <T, R> Task<R> submitTaskOnSuccess(Callable<Task<T>> callable, i iVar) {
        Task taskK;
        synchronized (this.tailLock) {
            taskK = this.tail.k(this.executor, new a(callable, 3)).k(this.executor, new ae.i(iVar, 13));
            this.tail = taskK;
        }
        return taskK;
    }

    public Task<Void> submit(Runnable runnable) {
        Task<Void> taskK;
        synchronized (this.tailLock) {
            taskK = this.tail.k(this.executor, new z0(runnable, 5));
            this.tail = taskK;
        }
        return taskK;
    }

    public <T, R> Task<R> submitTask(Callable<Task<T>> callable, c cVar) {
        Task taskK;
        synchronized (this.tailLock) {
            taskK = this.tail.k(this.executor, new a(callable, 2)).k(this.executor, cVar);
            this.tail = taskK;
        }
        return taskK;
    }
}
