package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class y4 extends x2 {
    private static final y4 zzb;

    static {
        y4 y4Var = new y4();
        zzb = y4Var;
        x2.f(y4.class, y4Var);
    }

    public static y4 q() {
        return zzb;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0000", null);
        }
        if (i11 == 3) {
            return new y4();
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
