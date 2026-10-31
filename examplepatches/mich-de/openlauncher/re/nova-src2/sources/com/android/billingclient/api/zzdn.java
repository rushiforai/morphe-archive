package com.android.billingclient.api;

import android.content.Context;
import com.google.android.gms.internal.play_billing.k5;
import com.google.android.gms.internal.play_billing.m0;
import ll.i;
import qd.c;
import qd.d;
import qd.e;
import qd.f;
import rd.a;
import td.p;
import td.q;

/* loaded from: classes2.dex */
final class zzdn {
    private boolean zza;
    private f zzb;

    public zzdn(Context context) {
        try {
            q.b(context);
            this.zzb = q.a().c(a.f85796e).a("PLAY_BILLING_LIBRARY", new c("proto"), new e() { // from class: com.android.billingclient.api.zzdm
                @Override // qd.e
                public final Object apply(Object obj) {
                    return ((k5) obj).b();
                }
            });
        } catch (Throwable unused) {
            this.zza = true;
        }
    }

    public final void zza(k5 k5Var) {
        if (this.zza) {
            m0.h("BillingLogger", "Skipping logging since initialization failed.");
            return;
        }
        try {
            ((p) this.zzb).a(new qd.a(k5Var, d.f83918a, null), new i(16));
        } catch (Throwable unused) {
            m0.h("BillingLogger", "logging failed.");
        }
    }
}
