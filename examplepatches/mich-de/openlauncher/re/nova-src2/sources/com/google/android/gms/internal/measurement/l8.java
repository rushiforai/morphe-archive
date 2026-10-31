package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class l8 extends o1 {
    private static final l8 zzi;
    private static volatile o2 zzj;
    private int zzb;
    private boolean zzf;
    private long zzh;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        l8 l8Var = new l8();
        zzi = l8Var;
        o1.p(l8.class, l8Var);
    }

    public static k8 x() {
        return (k8) zzi.k();
    }

    public final /* synthetic */ void A(String str) {
        this.zzb |= 4;
        this.zzg = str;
    }

    public final /* synthetic */ void B(long j11) {
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
            return new s2(zzi, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဇ\u0001\u0003ဈ\u0002\u0004ဂ\u0003", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new l8();
        }
        if (i11 == 4) {
            return new k8(zzi);
        }
        if (i11 == 5) {
            return zzi;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzj;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (l8.class) {
            try {
                m1Var = zzj;
                if (m1Var == null) {
                    m1Var = new m1(zzi);
                    zzj = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final /* synthetic */ void y(String str) {
        this.zzb |= 1;
        this.zze = str;
    }

    public final /* synthetic */ void z() {
        this.zzb |= 2;
        this.zzf = true;
    }
}
