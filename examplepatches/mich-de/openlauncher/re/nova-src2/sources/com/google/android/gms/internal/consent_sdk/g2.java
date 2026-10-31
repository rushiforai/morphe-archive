package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class g2 extends x5 {
    private static final g2 zzb;
    private int zzd;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        g2 g2Var = new g2();
        zzb = g2Var;
        x5.l(g2.class, g2Var);
    }

    public static e2 m() {
        return (e2) zzb.g();
    }

    public static /* synthetic */ void n(g2 g2Var) {
        g2Var.zzd |= 1;
        g2Var.zze = "4.0.0";
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ለ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new g2();
        }
        if (i11 == 4) {
            return new e2(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
