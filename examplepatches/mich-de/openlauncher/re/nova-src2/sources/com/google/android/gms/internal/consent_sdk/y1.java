package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class y1 extends x5 {
    private static final y1 zzb;
    private int zzd;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        y1 y1Var = new y1();
        zzb = y1Var;
        x5.l(y1.class, y1Var);
    }

    public static x1 m() {
        return (x1) zzb.g();
    }

    public static /* synthetic */ void n(y1 y1Var, String str) {
        str.getClass();
        y1Var.zzd |= 1;
        y1Var.zze = str;
    }

    public static /* synthetic */ void o(y1 y1Var, String str) {
        str.getClass();
        y1Var.zzd |= 2;
        y1Var.zzf = str;
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new y1();
        }
        if (i11 == 4) {
            return new x1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
