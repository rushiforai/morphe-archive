package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class wc extends o1 {
    private static final wc zzg;
    private static volatile o2 zzh;
    private int zzb;
    private sc zze;
    private tc zzf;

    static {
        wc wcVar = new wc();
        zzg = wcVar;
        o1.p(wc.class, wcVar);
    }

    public static vc A() {
        return (vc) zzg.k();
    }

    public static wc z(byte[] bArr, e1 e1Var) {
        return (wc) o1.e(zzg, bArr, e1Var);
    }

    public final /* synthetic */ void B(sc scVar) {
        this.zze = scVar;
        this.zzb |= 1;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zzb", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new wc();
        }
        if (i11 == 4) {
            return new vc(zzg);
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
        synchronized (wc.class) {
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

    public final sc x() {
        sc scVar = this.zze;
        return scVar == null ? sc.L() : scVar;
    }

    public final tc y() {
        tc tcVar = this.zzf;
        return tcVar == null ? tc.x() : tcVar;
    }
}
