package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class b5 extends x5 {
    private static final b5 zzb;
    private int zzd;
    private a6 zze = r6.f32225e;
    private x6 zzf;

    static {
        b5 b5Var = new b5();
        zzb = b5Var;
        x5.l(b5.class, b5Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002ဉ\u0000", new Object[]{"zzd", "zze", a5.class, "zzf"});
        }
        if (i11 == 3) {
            return new b5();
        }
        if (i11 == 4) {
            return new y3(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
