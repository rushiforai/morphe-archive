package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class z8 extends o1 {
    private static final z8 zzg;
    private static volatile o2 zzh;
    private int zzb;
    private int zze;
    private int zzf;

    static {
        z8 z8Var = new z8();
        zzg = z8Var;
        o1.p(z8.class, z8Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            k0 k0Var = k0.f32711f;
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"zzb", "zze", k0Var, "zzf", k0Var});
        }
        if (i11 == 3) {
            return new z8();
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
        synchronized (z8.class) {
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

    public final int x() {
        int iA = lb.a(this.zze);
        if (iA == 0) {
            return 1;
        }
        return iA;
    }

    public final int y() {
        int iA = lb.a(this.zzf);
        if (iA == 0) {
            return 1;
        }
        return iA;
    }
}
