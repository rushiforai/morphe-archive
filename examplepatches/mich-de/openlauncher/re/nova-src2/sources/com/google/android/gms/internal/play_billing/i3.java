package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class i3 extends x2 {
    private static final i3 zzb;
    private c3 zzd = v3.f33566e;

    static {
        i3 i3Var = new i3();
        zzb = i3Var;
        x2.f(i3.class, i3Var);
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzd", n4.class});
        }
        if (i11 == 3) {
            return new i3();
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
