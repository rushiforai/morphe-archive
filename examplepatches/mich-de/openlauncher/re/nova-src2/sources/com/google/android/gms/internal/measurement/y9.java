package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class y9 extends o1 {
    private static final y9 zze;
    private static volatile o2 zzf;
    private y1 zzb = r2.f33023e;

    static {
        y9 y9Var = new y9();
        zze = y9Var;
        o1.p(y9.class, y9Var);
    }

    public static v9 y() {
        return (v9) zze.k();
    }

    public static y9 z() {
        return zze;
    }

    public final void A(ArrayList arrayList) {
        y1 y1Var = this.zzb;
        if (!((o0) y1Var).f32868a) {
            this.zzb = b.c9.i(y1Var);
        }
        n0.d(arrayList, this.zzb);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zze, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzb", x9.class});
        }
        if (i11 == 3) {
            return new y9();
        }
        if (i11 == 4) {
            return new v9(zze);
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
        synchronized (y9.class) {
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
