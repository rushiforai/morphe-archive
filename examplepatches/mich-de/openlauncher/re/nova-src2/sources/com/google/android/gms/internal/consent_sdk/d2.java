package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class d2 extends x5 {
    private static final d2 zzb;
    private int zzd;
    private int zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long zzg;

    static {
        d2 d2Var = new d2();
        zzb = d2Var;
        x5.l(d2.class, d2Var);
    }

    public static c2 m() {
        return (c2) zzb.g();
    }

    public static /* synthetic */ void n(d2 d2Var, String str) {
        d2Var.zzd |= 2;
        d2Var.zzf = str;
    }

    public static /* synthetic */ void o(d2 d2Var, long j11) {
        d2Var.zzd |= 4;
        d2Var.zzg = j11;
    }

    public static /* synthetic */ void p(d2 d2Var, int i5) {
        d2Var.zze = i5 - 2;
        d2Var.zzd |= 1;
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဌ\u0000\u0002ለ\u0001\u0003ဂ\u0002", new Object[]{"zzd", "zze", "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new d2();
        }
        if (i11 == 4) {
            return new c2(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
