package com.google.android.gms.common.api.internal;

import android.os.Looper;
import b.a3;
import com.google.android.gms.common.annotation.KeepName;
import com.google.android.gms.common.api.Status;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import p50.i;
import qg.j;
import qg.k;
import rg.d;
import rg.r;
import sg.w;

@KeepName
/* loaded from: classes3.dex */
public abstract class BasePendingResult<R extends k> extends i {

    /* renamed from: j, reason: collision with root package name */
    public static final a3 f31815j = new a3(12);

    /* renamed from: e, reason: collision with root package name */
    public k f31820e;

    /* renamed from: f, reason: collision with root package name */
    public Status f31821f;

    /* renamed from: g, reason: collision with root package name */
    public volatile boolean f31822g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f31823h;

    /* renamed from: a, reason: collision with root package name */
    public final Object f31816a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final CountDownLatch f31817b = new CountDownLatch(1);

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f31818c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f31819d = new AtomicReference();

    /* renamed from: i, reason: collision with root package name */
    public boolean f31824i = false;

    public BasePendingResult(qg.i iVar) {
        new d(iVar != null ? ((r) iVar).f85918b.f84058g : Looper.getMainLooper(), 1);
        new WeakReference(iVar);
    }

    public final void A(Status status) {
        synchronized (this.f31816a) {
            try {
                if (!B()) {
                    C(z(status));
                    this.f31823h = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean B() {
        return this.f31817b.getCount() == 0;
    }

    public final void C(k kVar) {
        synchronized (this.f31816a) {
            try {
                if (this.f31823h) {
                    return;
                }
                B();
                w.j("Results have already been set", !B());
                w.j("Result has already been consumed", !this.f31822g);
                this.f31820e = kVar;
                this.f31821f = kVar.h();
                this.f31817b.countDown();
                ArrayList arrayList = this.f31818c;
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    ((j) arrayList.get(i5)).a(this.f31821f);
                }
                arrayList.clear();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void D() {
        boolean z11 = true;
        if (!this.f31824i && !((Boolean) f31815j.get()).booleanValue()) {
            z11 = false;
        }
        this.f31824i = z11;
    }

    @Override // p50.i
    public final k h() {
        k kVar;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        w.j("Result has already been consumed.", !this.f31822g);
        try {
            if (!this.f31817b.await(0L, timeUnit)) {
                A(Status.f31809m);
            }
        } catch (InterruptedException unused) {
            A(Status.f31807k);
        }
        w.j("Result is not ready.", B());
        synchronized (this.f31816a) {
            w.j("Result has already been consumed.", !this.f31822g);
            w.j("Result is not ready.", B());
            kVar = this.f31820e;
            this.f31820e = null;
            this.f31822g = true;
        }
        if (this.f31819d.getAndSet(null) != null) {
            throw new ClassCastException();
        }
        w.h(kVar);
        return kVar;
    }

    public final void y(j jVar) {
        synchronized (this.f31816a) {
            try {
                if (B()) {
                    jVar.a(this.f31821f);
                } else {
                    this.f31818c.add(jVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public abstract k z(Status status);
}
