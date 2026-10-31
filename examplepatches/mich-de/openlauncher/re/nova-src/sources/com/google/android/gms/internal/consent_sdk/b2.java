package com.google.android.gms.internal.consent_sdk;

import android.os.Build;

/* loaded from: classes3.dex */
public final class b2 extends x5 {
    private static final b2 zzb;
    private int zzd;
    private int zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int zzh;

    static {
        b2 b2Var = new b2();
        zzb = b2Var;
        x5.l(b2.class, b2Var);
    }

    public static a2 m() {
        return (a2) zzb.g();
    }

    public static /* synthetic */ void n(b2 b2Var, int i5) {
        b2Var.zzd |= 8;
        b2Var.zzh = i5;
    }

    public static /* synthetic */ void o(b2 b2Var) {
        String str = Build.MODEL;
        str.getClass();
        b2Var.zzd |= 4;
        b2Var.zzg = str;
    }

    public static /* synthetic */ void p(b2 b2Var) {
        String str = Build.VERSION.RELEASE;
        str.getClass();
        b2Var.zzd |= 2;
        b2Var.zzf = str;
    }

    public static /* synthetic */ void q(b2 b2Var) {
        b2Var.zze = 1;
        b2Var.zzd = 1 | b2Var.zzd;
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဌ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004င\u0003", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh"});
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
