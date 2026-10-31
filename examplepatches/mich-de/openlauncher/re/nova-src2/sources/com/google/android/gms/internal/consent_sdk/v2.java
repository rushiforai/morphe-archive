package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class v2 extends x5 {
    private static final v2 zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private long zzg;
    private int zzh;

    static {
        v2 v2Var = new v2();
        zzb = v2Var;
        x5.l(v2.class, v2Var);
    }

    public static u2 m() {
        return (u2) zzb.g();
    }

    public static /* synthetic */ void n(v2 v2Var, h2 h2Var) {
        v2Var.zzf = h2Var;
        v2Var.zze = 38;
    }

    public static /* synthetic */ void o(v2 v2Var, long j11) {
        v2Var.zzd |= 1;
        v2Var.zzg = j11;
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0019\u0001\u0001\b&\u0019\u0000\u0000\u0000\b<\u0000\tဂ\u0000\u000b<\u0000\f<\u0000\r<\u0000\u000f<\u0000\u0011<\u0000\u0012<\u0000\u0013<\u0000\u0014<\u0000\u0015<\u0000\u0016<\u0000\u0019<\u0000\u001a<\u0000\u001b<\u0000\u001dင\u0001\u001e<\u0000\u001f<\u0000 <\u0000!<\u0000\"<\u0000#<\u0000$<\u0000%<\u0000&<\u0000", new Object[]{"zzf", "zze", "zzd", x3.class, "zzg", j4.class, b3.class, h1.class, m3.class, n1.class, t2.class, k1.class, t1.class, e3.class, g3.class, x4.class, e4.class, e5.class, "zzh", d5.class, l4.class, w1.class, t4.class, s4.class, o1.class, g5.class, y4.class, h2.class});
        }
        if (i11 == 3) {
            return new v2();
        }
        if (i11 == 4) {
            return new u2(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
