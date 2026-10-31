package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class d4 extends x2 {
    private static final d4 zzb;
    private m3 zzd = m3.f33455b;

    static {
        d4 d4Var = new d4();
        zzb = d4Var;
        x2.f(d4.class, d4Var);
    }

    public static b4 q() {
        return (b4) zzb.k();
    }

    public static m3 r(d4 d4Var) {
        m3 m3Var = d4Var.zzd;
        if (!m3Var.f33456a) {
            d4Var.zzd = m3Var.a();
        }
        return d4Var.zzd;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"zzd", c4.f33368a});
        }
        if (i11 == 3) {
            return new d4();
        }
        if (i11 == 4) {
            return new b4(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
