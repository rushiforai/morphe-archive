package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class e2 extends x2 {
    private static final e2 zzb;
    private int zzd;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        e2 e2Var = new e2();
        zzb = e2Var;
        x2.f(e2.class, e2Var);
    }

    public static d2 q() {
        return (d2) zzb.k();
    }

    public static /* synthetic */ void r(e2 e2Var, String str) {
        e2Var.zzd |= 1;
        e2Var.zze = str;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဈ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new e2();
        }
        if (i11 == 4) {
            return new d2(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
