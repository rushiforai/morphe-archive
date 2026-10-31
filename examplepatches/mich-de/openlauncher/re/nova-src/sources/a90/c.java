package a90;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.RejectedExecutionException;
import java.util.logging.Level;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final e f515a;

    /* renamed from: b, reason: collision with root package name */
    public final String f516b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f517c;

    /* renamed from: d, reason: collision with root package name */
    public a f518d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f519e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f520f;

    public c(e eVar, String name) {
        Intrinsics.g(name, "name");
        this.f515a = eVar;
        this.f516b = name;
        this.f519e = new ArrayList();
    }

    public final void a() {
        byte[] bArr = y80.c.f96853a;
        synchronized (this.f515a) {
            try {
                if (b()) {
                    this.f515a.d(this);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean b() {
        a aVar = this.f518d;
        if (aVar != null && aVar.f510b) {
            this.f520f = true;
        }
        ArrayList arrayList = this.f519e;
        boolean z11 = false;
        for (int size = arrayList.size() - 1; -1 < size; size--) {
            if (((a) arrayList.get(size)).f510b) {
                a aVar2 = (a) arrayList.get(size);
                lm.e eVar = e.f523h;
                if (e.f525j.isLoggable(Level.FINE)) {
                    android.support.v4.media.session.b.E(aVar2, this, "canceled");
                }
                arrayList.remove(size);
                z11 = true;
            }
        }
        return z11;
    }

    public final void c(a task, long j11) {
        Intrinsics.g(task, "task");
        synchronized (this.f515a) {
            if (!this.f517c) {
                if (e(task, j11, false)) {
                    this.f515a.d(this);
                }
                Unit unit = Unit.f71706a;
            } else if (task.f510b) {
                lm.e eVar = e.f523h;
                if (e.f525j.isLoggable(Level.FINE)) {
                    android.support.v4.media.session.b.E(task, this, "schedule canceled (queue is shutdown)");
                }
            } else {
                lm.e eVar2 = e.f523h;
                if (e.f525j.isLoggable(Level.FINE)) {
                    android.support.v4.media.session.b.E(task, this, "schedule failed (queue is shutdown)");
                }
                throw new RejectedExecutionException();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x008b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x007f A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean e(a task, long j11, boolean z11) {
        Iterator it;
        int size;
        Intrinsics.g(task, "task");
        c cVar = task.f511c;
        if (cVar != this) {
            if (cVar != null) {
                throw new IllegalStateException("task is in multiple queues");
            }
            task.f511c = this;
        }
        long jNanoTime = System.nanoTime();
        long j12 = jNanoTime + j11;
        ArrayList arrayList = this.f519e;
        int iIndexOf = arrayList.indexOf(task);
        if (iIndexOf == -1) {
            task.f512d = j12;
            lm.e eVar = e.f523h;
            if (e.f525j.isLoggable(Level.FINE)) {
                android.support.v4.media.session.b.E(task, this, z11 ? "run again after ".concat(android.support.v4.media.session.b.T(j12 - jNanoTime)) : "scheduled after ".concat(android.support.v4.media.session.b.T(j12 - jNanoTime)));
            }
            it = arrayList.iterator();
            size = 0;
            while (true) {
                if (it.hasNext()) {
                    size = -1;
                    break;
                }
                if (((a) it.next()).f512d - jNanoTime > j11) {
                    break;
                }
                size++;
            }
            if (size == -1) {
                size = arrayList.size();
            }
            arrayList.add(size, task);
            if (size != 0) {
                return true;
            }
        } else if (task.f512d <= j12) {
            lm.e eVar2 = e.f523h;
            if (e.f525j.isLoggable(Level.FINE)) {
                android.support.v4.media.session.b.E(task, this, "already scheduled");
                return false;
            }
        } else {
            arrayList.remove(iIndexOf);
            task.f512d = j12;
            lm.e eVar3 = e.f523h;
            if (e.f525j.isLoggable(Level.FINE)) {
            }
            it = arrayList.iterator();
            size = 0;
            while (true) {
                if (it.hasNext()) {
                }
                size++;
            }
            if (size == -1) {
            }
            arrayList.add(size, task);
            if (size != 0) {
            }
        }
        return false;
    }

    public final void f() {
        byte[] bArr = y80.c.f96853a;
        synchronized (this.f515a) {
            try {
                this.f517c = true;
                if (b()) {
                    this.f515a.d(this);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final String toString() {
        return this.f516b;
    }
}
