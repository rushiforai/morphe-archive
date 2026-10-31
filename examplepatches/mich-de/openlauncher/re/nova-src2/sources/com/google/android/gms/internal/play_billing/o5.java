package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class o5 extends x2 {
    private static final o5 zzb;
    private int zzd;
    private int zze;

    static {
        o5 o5Var = new o5();
        zzb = o5Var;
        x2.f(o5.class, o5Var);
    }

    public static o5 q() {
        return zzb;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", f2.f33400i});
        }
        if (i11 == 3) {
            return new o5();
        }
        if (i11 == 4) {
            return new s1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
