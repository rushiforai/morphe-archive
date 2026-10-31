package com.android.billingclient.api;

import android.content.Context;
import com.google.android.gms.internal.play_billing.b5;
import com.google.android.gms.internal.play_billing.c5;
import com.google.android.gms.internal.play_billing.g5;
import com.google.android.gms.internal.play_billing.i5;
import com.google.android.gms.internal.play_billing.j5;
import com.google.android.gms.internal.play_billing.k5;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.n5;
import com.google.android.gms.internal.play_billing.o5;
import com.google.android.gms.internal.play_billing.q4;
import com.google.android.gms.internal.play_billing.r4;
import com.google.android.gms.internal.play_billing.s4;
import com.google.android.gms.internal.play_billing.u4;
import com.google.android.gms.internal.play_billing.y4;

/* loaded from: classes2.dex */
final class zzdl implements zzcz {
    private c5 zzb;
    private final zzdn zzc;

    public zzdl(Context context, c5 c5Var) {
        this.zzc = new zzdn(context);
        this.zzb = c5Var;
    }

    private final void zzl(r4 r4Var, c5 c5Var) {
        if (r4Var == null) {
            return;
        }
        try {
            j5 j5VarR = k5.r();
            j5VarR.f(c5Var);
            j5VarR.d();
            k5.s((k5) j5VarR.f33564b, r4Var);
            this.zzc.zza((k5) j5VarR.a());
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    private final void zzm(u4 u4Var, c5 c5Var) {
        if (u4Var == null) {
            return;
        }
        try {
            j5 j5VarR = k5.r();
            j5VarR.f(c5Var);
            j5VarR.d();
            k5.t((k5) j5VarR.f33564b, u4Var);
            this.zzc.zza((k5) j5VarR.a());
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zza(r4 r4Var) {
        try {
            zzl(r4Var, this.zzb);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzb(r4 r4Var, int i5) {
        try {
            b5 b5Var = (b5) this.zzb.l();
            b5Var.d();
            c5.D((c5) b5Var.f33564b, i5);
            this.zzb = (c5) b5Var.a();
            zza(r4Var);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzc(r4 r4Var, int i5, long j11) {
        try {
            b5 b5Var = (b5) this.zzb.l();
            b5Var.d();
            c5.D((c5) b5Var.f33564b, i5);
            c5 c5Var = (c5) b5Var.a();
            this.zzb = c5Var;
            if (j11 != 0) {
                b5 b5Var2 = (b5) c5Var.l();
                b5Var2.d();
                c5.F((c5) b5Var2.f33564b, j11);
                c5Var = (c5) b5Var2.a();
            }
            zzl(r4Var, c5Var);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzd(r4 r4Var, long j11, boolean z11) {
        c5 c5Var;
        try {
            q4 q4Var = (q4) r4Var.l();
            g5 g5Var = (g5) r4Var.v().l();
            g5Var.d();
            i5.r((i5) g5Var.f33564b, z11);
            q4Var.d();
            r4.q((r4) q4Var.f33564b, (i5) g5Var.a());
            r4 r4Var2 = (r4) q4Var.a();
            if (j11 == 0) {
                c5Var = this.zzb;
            } else {
                b5 b5Var = (b5) this.zzb.l();
                b5Var.d();
                c5.F((c5) b5Var.f33564b, j11);
                c5Var = (c5) b5Var.a();
            }
            zzl(r4Var2, c5Var);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zze(r4 r4Var, int i5, long j11, boolean z11) {
        c5 c5Var;
        try {
            b5 b5Var = (b5) this.zzb.l();
            b5Var.d();
            c5.D((c5) b5Var.f33564b, i5);
            this.zzb = (c5) b5Var.a();
            q4 q4Var = (q4) r4Var.l();
            g5 g5Var = (g5) r4Var.v().l();
            g5Var.d();
            i5.r((i5) g5Var.f33564b, z11);
            q4Var.d();
            r4.q((r4) q4Var.f33564b, (i5) g5Var.a());
            r4 r4Var2 = (r4) q4Var.a();
            if (j11 == 0) {
                c5Var = this.zzb;
            } else {
                b5 b5Var2 = (b5) this.zzb.l();
                b5Var2.d();
                c5.F((c5) b5Var2.f33564b, j11);
                c5Var = (c5) b5Var2.a();
            }
            zzl(r4Var2, c5Var);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzf(u4 u4Var) {
        try {
            zzm(u4Var, this.zzb);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzg(u4 u4Var, int i5) {
        try {
            b5 b5Var = (b5) this.zzb.l();
            b5Var.d();
            c5.D((c5) b5Var.f33564b, i5);
            this.zzb = (c5) b5Var.a();
            zzf(u4Var);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzh(u4 u4Var, long j11, boolean z11) {
        c5 c5Var;
        try {
            s4 s4Var = (s4) u4Var.l();
            g5 g5Var = (g5) u4Var.s().l();
            g5Var.d();
            i5.r((i5) g5Var.f33564b, z11);
            s4Var.d();
            u4.v((u4) s4Var.f33564b, (i5) g5Var.a());
            u4 u4Var2 = (u4) s4Var.a();
            if (j11 == 0) {
                c5Var = this.zzb;
            } else {
                b5 b5Var = (b5) this.zzb.l();
                b5Var.d();
                c5.F((c5) b5Var.f33564b, j11);
                c5Var = (c5) b5Var.a();
            }
            zzm(u4Var2, c5Var);
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzi(y4 y4Var) {
        try {
            j5 j5VarR = k5.r();
            j5VarR.f(this.zzb);
            j5VarR.d();
            k5.u((k5) j5VarR.f33564b, y4Var);
            this.zzc.zza((k5) j5VarR.a());
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzj(n5 n5Var) {
        try {
            zzdn zzdnVar = this.zzc;
            j5 j5VarR = k5.r();
            j5VarR.f(this.zzb);
            j5VarR.d();
            k5.w((k5) j5VarR.f33564b, n5Var);
            zzdnVar.zza((k5) j5VarR.a());
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }

    @Override // com.android.billingclient.api.zzcz
    public final void zzk(o5 o5Var) {
        if (o5Var == null) {
            return;
        }
        try {
            j5 j5VarR = k5.r();
            j5VarR.f(this.zzb);
            j5VarR.d();
            k5.q((k5) j5VarR.f33564b, o5Var);
            this.zzc.zza((k5) j5VarR.a());
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to log.", th2);
        }
    }
}
