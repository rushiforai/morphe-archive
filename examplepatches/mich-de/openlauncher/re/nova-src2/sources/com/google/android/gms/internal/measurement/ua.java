package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class ua extends o1 {
    private static final ua zze;
    private static volatile o2 zzf;
    private y1 zzb = r2.f33023e;

    static {
        ua uaVar = new ua();
        zze = uaVar;
        o1.p(ua.class, uaVar);
    }

    public static ua z() {
        return zze;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zze, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzb", va.class});
        }
        if (i11 == 3) {
            return new ua();
        }
        if (i11 == 4) {
            return new w8(zze);
        }
        if (i11 == 5) {
            return zze;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzf;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (ua.class) {
            try {
                m1Var = zzf;
                if (m1Var == null) {
                    m1Var = new m1(zze);
                    zzf = m1Var;
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
}
