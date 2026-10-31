package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class n4 extends x2 {
    private static final n4 zzb;
    private int zzd = 0;
    private Object zze;

    static {
        n4 n4Var = new n4();
        zzb = n4Var;
        x2.f(n4.class, n4Var);
    }

    public static m4 q() {
        return (m4) zzb.k();
    }

    public static n4 r() {
        return zzb;
    }

    public static /* synthetic */ void s(n4 n4Var, String str) {
        str.getClass();
        n4Var.zzd = 3;
        n4Var.zze = str;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0000\u0006\u0001\u0000\u0001\u0006\u0006\u0000\u0000\u0000\u0001?\u0000\u00023\u0000\u0003Ȼ\u0000\u0004:\u0000\u0005<\u0000\u0006<\u0000", new Object[]{"zze", "zzd", d4.class, i3.class});
        }
        if (i11 == 3) {
            return new n4();
        }
        if (i11 == 4) {
            return new m4(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
