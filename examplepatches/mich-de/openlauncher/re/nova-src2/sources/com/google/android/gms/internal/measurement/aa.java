package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class aa extends o1 {
    private static final aa zzg;
    private static volatile o2 zzh;
    private int zzb;
    private int zze;
    private long zzf;

    static {
        aa aaVar = new aa();
        zzg = aaVar;
        o1.p(aa.class, aaVar);
    }

    public static z9 B() {
        return (z9) zzg.k();
    }

    public final long A() {
        return this.zzf;
    }

    public final /* synthetic */ void C(int i5) {
        this.zzb |= 1;
        this.zze = i5;
    }

    public final /* synthetic */ void D(long j11) {
        this.zzb |= 2;
        this.zzf = j11;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002ဂ\u0001", new Object[]{"zzb", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new aa();
        }
        if (i11 == 4) {
            return new z9(zzg);
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
        synchronized (aa.class) {
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

    public final boolean z() {
        return (this.zzb & 2) != 0;
    }
}
