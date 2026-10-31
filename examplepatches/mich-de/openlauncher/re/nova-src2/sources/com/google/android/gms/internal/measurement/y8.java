package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class y8 extends o1 {
    private static final y8 zzh;
    private static volatile o2 zzi;
    private int zzb;
    private int zze;
    private int zzf;
    private int zzg;

    static {
        y8 y8Var = new y8();
        zzh = y8Var;
        o1.p(y8.class, y8Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003᠌\u0002", new Object[]{"zzb", "zze", k0.f32711f, "zzf", k0.f32710e, "zzg", k0.f32712g});
        }
        if (i11 == 3) {
            return new y8();
        }
        if (i11 == 4) {
            return new w8(zzh);
        }
        if (i11 == 5) {
            return zzh;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzi;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (y8.class) {
            try {
                m1Var = zzi;
                if (m1Var == null) {
                    m1Var = new m1(zzh);
                    zzi = m1Var;
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
        int i5;
        int i11 = this.zzf;
        if (i11 != 0) {
            i5 = 2;
            if (i11 != 1) {
                i5 = i11 != 2 ? 0 : 3;
            }
        } else {
            i5 = 1;
        }
        if (i5 == 0) {
            return 1;
        }
        return i5;
    }

    public final int z() {
        int i5;
        int i11 = this.zzg;
        if (i11 != 0) {
            i5 = 2;
            if (i11 != 1) {
                i5 = i11 != 2 ? 0 : 3;
            }
        } else {
            i5 = 1;
        }
        if (i5 == 0) {
            return 1;
        }
        return i5;
    }
}
