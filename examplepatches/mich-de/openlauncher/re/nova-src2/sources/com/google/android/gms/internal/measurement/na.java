package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class na extends o1 {
    private static final na zzh;
    private static volatile o2 zzi;
    private x1 zzb;
    private x1 zze;
    private y1 zzf;
    private y1 zzg;

    static {
        na naVar = new na();
        zzh = naVar;
        o1.p(na.class, naVar);
    }

    public na() {
        c2 c2Var = c2.f32420e;
        this.zzb = c2Var;
        this.zze = c2Var;
        r2 r2Var = r2.f33023e;
        this.zzf = r2Var;
        this.zzg = r2Var;
    }

    public static ma F() {
        return (ma) zzh.k();
    }

    public static na G() {
        return zzh;
    }

    public final int A() {
        return this.zze.size();
    }

    public final y1 B() {
        return this.zzf;
    }

    public final int C() {
        return this.zzf.size();
    }

    public final y1 D() {
        return this.zzg;
    }

    public final int E() {
        return this.zzg.size();
    }

    public final void H(Iterable iterable) {
        List list = this.zzb;
        if (!((o0) list).f32868a) {
            int size = list.size();
            this.zzb = ((c2) list).zzg(size + size);
        }
        n0.d(iterable, this.zzb);
    }

    public final void I() {
        this.zzb = c2.f32420e;
    }

    public final void J(List list) {
        List list2 = this.zze;
        if (!((o0) list2).f32868a) {
            int size = list2.size();
            this.zze = ((c2) list2).zzg(size + size);
        }
        n0.d(list, this.zze);
    }

    public final void K() {
        this.zze = c2.f32420e;
    }

    public final void L(ArrayList arrayList) {
        y1 y1Var = this.zzf;
        if (!((o0) y1Var).f32868a) {
            this.zzf = b.c9.i(y1Var);
        }
        n0.d(arrayList, this.zzf);
    }

    public final void M() {
        this.zzf = r2.f33023e;
    }

    public final void N(Iterable iterable) {
        y1 y1Var = this.zzg;
        if (!((o0) y1Var).f32868a) {
            this.zzg = b.c9.i(y1Var);
        }
        n0.d(iterable, this.zzg);
    }

    public final void O() {
        this.zzg = r2.f33023e;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0004\u0000\u0001\u0015\u0002\u0015\u0003\u001b\u0004\u001b", new Object[]{"zzb", "zze", "zzf", aa.class, "zzg", pa.class});
        }
        if (i11 == 3) {
            return new na();
        }
        if (i11 == 4) {
            return new ma(zzh);
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
        synchronized (na.class) {
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

    public final List x() {
        return this.zzb;
    }

    public final int y() {
        return this.zzb.size();
    }

    public final List z() {
        return this.zze;
    }
}
