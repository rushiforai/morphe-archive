package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class x9 extends o1 {
    private static final x9 zzg;
    private static volatile o2 zzh;
    private int zzb;
    private int zze;
    private int zzf;

    static {
        x9 x9Var = new x9();
        zzg = x9Var;
        o1.p(x9.class, x9Var);
    }

    public static w9 x() {
        return (w9) zzg.k();
    }

    public final /* synthetic */ void A(int i5) {
        this.zze = i5 - 1;
        this.zzb |= 1;
    }

    public final /* synthetic */ void B(int i5) {
        this.zzf = i5 - 1;
        this.zzb |= 2;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"zzb", "zze", k0.f32714i, "zzf", k0.f32715j});
        }
        if (i11 == 3) {
            return new x9();
        }
        if (i11 == 4) {
            return new w9(zzg);
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
        synchronized (x9.class) {
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

    public final int y() {
        int i5;
        int i11 = this.zze;
        if (i11 != 0) {
            i5 = 2;
            if (i11 != 1) {
                if (i11 != 2) {
                    i5 = 4;
                    if (i11 != 3) {
                        i5 = i11 != 4 ? 0 : 5;
                    }
                } else {
                    i5 = 3;
                }
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
}
