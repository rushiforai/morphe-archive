package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class n8 extends o1 {
    private static final n8 zzj;
    private static volatile o2 zzk;
    private int zzb;
    private int zze;
    private y1 zzf;
    private y1 zzg;
    private boolean zzh;
    private boolean zzi;

    static {
        n8 n8Var = new n8();
        zzj = n8Var;
        o1.p(n8.class, n8Var);
    }

    public n8() {
        r2 r2Var = r2.f33023e;
        this.zzf = r2Var;
        this.zzg = r2Var;
    }

    public final int A() {
        return this.zzf.size();
    }

    public final v8 B(int i5) {
        return (v8) this.zzf.get(i5);
    }

    public final y1 C() {
        return this.zzg;
    }

    public final int D() {
        return this.zzg.size();
    }

    public final p8 E(int i5) {
        return (p8) this.zzg.get(i5);
    }

    public final void F(int i5, v8 v8Var) {
        y1 y1Var = this.zzf;
        if (!((o0) y1Var).f32868a) {
            this.zzf = b.c9.i(y1Var);
        }
        this.zzf.set(i5, v8Var);
    }

    public final void G(int i5, p8 p8Var) {
        y1 y1Var = this.zzg;
        if (!((o0) y1Var).f32868a) {
            this.zzg = b.c9.i(y1Var);
        }
        this.zzg.set(i5, p8Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzj, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0002\u0000\u0001င\u0000\u0002\u001b\u0003\u001b\u0004ဇ\u0001\u0005ဇ\u0002", new Object[]{"zzb", "zze", "zzf", v8.class, "zzg", p8.class, "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new n8();
        }
        if (i11 == 4) {
            return new m8(zzj);
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
        synchronized (n8.class) {
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

    public final boolean x() {
        return (this.zzb & 1) != 0;
    }

    public final int y() {
        return this.zze;
    }

    public final List z() {
        return this.zzf;
    }
}
