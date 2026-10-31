package com.bytedance.adsdk.zb;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

/* loaded from: classes2.dex */
public class ry<T> {
    public static Executor ycx = Executors.newCachedThreadPool();

    /* renamed from: dj, reason: collision with root package name */
    private final Handler f22940dj;
    private volatile ok<T> lud;
    private final Set<ea<Throwable>> sya;

    /* renamed from: zb, reason: collision with root package name */
    private final Set<ea<T>> f22941zb;

    public static class ycx<T> extends FutureTask<ok<T>> {
        private ry<T> ycx;

        public ycx(ry<T> ryVar, Callable<ok<T>> callable) {
            super(callable);
            this.ycx = ryVar;
        }

        @Override // java.util.concurrent.FutureTask
        public void done() {
            try {
                if (isCancelled()) {
                    return;
                }
                try {
                    this.ycx.ycx((ok) get());
                } catch (InterruptedException | ExecutionException e3) {
                    this.ycx.ycx(new ok(e3));
                }
            } finally {
                this.ycx = null;
            }
        }
    }

    public ry(Callable<ok<T>> callable) {
        this(callable, false);
    }

    public synchronized ry<T> dj(ea<Throwable> eaVar) {
        this.sya.remove(eaVar);
        return this;
    }

    public synchronized ry<T> sya(ea<Throwable> eaVar) {
        try {
            ok<T> okVar = this.lud;
            if (okVar != null && okVar.zb() != null) {
                eaVar.ycx(okVar.zb());
            }
            this.sya.add(eaVar);
        } catch (Throwable th2) {
            throw th2;
        }
        return this;
    }

    public synchronized ry<T> zb(ea<T> eaVar) {
        this.f22941zb.remove(eaVar);
        return this;
    }

    public ry(Callable<ok<T>> callable, boolean z11) {
        this.f22941zb = new LinkedHashSet(1);
        this.sya = new LinkedHashSet(1);
        this.f22940dj = new Handler(Looper.getMainLooper());
        this.lud = null;
        if (!z11) {
            ycx.execute(new ycx(this, callable));
            return;
        }
        try {
            ycx((ok) callable.call());
        } catch (Throwable th2) {
            ycx((ok) new ok<>(th2));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(ok<T> okVar) {
        if (this.lud == null) {
            this.lud = okVar;
            ycx();
            return;
        }
        throw new IllegalStateException("A task may only be set once.");
    }

    public synchronized ry<T> ycx(ea<T> eaVar) {
        try {
            ok<T> okVar = this.lud;
            if (okVar != null && okVar.ycx() != null) {
                eaVar.ycx(okVar.ycx());
            }
            this.f22941zb.add(eaVar);
        } catch (Throwable th2) {
            throw th2;
        }
        return this;
    }

    private void ycx() {
        this.f22940dj.post(new Runnable() { // from class: com.bytedance.adsdk.zb.ry.1
            @Override // java.lang.Runnable
            public void run() {
                ok okVar = ry.this.lud;
                if (okVar == null) {
                    return;
                }
                if (okVar.ycx() != null) {
                    ry.this.ycx((ry) okVar.ycx());
                } else {
                    ry.this.ycx(okVar.zb());
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void ycx(T t6) {
        Iterator it = new ArrayList(this.f22941zb).iterator();
        while (it.hasNext()) {
            ((ea) it.next()).ycx(t6);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void ycx(Throwable th2) {
        ArrayList arrayList = new ArrayList(this.sya);
        if (arrayList.isEmpty()) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((ea) it.next()).ycx(th2);
        }
    }
}
