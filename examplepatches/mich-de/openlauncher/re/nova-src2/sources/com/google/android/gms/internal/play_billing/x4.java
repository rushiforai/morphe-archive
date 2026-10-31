package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class x4 extends x2 {
    private static final x4 zzb;
    private int zzd;
    private int zze;
    private int zzg;
    private int zzi;
    private int zzj;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        x4 x4Var = new x4();
        zzb = x4Var;
        x2.f(x4.class, x4Var);
    }

    public static /* synthetic */ void q(x4 x4Var, int i5) {
        x4Var.zzd |= 1;
        x4Var.zze = i5;
    }

    public static v4 r() {
        return (v4) zzb.k();
    }

    public static /* synthetic */ void s(x4 x4Var, String str) {
        x4Var.zzd |= 8;
        x4Var.zzh = str;
    }

    public static /* synthetic */ void t(x4 x4Var, String str) {
        str.getClass();
        x4Var.zzd |= 2;
        x4Var.zzf = str;
    }

    public static /* synthetic */ void u(x4 x4Var) {
        x4Var.zzd |= 32;
        x4Var.zzj = 0;
    }

    public static /* synthetic */ void v(x4 x4Var, int i5) {
        x4Var.zzd |= 16;
        x4Var.zzi = i5;
    }

    public static void w(x4 x4Var, w4 w4Var) {
        x4Var.zzg = w4Var.f33645a;
        x4Var.zzd |= 4;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0006\u0000\u0001\u0001\b\u0006\u0000\u0000\u0000\u0001င\u0000\u0002ဈ\u0001\u0004᠌\u0002\u0005ဈ\u0003\u0007င\u0004\bင\u0005", new Object[]{"zzd", "zze", "zzf", "zzg", f2.f33395d, "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new x4();
        }
        if (i11 == 4) {
            return new v4(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
