package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class h9 extends o1 {
    private static final h9 zze;
    private static volatile o2 zzf;
    private y1 zzb = r2.f33023e;

    static {
        h9 h9Var = new h9();
        zze = h9Var;
        o1.p(h9.class, h9Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zze, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001a", new Object[]{"zzb"});
        }
        if (i11 == 3) {
            return new h9();
        }
        if (i11 == 4) {
            return new w8(zze);
        }
        if (i11 == 5) {
            return zze;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzf;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (h9.class) {
            try {
                m1Var = zzf;
                if (m1Var == null) {
                    m1Var = new m1(zze);
                    zzf = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }
}
