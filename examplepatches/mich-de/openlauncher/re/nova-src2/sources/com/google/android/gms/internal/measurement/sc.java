package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class sc extends o1 {
    private static final u1 zzl = new k1(13);
    private static final sc zzq;
    private static volatile o2 zzr;
    private int zzb;
    private boolean zzf;
    private long zzh;
    private y1 zzi;
    private y1 zzj;
    private t1 zzk;
    private uc zzm;
    private boolean zzn;
    private boolean zzo;
    private qc zzp;
    private v0 zze = v0.f33120b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        sc scVar = new sc();
        zzq = scVar;
        o1.p(sc.class, scVar);
    }

    public sc() {
        r2 r2Var = r2.f33023e;
        this.zzi = r2Var;
        this.zzj = r2Var;
        this.zzk = p1.f32946e;
    }

    public static rc K() {
        return (rc) zzq.k();
    }

    public static sc L() {
        return zzq;
    }

    public final String A() {
        return this.zzg;
    }

    public final long B() {
        return this.zzh;
    }

    public final y1 C() {
        return this.zzi;
    }

    public final y1 D() {
        return this.zzj;
    }

    public final List E() {
        return new v1(0, this.zzk, zzl);
    }

    public final boolean F() {
        return (this.zzb & 16) != 0;
    }

    public final uc G() {
        uc ucVar = this.zzm;
        return ucVar == null ? uc.z() : ucVar;
    }

    public final boolean H() {
        return this.zzn;
    }

    public final boolean I() {
        return this.zzo;
    }

    public final qc J() {
        qc qcVar = this.zzp;
        return qcVar == null ? qc.y() : qcVar;
    }

    public final /* synthetic */ void M(long j11) {
        this.zzb |= 8;
        this.zzh = j11;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzq, "\u0004\u000b\u0000\u0001\u0001\f\u000b\u0000\u0003\u0000\u0001ည\u0000\u0002ဇ\u0001\u0003ဈ\u0002\u0004ဂ\u0003\u0005\u001a\u0006\u001a\u0007ࠬ\bဉ\u0004\nဇ\u0005\u000bဇ\u0006\fဉ\u0007", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", k0.f32707b, "zzm", "zzn", "zzo", "zzp"});
        }
        if (i11 == 3) {
            return new sc();
        }
        if (i11 == 4) {
            return new rc(zzq);
        }
        if (i11 == 5) {
            return zzq;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzr;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (sc.class) {
            try {
                m1Var = zzr;
                if (m1Var == null) {
                    m1Var = new m1(zzq);
                    zzr = m1Var;
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

    public final v0 y() {
        return this.zze;
    }

    public final boolean z() {
        return this.zzf;
    }
}
