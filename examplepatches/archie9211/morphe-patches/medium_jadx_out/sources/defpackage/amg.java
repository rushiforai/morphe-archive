package defpackage;

import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class amg implements x0g {
    public final WeakReference a;
    public final mkg b = new mkg(this);

    public amg(ohg ohgVar) {
        this.a = new WeakReference(ohgVar);
    }

    @Override // defpackage.x0g
    public final void b(Runnable runnable, Executor executor) {
        this.b.b(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        ohg ohgVar = (ohg) this.a.get();
        boolean zCancel = this.b.cancel(z);
        if (!zCancel || ohgVar == null) {
            return zCancel;
        }
        ohgVar.a = null;
        ohgVar.b = null;
        ohgVar.c.i(null);
        return true;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.b.get();
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.b.a instanceof x1g;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.b.isDone();
    }

    public final String toString() {
        return this.b.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j, TimeUnit timeUnit) {
        return this.b.get(j, timeUnit);
    }
}
