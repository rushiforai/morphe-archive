package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class h2 extends x5 {
    private static final h2 zzb;
    private int zzd;
    private d2 zze;
    private g2 zzg;
    private b2 zzh;
    private y1 zzi;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private a6 zzj = r6.f32225e;

    static {
        h2 h2Var = new h2();
        zzb = h2Var;
        x5.l(h2.class, h2Var);
    }

    public static z1 m() {
        return (z1) zzb.g();
    }

    public static void n(h2 h2Var, String str) {
        str.getClass();
        a6 a6Var = h2Var.zzj;
        if (!((j5) a6Var).f32113a) {
            int size = a6Var.size();
            h2Var.zzj = a6Var.zzd(size + size);
        }
        h2Var.zzj.add(str);
    }

    public static /* synthetic */ void o(h2 h2Var, String str) {
        h2Var.zzd |= 2;
        h2Var.zzf = str;
    }

    public static /* synthetic */ void p(h2 h2Var, y1 y1Var) {
        h2Var.zzi = y1Var;
        h2Var.zzd |= 16;
    }

    public static /* synthetic */ void q(h2 h2Var, b2 b2Var) {
        h2Var.zzh = b2Var;
        h2Var.zzd |= 8;
    }

    public static /* synthetic */ void r(h2 h2Var, d2 d2Var) {
        h2Var.zze = d2Var;
        h2Var.zzd |= 1;
    }

    public static /* synthetic */ void s(h2 h2Var, g2 g2Var) {
        h2Var.zzg = g2Var;
        h2Var.zzd |= 4;
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0001\u0000\u0001ဉ\u0000\u0002ለ\u0001\u0003ဉ\u0002\u0004ဉ\u0003\u0005ဉ\u0004\u0006Ț", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new h2();
        }
        if (i11 == 4) {
            return new z1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
