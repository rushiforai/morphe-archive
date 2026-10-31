package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class b9 extends o1 {
    private static final b9 zzj;
    private static volatile o2 zzk;
    private int zzb;
    private y1 zze;
    private y1 zzf;
    private y1 zzg;
    private boolean zzh;
    private y1 zzi;

    static {
        b9 b9Var = new b9();
        zzj = b9Var;
        o1.p(b9.class, b9Var);
    }

    public b9() {
        r2 r2Var = r2.f33023e;
        this.zze = r2Var;
        this.zzf = r2Var;
        this.zzg = r2Var;
        this.zzi = r2Var;
    }

    public static b9 D() {
        return zzj;
    }

    public final boolean A() {
        return (this.zzb & 1) != 0;
    }

    public final boolean B() {
        return this.zzh;
    }

    public final y1 C() {
        return this.zzi;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzj, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0004\u0000\u0001\u001b\u0002\u001b\u0003\u001b\u0004ဇ\u0000\u0005\u001b", new Object[]{"zzb", "zze", y8.class, "zzf", z8.class, "zzg", a9.class, "zzh", "zzi", y8.class});
        }
        if (i11 == 3) {
            return new b9();
        }
        if (i11 == 4) {
            return new w8(zzj);
        }
        if (i11 == 5) {
            return zzj;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzk;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (b9.class) {
            try {
                m1Var = zzk;
                if (m1Var == null) {
                    m1Var = new m1(zzj);
                    zzk = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final List x() {
        return this.zze;
    }

    public final List y() {
        return this.zzf;
    }

    public final List z() {
        return this.zzg;
    }
}
