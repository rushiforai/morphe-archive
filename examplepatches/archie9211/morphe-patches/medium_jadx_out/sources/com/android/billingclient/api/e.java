package com.android.billingclient.api;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import defpackage.cbg;
import defpackage.evf;
import defpackage.fbg;
import defpackage.fvf;
import defpackage.hbg;
import defpackage.hvf;
import defpackage.pdg;
import defpackage.qwf;
import defpackage.rxf;
import defpackage.sag;
import defpackage.sdg;
import defpackage.swf;
import defpackage.uag;
import defpackage.udg;
import defpackage.vdg;
import defpackage.wag;
import defpackage.xag;
import defpackage.zag;
import defpackage.zdg;
import defpackage.zjf;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e implements ServiceConnection {
    public final BillingClientStateListener a;
    public final qwf b;
    public final qwf c;
    public final int d;
    public final /* synthetic */ a e;

    public e(a aVar, BillingClientStateListener billingClientStateListener, int i) {
        this.e = aVar;
        swf swfVar = aVar.M;
        this.b = new qwf(swfVar);
        this.c = new qwf(swfVar);
        this.a = billingClientStateListener;
        this.d = i;
    }

    public final void a() {
        synchronized (this.e.a) {
            qwf qwfVar = this.b;
            qwfVar.c = 0L;
            qwfVar.b = false;
            qwfVar.a();
        }
    }

    public final Long b(boolean z) {
        Object obj = this.e.a;
        try {
            if (z) {
                synchronized (obj) {
                    try {
                        qwf qwfVar = this.b;
                        if (!qwfVar.b) {
                            return null;
                        }
                        long jA = qwfVar.a.a();
                        if (!qwfVar.b) {
                            throw new IllegalStateException("This stopwatch is already stopped.");
                        }
                        qwfVar.b = false;
                        long j = (jA - qwfVar.d) + qwfVar.c;
                        qwfVar.c = j;
                        return Long.valueOf(j / 1000000);
                    } finally {
                    }
                }
            }
            synchronized (obj) {
                try {
                    qwf qwfVar2 = this.c;
                    if (!qwfVar2.b) {
                        return null;
                    }
                    long jA2 = qwfVar2.a.a();
                    if (!qwfVar2.b) {
                        throw new IllegalStateException("This stopwatch is already stopped.");
                    }
                    qwfVar2.b = false;
                    long j2 = (jA2 - qwfVar2.d) + qwfVar2.c;
                    qwfVar2.c = j2;
                    return Long.valueOf(j2 / 1000000);
                } finally {
                }
            }
        } catch (Throwable th) {
            rxf.j("BillingClient", "Exception getting connection establishment duration.", th);
            return null;
        }
        rxf.j("BillingClient", "Exception getting connection establishment duration.", th);
        return null;
    }

    public final void c(BillingResult billingResult, cbg cbgVar, String str, boolean z, int i) {
        try {
            zag zagVarR = fbg.r();
            zagVarR.e(billingResult.getResponseCode());
            String debugMessage = billingResult.getDebugMessage();
            zagVarR.b();
            fbg.t((fbg) zagVarR.b, debugMessage);
            zagVarR.d(cbgVar);
            zagVarR.b();
            fbg.u((fbg) zagVarR.b, i);
            if (str != null) {
                zagVarR.b();
                fbg.s((fbg) zagVarR.b, str);
            }
            Long lB = b(z);
            a aVar = this.e;
            if (!z) {
                pdg pdgVarQ = sdg.q();
                pdgVarQ.b();
                sdg.r((sdg) pdgVarQ.b, (fbg) zagVarR.a());
                if (lB != null) {
                    long jLongValue = lB.longValue();
                    pdgVarQ.b();
                    sdg.s((sdg) pdgVarQ.b, jLongValue);
                }
                aVar.h.w((sdg) pdgVarQ.a());
                return;
            }
            vdg vdgVarQ = zdg.q();
            int i2 = this.d;
            vdgVarQ.d(i2 > 0);
            vdgVarQ.e(i2);
            vdgVarQ.b();
            zdg.u((zdg) vdgVarQ.b, i);
            if (lB != null) {
                long jLongValue2 = lB.longValue();
                vdgVarQ.b();
                zdg.t((zdg) vdgVarQ.b, jLongValue2);
            }
            sag sagVarT = uag.t();
            sagVarT.d(zagVarR);
            sagVarT.g(6);
            sagVarT.e(vdgVarQ);
            aVar.A((uag) sagVarT.a());
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
    }

    public final void d(int i, boolean z) {
        try {
            Long lB = b(z);
            a aVar = this.e;
            if (!z) {
                pdg pdgVarQ = sdg.q();
                zag zagVarR = fbg.r();
                zagVarR.e(0);
                zagVarR.b();
                fbg.u((fbg) zagVarR.b, i);
                pdgVarQ.b();
                sdg.r((sdg) pdgVarQ.b, (fbg) zagVarR.a());
                if (lB != null) {
                    long jLongValue = lB.longValue();
                    pdgVarQ.b();
                    sdg.s((sdg) pdgVarQ.b, jLongValue);
                }
                aVar.h.w((sdg) pdgVarQ.a());
                return;
            }
            wag wagVarR = xag.r();
            wagVarR.b();
            xag.q((xag) wagVarR.b, 6);
            vdg vdgVarQ = zdg.q();
            int i2 = this.d;
            vdgVarQ.d(i2 > 0);
            vdgVarQ.e(i2);
            vdgVarQ.b();
            zdg.u((zdg) vdgVarQ.b, i);
            if (lB != null) {
                long jLongValue2 = lB.longValue();
                vdgVarQ.b();
                zdg.t((zdg) vdgVarQ.b, jLongValue2);
            }
            wagVarR.b();
            xag.w((xag) wagVarR.b, (zdg) vdgVarQ.a());
            aVar.B((xag) wagVarR.a());
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
    }

    public final void e(BillingResult billingResult) {
        a aVar = this.e;
        synchronized (aVar.a) {
            try {
                if (aVar.b == 3) {
                    return;
                }
                try {
                    this.a.onBillingSetupFinished(billingResult);
                } catch (Throwable th) {
                    rxf.j("BillingClient", "Exception while calling onBillingSetupFinished.", th);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void f(Exception exc, boolean z, int i) {
        rxf.j("BillingClient", "Exception while invoking initialize AIDL method", exc);
        boolean z2 = exc instanceof DeadObjectException;
        cbg cbgVar = z2 ? cbg.INITIALIZE_DEAD_OBJECT_EXCEPTION : exc instanceof RemoteException ? cbg.INITIALIZE_REMOTE_EXCEPTION : exc instanceof SecurityException ? cbg.INITIALIZE_SECURITY_EXCEPTION : cbg.INITIALIZE_SERVICE_CALL_EXCEPTION;
        String strZza = zzcy.zza(exc);
        this.e.D(0);
        c(z2 ? n.j : n.h, cbgVar, strZza, z, i);
        e(z2 ? n.j : n.h);
    }

    public final void g(Exception exc, boolean z) {
        rxf.j("BillingClient", "Exception while checking if billing is supported; try to reconnect", exc);
        boolean z2 = exc instanceof DeadObjectException;
        cbg cbgVar = z2 ? cbg.IS_BILLING_SUPPORTED_DEAD_OBJECT_EXCEPTION : exc instanceof RemoteException ? cbg.IS_BILLING_SUPPORTED_REMOTE_EXCEPTION : exc instanceof SecurityException ? cbg.IS_BILLING_SUPPORTED_SECURITY_EXCEPTION : cbg.IS_BILLING_SUPPORTED_SERVICE_CALL_EXCEPTION;
        String strZza = cbgVar.equals(cbg.IS_BILLING_SUPPORTED_SERVICE_CALL_EXCEPTION) ? zzcy.zza(exc) : null;
        this.e.D(0);
        c(z2 ? n.j : n.h, cbgVar, strZza, z, 0);
        e(z2 ? n.j : n.h);
    }

    @Override // android.content.ServiceConnection
    public final void onBindingDied(ComponentName componentName) {
        rxf.i("BillingClient", "Billing service died.");
        try {
            a aVar = this.e;
            boolean zT = a.t(aVar);
            zjf zjfVar = aVar.h;
            if (zT) {
                sag sagVarT = uag.t();
                sagVarT.g(6);
                zag zagVarR = fbg.r();
                zagVarR.d(cbg.BINDING_DIED);
                sagVarT.d(zagVarR);
                vdg vdgVarQ = zdg.q();
                int i = this.d;
                vdgVarQ.d(i > 0);
                vdgVarQ.e(i);
                sagVarT.e(vdgVarQ);
                zjfVar.e((uag) sagVarT.a());
            } else {
                zjfVar.t(hbg.q());
            }
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
        a aVar2 = this.e;
        synchronized (aVar2.a) {
            if (aVar2.b != 3 && aVar2.b != 0) {
                aVar2.D(0);
                aVar2.G();
                try {
                    this.a.onBillingServiceDisconnected();
                } catch (Throwable th2) {
                    rxf.j("BillingClient", "Exception while calling onBillingServiceDisconnected.", th2);
                }
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        hvf evfVar;
        rxf.h("BillingClient", "Billing service connected.");
        a aVar = this.e;
        synchronized (aVar.a) {
            try {
                if (aVar.b == 3) {
                    return;
                }
                int i = fvf.f;
                if (iBinder == null) {
                    evfVar = null;
                } else {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.android.vending.billing.IInAppBillingService");
                    evfVar = iInterfaceQueryLocalInterface instanceof hvf ? (hvf) iInterfaceQueryLocalInterface : new evf(iBinder, "com.android.vending.billing.IInAppBillingService", 2);
                }
                aVar.i = evfVar;
                if (a.b(new Callable() { // from class: com.android.billingclient.api.zzbu
                    /* JADX WARN: Removed duplicated region for block: B:138:0x0126 A[EDGE_INSN: B:138:0x0126->B:68:0x0126 BREAK  A[LOOP:0: B:31:0x008a->B:64:0x0104], SYNTHETIC] */
                    /* JADX WARN: Removed duplicated region for block: B:62:0x00f4  */
                    @Override // java.util.concurrent.Callable
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public final java.lang.Object call() {
                        /*
                            Method dump skipped, instruction units count: 538
                            To view this dump add '--comments-level debug' option
                        */
                        throw new UnsupportedOperationException("Method not decompiled: com.android.billingclient.api.zzbu.call():java.lang.Object");
                    }
                }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbv
                    @Override // java.lang.Runnable
                    public final void run() {
                        e eVar = this.zza;
                        a aVar2 = eVar.e;
                        aVar2.D(0);
                        cbg cbgVar = cbg.EXECUTE_ASYNC_TIMEOUT;
                        BillingResult billingResult = n.k;
                        aVar2.C(eVar.d, billingResult, cbgVar);
                        eVar.e(billingResult);
                    }
                }, aVar.u(), aVar.a()) == null) {
                    int i2 = this.d;
                    BillingResult billingResultE = aVar.e();
                    aVar.C(i2, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
                    e(billingResultE);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        rxf.i("BillingClient", "Billing service disconnected.");
        try {
            a aVar = this.e;
            boolean zT = a.t(aVar);
            zjf zjfVar = aVar.h;
            if (zT) {
                sag sagVarT = uag.t();
                sagVarT.g(6);
                zag zagVarR = fbg.r();
                zagVarR.d(cbg.SERVICE_DISCONNECTED);
                sagVarT.d(zagVarR);
                vdg vdgVarQ = zdg.q();
                int i = this.d;
                vdgVarQ.d(i > 0);
                vdgVarQ.e(i);
                sagVarT.e(vdgVarQ);
                zjfVar.e((uag) sagVarT.a());
            } else {
                zjfVar.x(udg.q());
            }
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
        a aVar2 = this.e;
        synchronized (aVar2.a) {
            try {
                qwf qwfVar = this.c;
                qwfVar.c = 0L;
                qwfVar.b = false;
                qwfVar.a();
                if (aVar2.b == 3) {
                    return;
                }
                aVar2.D(0);
                try {
                    this.a.onBillingServiceDisconnected();
                } catch (Throwable th2) {
                    rxf.j("BillingClient", "Exception while calling onBillingServiceDisconnected.", th2);
                }
            } finally {
            }
        }
    }
}
