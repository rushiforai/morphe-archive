package defpackage;

import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uq0 extends ovc {
    public static final Object[] i = new Object[0];
    public static final tq0[] j = new tq0[0];
    public static final tq0[] k = new tq0[0];
    public final AtomicReference c;
    public final AtomicReference d;
    public final Lock e;
    public final Lock f;
    public final AtomicReference g;
    public long h;

    public uq0(Object obj) {
        ReentrantReadWriteLock reentrantReadWriteLock = new ReentrantReadWriteLock();
        this.e = reentrantReadWriteLock.readLock();
        this.f = reentrantReadWriteLock.writeLock();
        this.d = new AtomicReference(j);
        AtomicReference atomicReference = new AtomicReference();
        this.c = atomicReference;
        this.g = new AtomicReference();
        atomicReference.lazySet(obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void F0(tq0 tq0Var) {
        tq0[] tq0VarArr;
        while (true) {
            AtomicReference atomicReference = this.d;
            tq0[] tq0VarArr2 = (tq0[]) atomicReference.get();
            int length = tq0VarArr2.length;
            if (length == 0) {
                return;
            }
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    i2 = -1;
                    break;
                } else if (tq0VarArr2[i2] == tq0Var) {
                    break;
                } else {
                    i2++;
                }
            }
            if (i2 < 0) {
                return;
            }
            if (length == 1) {
                tq0VarArr = j;
            } else {
                tq0[] tq0VarArr3 = new tq0[length - 1];
                System.arraycopy(tq0VarArr2, 0, tq0VarArr3, 0, i2);
                System.arraycopy(tq0VarArr2, i2 + 1, tq0VarArr3, i2, (length - i2) - 1);
                tq0VarArr = tq0VarArr3;
            }
            while (!atomicReference.compareAndSet(tq0VarArr2, tq0VarArr)) {
                if (atomicReference.get() != tq0VarArr2) {
                    break;
                }
            }
            return;
        }
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (this.g.get() != null) {
            sh3Var.dispose();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.vn7
    public final void c0(jn8 jn8Var) {
        tq0 tq0Var = new tq0(jn8Var, this);
        jn8Var.a(tq0Var);
        AtomicReference atomicReference = this.d;
        while (true) {
            tq0[] tq0VarArr = (tq0[]) atomicReference.get();
            if (tq0VarArr == k) {
                Throwable th = (Throwable) this.g.get();
                if (th == w34.a) {
                    jn8Var.onComplete();
                    return;
                } else {
                    jn8Var.onError(th);
                    return;
                }
            }
            int length = tq0VarArr.length;
            tq0[] tq0VarArr2 = new tq0[length + 1];
            System.arraycopy(tq0VarArr, 0, tq0VarArr2, 0, length);
            tq0VarArr2[length] = tq0Var;
            while (!atomicReference.compareAndSet(tq0VarArr, tq0VarArr2)) {
                if (atomicReference.get() != tq0VarArr) {
                    break;
                }
            }
            if (tq0Var.g) {
                F0(tq0Var);
                return;
            }
            if (tq0Var.g) {
                return;
            }
            synchronized (tq0Var) {
                try {
                    if (tq0Var.g) {
                        return;
                    }
                    if (tq0Var.c) {
                        return;
                    }
                    uq0 uq0Var = tq0Var.b;
                    Lock lock = uq0Var.e;
                    lock.lock();
                    tq0Var.h = uq0Var.h;
                    Object obj = uq0Var.c.get();
                    lock.unlock();
                    tq0Var.d = obj != null;
                    tq0Var.c = true;
                    if (obj == null || tq0Var.g || hj8.accept(obj, tq0Var.a)) {
                        return;
                    }
                    tq0Var.a();
                    return;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        AtomicReference atomicReference;
        v34 v34Var = w34.a;
        do {
            atomicReference = this.g;
            if (atomicReference.compareAndSet(null, v34Var)) {
                Object objComplete = hj8.complete();
                AtomicReference atomicReference2 = this.d;
                tq0[] tq0VarArr = k;
                tq0[] tq0VarArr2 = (tq0[]) atomicReference2.getAndSet(tq0VarArr);
                if (tq0VarArr2 != tq0VarArr) {
                    Lock lock = this.f;
                    lock.lock();
                    this.h++;
                    this.c.lazySet(objComplete);
                    lock.unlock();
                }
                for (tq0 tq0Var : tq0VarArr2) {
                    tq0Var.b(this.h, objComplete);
                }
                return;
            }
        } while (atomicReference.get() == null);
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        AtomicReference atomicReference;
        il7.B("onError called with null. Null values are generally not allowed in 2.x operators and sources.", th);
        do {
            atomicReference = this.g;
            if (atomicReference.compareAndSet(null, th)) {
                Object objError = hj8.error(th);
                AtomicReference atomicReference2 = this.d;
                tq0[] tq0VarArr = k;
                tq0[] tq0VarArr2 = (tq0[]) atomicReference2.getAndSet(tq0VarArr);
                if (tq0VarArr2 != tq0VarArr) {
                    Lock lock = this.f;
                    lock.lock();
                    this.h++;
                    this.c.lazySet(objError);
                    lock.unlock();
                }
                for (tq0 tq0Var : tq0VarArr2) {
                    tq0Var.b(this.h, objError);
                }
                return;
            }
        } while (atomicReference.get() == null);
        ok7.H(th);
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        il7.B("onNext called with null. Null values are generally not allowed in 2.x operators and sources.", obj);
        if (this.g.get() != null) {
            return;
        }
        Object next = hj8.next(obj);
        Lock lock = this.f;
        lock.lock();
        this.h++;
        this.c.lazySet(next);
        lock.unlock();
        for (tq0 tq0Var : (tq0[]) this.d.get()) {
            tq0Var.b(this.h, next);
        }
    }
}
