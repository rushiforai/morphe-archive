package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class i9 extends o1 {
    private static final i9 zzj;
    private static volatile o2 zzk;
    private int zzb;
    private int zze = 14;
    private int zzf = 11;
    private int zzg = 60;
    private int zzh = 13;
    private int zzi = 11;

    static {
        i9 i9Var = new i9();
        zzj = i9Var;
        o1.p(i9.class, i9Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzj, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001င\u0000\u0002င\u0001\u0003င\u0002\u0004င\u0003\u0005င\u0004", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new i9();
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
        synchronized (i9.class) {
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
}
