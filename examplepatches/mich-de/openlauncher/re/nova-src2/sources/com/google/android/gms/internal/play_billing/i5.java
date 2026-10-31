package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class i5 extends x2 {
    private static final i5 zzb;
    private int zzd;
    private c3 zze = v3.f33566e;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private boolean zzg;

    static {
        i5 i5Var = new i5();
        zzb = i5Var;
        x2.f(i5.class, i5Var);
    }

    public static i5 q() {
        return zzb;
    }

    public static /* synthetic */ void r(i5 i5Var, boolean z11) {
        i5Var.zzd |= 2;
        i5Var.zzg = z11;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001\u001b\u0002ဈ\u0000\u0003ဇ\u0001", new Object[]{"zzd", "zze", h5.class, "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new i5();
        }
        if (i11 == 4) {
            return new g5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
