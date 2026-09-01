package com.google.android.gms.common.api.internal;

import android.os.Looper;
import com.google.android.gms.common.api.Status;
import defpackage.a89;
import defpackage.bt;
import defpackage.cjb;
import defpackage.rd6;
import defpackage.vp7;
import defpackage.wif;
import defpackage.wn0;
import defpackage.ygf;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class BasePendingResult<R extends cjb> {
    static final ThreadLocal zaa = new bt(7);
    protected final wn0 zab;
    protected final WeakReference zac;
    private cjb zaj;
    private Status zak;
    private volatile boolean zal;
    private boolean zam;
    private boolean zan;
    private final Object zae = new Object();
    private final CountDownLatch zaf = new CountDownLatch(1);
    private final ArrayList zag = new ArrayList();
    private final AtomicReference zai = new AtomicReference();
    private boolean zaq = false;

    public BasePendingResult(wif wifVar) {
        this.zab = new wn0(wifVar != null ? wifVar.a.g : Looper.getMainLooper(), 0);
        this.zac = new WeakReference(wifVar);
    }

    public abstract cjb a(Status status);

    public final void addStatusListener(a89 a89Var) {
        vp7.k("Callback cannot be null.", a89Var != null);
        synchronized (this.zae) {
            try {
                if (isReady()) {
                    a89Var.a(this.zak);
                } else {
                    this.zag.add(a89Var);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final R await(long j, TimeUnit timeUnit) {
        R r;
        if (j > 0 && Looper.getMainLooper() == Looper.myLooper()) {
            ygf.f("await must not be called on the UI thread when time is greater than zero.");
            return null;
        }
        vp7.r("Result has already been consumed.", !this.zal);
        try {
            if (!this.zaf.await(j, timeUnit)) {
                forceFailureUnlessReady(Status.h);
            }
        } catch (InterruptedException unused) {
            forceFailureUnlessReady(Status.f);
        }
        vp7.r("Result is not ready.", isReady());
        synchronized (this.zae) {
            vp7.r("Result has already been consumed.", !this.zal);
            vp7.r("Result is not ready.", isReady());
            r = (R) this.zaj;
            this.zaj = null;
            this.zal = true;
        }
        if (this.zai.getAndSet(null) == null) {
            vp7.p(r);
            return r;
        }
        rd6.m();
        return null;
    }

    @Deprecated
    public final void forceFailureUnlessReady(Status status) {
        synchronized (this.zae) {
            try {
                if (!isReady()) {
                    setResult(a(status));
                    this.zan = true;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final boolean isReady() {
        return this.zaf.getCount() == 0;
    }

    public final void setResult(R r) {
        synchronized (this.zae) {
            try {
                if (this.zan || this.zam) {
                    zal(r);
                    return;
                }
                isReady();
                vp7.r("Results have already been set", !isReady());
                vp7.r("Result has already been consumed", !this.zal);
                this.zaj = r;
                this.zak = r.c();
                this.zaf.countDown();
                ArrayList arrayList = this.zag;
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    ((a89) arrayList.get(i)).a(this.zak);
                }
                arrayList.clear();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void zak() {
        boolean z = true;
        if (!this.zaq && !((Boolean) zaa.get()).booleanValue()) {
            z = false;
        }
        this.zaq = z;
    }

    public static void zal(cjb cjbVar) {
    }
}
