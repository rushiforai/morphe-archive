package defpackage;

import android.os.Looper;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.a;
import com.android.billingclient.api.n;
import com.drew.imaging.eps.ld.PdtluglzAX;
import defpackage.rxf;
import defpackage.ywf;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ywf implements BillingClientStateListener {
    public final /* synthetic */ ohg a;
    public final /* synthetic */ a b;

    public ywf(a aVar, ohg ohgVar) {
        this.a = ohgVar;
        Objects.requireNonNull(aVar);
        this.b = aVar;
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public final void onBillingServiceDisconnected() {
        rxf.h("BillingClient", "Reconnection attempt failed.");
        try {
            this.a.a(n.j);
        } catch (Throwable th) {
            rxf.j("BillingClient", "Exception setting completer.", th);
        }
        a aVar = this.b;
        if (aVar.J != null) {
            Runnable runnable = new Runnable() { // from class: com.android.billingclient.api.zzbq
                @Override // java.lang.Runnable
                public final void run() {
                    try {
                        this.zza.b.J.onBillingServiceDisconnected();
                    } catch (Throwable th2) {
                        rxf.j("BillingClient", "Exception calling onBillingServiceDisconnected.", th2);
                    }
                }
            };
            if (Looper.myLooper() == Looper.getMainLooper()) {
                runnable.run();
            } else {
                aVar.e.post(runnable);
            }
        }
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public final void onBillingSetupFinished(final BillingResult billingResult) {
        String str = "Reconnection finished with result: " + billingResult.getResponseCode();
        String str2 = PdtluglzAX.crTHwOtVASwc;
        rxf.h(str2, str);
        try {
            this.a.a(billingResult);
        } catch (Throwable th) {
            rxf.j(str2, "Exception setting completer.", th);
        }
        a aVar = this.b;
        if (aVar.J != null) {
            Runnable runnable = new Runnable() { // from class: com.android.billingclient.api.zzbr
                @Override // java.lang.Runnable
                public final void run() {
                    ywf ywfVar = this.zza;
                    try {
                        ywfVar.b.J.onBillingSetupFinished(billingResult);
                    } catch (Throwable th2) {
                        rxf.j("BillingClient", "Exception calling onBillingSetupFinished.", th2);
                    }
                }
            };
            if (Looper.myLooper() == Looper.getMainLooper()) {
                runnable.run();
            } else {
                aVar.e.post(runnable);
            }
        }
    }
}
