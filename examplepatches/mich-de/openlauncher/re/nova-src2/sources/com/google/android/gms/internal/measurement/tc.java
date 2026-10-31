package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class tc extends o1 {
    private static final tc zzo;
    private static volatile o2 zzp;
    private int zzb;
    private boolean zzf;
    private y1 zzh;
    private y1 zzi;
    private t1 zzj;
    private uc zzk;
    private boolean zzl;
    private boolean zzm;
    private qc zzn;
    private v0 zze = v0.f33120b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        tc tcVar = new tc();
        zzo = tcVar;
        o1.p(tc.class, tcVar);
    }

    public tc() {
        r2 r2Var = r2.f33023e;
        this.zzh = r2Var;
        this.zzi = r2Var;
        this.zzj = p1.f32946e;
    }

    public static tc x() {
        return zzo;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzo, "\u0004\n\u0000\u0001\u0001\f\n\u0000\u0003\u0000\u0001ည\u0000\u0002ဇ\u0001\u0003ဈ\u0002\u0004\u001a\u0005\u001a\u0007ࠬ\bဉ\u0003\nဇ\u0004\u000bဇ\u0005\fဉ\u0006", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", k0.f32707b, "zzk", "zzl", "zzm", "zzn"});
        }
        if (i11 == 3) {
            return new tc();
        }
        if (i11 == 4) {
            return new w8(zzo);
        }
        if (i11 == 5) {
            return zzo;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzp;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (tc.class) {
            try {
                m1Var = zzp;
                if (m1Var == null) {
                    m1Var = new m1(zzo);
                    zzp = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }
}
