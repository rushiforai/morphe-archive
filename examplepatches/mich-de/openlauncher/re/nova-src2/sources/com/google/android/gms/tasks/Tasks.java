package com.google.android.gms.tasks;

import a8.b;
import ab.z;
import android.os.Looper;
import fi.k;
import fi.l;
import fi.m;
import fi.s;
import fi.t;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import sg.w;
import vm.c;

/* loaded from: classes.dex */
public final class Tasks {
    public static Object a(Task task, long j11, TimeUnit timeUnit) throws TimeoutException {
        w.g("Must not be called on the main application thread");
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper != null && Objects.equals(looperMyLooper.getThread().getName(), "GoogleApiHandler")) {
            throw new IllegalStateException("Must not be called on GoogleApiHandler thread.");
        }
        w.i(task, "Task must not be null");
        w.i(timeUnit, "TimeUnit must not be null");
        if (task.p()) {
            return g(task);
        }
        l lVar = new l(0);
        Executor executor = k.f55137b;
        task.g(executor, lVar);
        task.e(executor, lVar);
        task.a(executor, lVar);
        if (lVar.c(j11, timeUnit)) {
            return g(task);
        }
        throw new TimeoutException("Timed out waiting for Task");
    }

    public static <TResult> TResult await(Task<TResult> task) throws ExecutionException, InterruptedException {
        w.g("Must not be called on the main application thread");
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper != null && Objects.equals(looperMyLooper.getThread().getName(), "GoogleApiHandler")) {
            throw new IllegalStateException("Must not be called on GoogleApiHandler thread.");
        }
        w.i(task, "Task must not be null");
        if (task.p()) {
            return (TResult) g(task);
        }
        l lVar = new l(0);
        s sVar = k.f55137b;
        task.g(sVar, lVar);
        task.e(sVar, lVar);
        task.a(sVar, lVar);
        lVar.b();
        return (TResult) g(task);
    }

    public static t b(Callable callable, Executor executor) {
        w.i(executor, "Executor must not be null");
        t tVar = new t();
        executor.execute(new z(tVar, callable, false, 21));
        return tVar;
    }

    public static t c(Exception exc) {
        t tVar = new t();
        tVar.v(exc);
        return tVar;
    }

    public static t d(Object obj) {
        t tVar = new t();
        tVar.t(obj);
        return tVar;
    }

    public static t e(List list) {
        if (list == null || list.isEmpty()) {
            return d(null);
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            if (((Task) it.next()) == null) {
                throw new NullPointerException("null tasks are not accepted");
            }
        }
        t tVar = new t();
        m mVar = new m(list.size(), tVar);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            Task task = (Task) it2.next();
            s sVar = k.f55137b;
            task.g(sVar, mVar);
            task.e(sVar, mVar);
            task.a(sVar, mVar);
        }
        return tVar;
    }

    public static Task f(Task... taskArr) {
        if (taskArr.length == 0) {
            return d(Collections.EMPTY_LIST);
        }
        List listAsList = Arrays.asList(taskArr);
        b bVar = k.f55136a;
        if (listAsList == null || listAsList.isEmpty()) {
            return d(Collections.EMPTY_LIST);
        }
        List list = listAsList;
        return e(list).k(bVar, new c(list));
    }

    public static Object g(Task task) throws ExecutionException {
        if (task.q()) {
            return task.m();
        }
        if (task.o()) {
            throw new CancellationException("Task is already canceled");
        }
        throw new ExecutionException(task.l());
    }
}
