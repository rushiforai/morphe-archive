package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class h5 extends x2 {
    private static final h5 zzb;
    private int zzd;
    private int zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        h5 h5Var = new h5();
        zzb = h5Var;
        x2.f(h5.class, h5Var);
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဈ\u0001", new Object[]{"zzd", "zze", f2.f33399h, "zzf"});
        }
        if (i11 == 3) {
            return new h5();
        }
        if (i11 == 4) {
            return new s1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
