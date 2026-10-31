package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class la extends o1 {
    private static final la zzg;
    private static volatile o2 zzh;
    private int zzb;
    private int zze = 1;
    private y1 zzf = r2.f33023e;

    static {
        la laVar = new la();
        zzg = laVar;
        o1.p(la.class, laVar);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001᠌\u0000\u0002\u001b", new Object[]{"zzb", "zze", k0.f32717l, "zzf", da.class});
        }
        if (i11 == 3) {
            return new la();
        }
        if (i11 == 4) {
            return new w8(zzg);
        }
        if (i11 == 5) {
            return zzg;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzh;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (la.class) {
            try {
                m1Var = zzh;
                if (m1Var == null) {
                    m1Var = new m1(zzg);
                    zzh = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }
}
