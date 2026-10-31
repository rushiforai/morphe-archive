package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class t1 extends x2 {
    private static final t1 zzb;
    private int zzd = 0;
    private Object zze;

    static {
        t1 t1Var = new t1();
        zzb = t1Var;
        x2.f(t1.class, t1Var);
    }

    public static t1 q(byte[] bArr) {
        return (t1) x2.n(zzb, bArr);
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001;\u0000\u0002<\u0000", new Object[]{"zze", "zzd", u1.class});
        }
        if (i11 == 3) {
            return new t1();
        }
        if (i11 == 4) {
            return new s1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }

    public final u1 r() {
        return this.zzd == 2 ? (u1) this.zze : u1.q();
    }
}
