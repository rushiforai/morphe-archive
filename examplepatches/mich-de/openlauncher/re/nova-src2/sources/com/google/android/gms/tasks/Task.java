package com.google.android.gms.tasks;

import fi.c;
import fi.d;
import fi.e;
import fi.f;
import fi.g;
import fi.i;
import fi.t;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class Task<TResult> {
    public void a(Executor executor, d dVar) {
        throw new UnsupportedOperationException("addOnCanceledListener is not implemented");
    }

    public void b(e eVar) {
        throw new UnsupportedOperationException("addOnCompleteListener is not implemented");
    }

    public void c(Executor executor, e eVar) {
        throw new UnsupportedOperationException("addOnCompleteListener is not implemented");
    }

    public abstract t d(f fVar);

    public abstract t e(Executor executor, f fVar);

    public abstract t f(g gVar);

    public abstract t g(Executor executor, g gVar);

    public Task h(c cVar) {
        throw new UnsupportedOperationException("continueWith is not implemented");
    }

    public Task i(Executor executor, c cVar) {
        throw new UnsupportedOperationException("continueWith is not implemented");
    }

    public Task j(c cVar) {
        throw new UnsupportedOperationException("continueWithTask is not implemented");
    }

    public Task k(Executor executor, c cVar) {
        throw new UnsupportedOperationException("continueWithTask is not implemented");
    }

    public abstract Exception l();

    public abstract Object m();

    public abstract Object n();

    public abstract boolean o();

    public abstract boolean p();

    public abstract boolean q();

    public Task r(i iVar) {
        throw new UnsupportedOperationException("onSuccessTask is not implemented");
    }

    public Task s(Executor executor, i iVar) {
        throw new UnsupportedOperationException("onSuccessTask is not implemented");
    }
}
