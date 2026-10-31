package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class qc extends o1 {
    private static final qc zzf;
    private static volatile o2 zzg;
    private int zzb;
    private boolean zze;

    static {
        qc qcVar = new qc();
        zzf = qcVar;
        o1.p(qc.class, qcVar);
    }

    public static qc y() {
        return zzf;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzf, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဇ\u0000", new Object[]{"zzb", "zze"});
        }
        if (i11 == 3) {
            return new qc();
        }
        if (i11 == 4) {
            return new w8(zzf);
        }
        if (i11 == 5) {
            return zzf;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzg;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (qc.class) {
            try {
                m1Var = zzg;
                if (m1Var == null) {
                    m1Var = new m1(zzf);
                    zzg = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final boolean x() {
        return this.zze;
    }
}
