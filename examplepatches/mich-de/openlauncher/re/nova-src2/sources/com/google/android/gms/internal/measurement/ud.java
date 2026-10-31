package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class ud extends o1 {
    private static final ud zze;
    private static volatile o2 zzf;
    private y1 zzb = r2.f33023e;

    static {
        ud udVar = new ud();
        zze = udVar;
        o1.p(ud.class, udVar);
    }

    public static ud y(byte[] bArr, e1 e1Var) {
        return (ud) o1.e(zze, bArr, e1Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zze, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001a", new Object[]{"zzb"});
        }
        if (i11 == 3) {
            return new ud();
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
        synchronized (ud.class) {
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
}
