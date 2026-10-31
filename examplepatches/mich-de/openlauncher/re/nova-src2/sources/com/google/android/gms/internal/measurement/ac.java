package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ac extends o1 {
    private static final ac zzg;
    private static volatile o2 zzh;
    private int zzb;
    private int zze;
    private int zzf;

    static {
        ac acVar = new ac();
        zzg = acVar;
        o1.p(ac.class, acVar);
    }

    public static zb x() {
        return (zb) zzg.k();
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဌ\u0000\u0002ဌ\u0001", new Object[]{"zzb", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new ac();
        }
        if (i11 == 4) {
            return new zb(zzg);
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
        synchronized (ac.class) {
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

    public final /* synthetic */ void y(int i5) {
        this.zze = i5 - 2;
        this.zzb |= 1;
    }

    public final /* synthetic */ void z(int i5) {
        if (i5 == 1) {
            throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
        }
        this.zzf = i5 - 2;
        this.zzb |= 2;
    }
}
