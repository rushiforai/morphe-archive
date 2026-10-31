package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class b2 extends x2 {
    private static final b2 zzb;
    private int zzd;
    private int zze;
    private int zzf;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzi = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        b2 b2Var = new b2();
        zzb = b2Var;
        x2.f(b2.class, b2Var);
    }

    public static a2 q() {
        return (a2) zzb.k();
    }

    public static /* synthetic */ void r(b2 b2Var, String str) {
        b2Var.zzd |= 4;
        b2Var.zzg = str;
    }

    public static /* synthetic */ void s(b2 b2Var, String str) {
        str.getClass();
        b2Var.zzd |= 16;
        b2Var.zzi = str;
    }

    public static /* synthetic */ void t(b2 b2Var, String str) {
        str.getClass();
        b2Var.zzd |= 32;
        b2Var.zzj = str;
    }

    public static /* synthetic */ void u(b2 b2Var, String str) {
        str.getClass();
        b2Var.zzd |= 8;
        b2Var.zzh = str;
    }

    public static /* synthetic */ void v(b2 b2Var) {
        b2Var.zzd |= 1;
        b2Var.zze = 24;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001င\u0000\u0002င\u0001\u0003ဈ\u0002\u0004ဈ\u0003\u0005ဈ\u0004\u0006ဈ\u0005", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new b2();
        }
        if (i11 == 4) {
            return new a2(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
