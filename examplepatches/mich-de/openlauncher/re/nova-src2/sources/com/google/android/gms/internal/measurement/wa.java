package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class wa extends o1 {
    private static final wa zzg;
    private static volatile o2 zzh;
    private int zzb;
    private y1 zze = r2.f33023e;
    private ua zzf;

    static {
        wa waVar = new wa();
        zzg = waVar;
        o1.p(wa.class, waVar);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002ဉ\u0000", new Object[]{"zzb", "zze", xa.class, "zzf"});
        }
        if (i11 == 3) {
            return new wa();
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
        synchronized (wa.class) {
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

    public final List x() {
        return this.zze;
    }

    public final ua y() {
        ua uaVar = this.zzf;
        return uaVar == null ? ua.z() : uaVar;
    }
}
