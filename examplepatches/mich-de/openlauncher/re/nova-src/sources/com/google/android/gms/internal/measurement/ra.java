package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ra extends o1 {
    private static final ra zzh;
    private static volatile o2 zzi;
    private int zzb;
    private int zze;
    private int zzf;
    private int zzg;

    static {
        ra raVar = new ra();
        zzh = raVar;
        o1.p(ra.class, raVar);
    }

    public static qa y() {
        return (qa) zzh.k();
    }

    public static ra z() {
        return zzh;
    }

    public final void A(int i5) {
        this.zzf = k2.d(i5);
        this.zzb |= 2;
    }

    public final int B() {
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

    /* JADX WARN: Removed duplicated region for block: B:15:0x0017 A[PHI: r3
      0x0017: PHI (r3v1 int) = (r3v0 int), (r3v2 int) binds: [B:7:0x0009, B:11:0x000f] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int C() {
        int i5;
        int i11 = this.zzg;
        if (i11 != 0) {
            i5 = 2;
            if (i11 != 1) {
                int i12 = 3;
                if (i11 != 2) {
                    i5 = 4;
                    if (i11 != 3) {
                        i12 = 5;
                        i5 = i11 != 4 ? i11 != 5 ? 0 : 6 : i12;
                    }
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

    public final /* synthetic */ void D(int i5) {
        this.zze = i5 - 1;
        this.zzb |= 1;
    }

    public final /* synthetic */ void E(int i5) {
        this.zzg = i5 - 1;
        this.zzb |= 4;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003᠌\u0002", new Object[]{"zzb", "zze", k0.o, "zzf", k0.f32718m, "zzg", k0.n});
        }
        if (i11 == 3) {
            return new ra();
        }
        if (i11 == 4) {
            return new qa(zzh);
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
        synchronized (ra.class) {
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
        int iC = k2.c(this.zzf);
        if (iC == 0) {
            return 1;
        }
        return iC;
    }
}
