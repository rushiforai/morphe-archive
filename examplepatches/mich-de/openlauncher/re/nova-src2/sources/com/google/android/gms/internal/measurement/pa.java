package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class pa extends o1 {
    private static final pa zzg;
    private static volatile o2 zzh;
    private int zzb;
    private int zze;
    private x1 zzf = c2.f32420e;

    static {
        pa paVar = new pa();
        zzg = paVar;
        o1.p(pa.class, paVar);
    }

    public static oa C() {
        return (oa) zzg.k();
    }

    public final int A() {
        return this.zzf.size();
    }

    public final long B(int i5) {
        return ((c2) this.zzf).e(i5);
    }

    public final /* synthetic */ void D(int i5) {
        this.zzb |= 1;
        this.zze = i5;
    }

    public final void E(List list) {
        List list2 = this.zzf;
        if (!((o0) list2).f32868a) {
            int size = list2.size();
            this.zzf = ((c2) list2).zzg(size + size);
        }
        n0.d(list, this.zzf);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001င\u0000\u0002\u0014", new Object[]{"zzb", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new pa();
        }
        if (i11 == 4) {
            return new oa(zzg);
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
        synchronized (pa.class) {
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
