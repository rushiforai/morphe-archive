package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class p9 extends o1 {
    private static final p9 zzp;
    private static volatile o2 zzq;
    private int zzb;
    private String zze;
    private String zzf;
    private String zzg;
    private long zzh;
    private String zzi;
    private String zzj;
    private String zzk;
    private long zzl;
    private f2 zzm;
    private f2 zzn;
    private String zzo;

    static {
        p9 p9Var = new p9();
        zzp = p9Var;
        o1.p(p9.class, p9Var);
    }

    public p9() {
        f2 f2Var = f2.f32523b;
        this.zzm = f2Var;
        this.zzn = f2Var;
        this.zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzi = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzk = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.zzo = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static m9 c0() {
        return (m9) zzp.k();
    }

    public static p9 d0() {
        return zzp;
    }

    public final /* synthetic */ void A() {
        this.zzb &= -17;
        this.zzi = zzp.zzi;
    }

    public final /* synthetic */ void B(String str) {
        this.zzb |= 32;
        this.zzj = str;
    }

    public final /* synthetic */ void C() {
        this.zzb &= -33;
        this.zzj = zzp.zzj;
    }

    public final /* synthetic */ void D(String str) {
        this.zzb |= 64;
        this.zzk = str;
    }

    public final /* synthetic */ void E() {
        this.zzb &= -65;
        this.zzk = zzp.zzk;
    }

    public final /* synthetic */ void F(long j11) {
        this.zzb |= 128;
        this.zzl = j11;
    }

    public final f2 G() {
        f2 f2Var = this.zzm;
        if (!f2Var.f32524a) {
            this.zzm = f2Var.a();
        }
        return this.zzm;
    }

    public final f2 H() {
        f2 f2Var = this.zzn;
        if (!f2Var.f32524a) {
            this.zzn = f2Var.a();
        }
        return this.zzn;
    }

    public final /* synthetic */ void I(String str) {
        this.zzb |= 256;
        this.zzo = str;
    }

    public final /* synthetic */ void J() {
        this.zzb &= -257;
        this.zzo = zzp.zzo;
    }

    public final boolean K() {
        return (this.zzb & 1) != 0;
    }

    public final String L() {
        return this.zze;
    }

    public final boolean M() {
        return (this.zzb & 2) != 0;
    }

    public final String N() {
        return this.zzf;
    }

    public final boolean O() {
        return (this.zzb & 4) != 0;
    }

    public final String P() {
        return this.zzg;
    }

    public final boolean Q() {
        return (this.zzb & 8) != 0;
    }

    public final long R() {
        return this.zzh;
    }

    public final boolean S() {
        return (this.zzb & 16) != 0;
    }

    public final String T() {
        return this.zzi;
    }

    public final boolean U() {
        return (this.zzb & 32) != 0;
    }

    public final String V() {
        return this.zzj;
    }

    public final boolean W() {
        return (this.zzb & 64) != 0;
    }

    public final String X() {
        return this.zzk;
    }

    public final boolean Y() {
        return (this.zzb & 128) != 0;
    }

    public final long Z() {
        return this.zzl;
    }

    public final boolean a0() {
        return (this.zzb & 256) != 0;
    }

    public final String b0() {
        return this.zzo;
    }

    public final /* synthetic */ void e0(String str) {
        this.zzb |= 1;
        this.zze = str;
    }

    public final /* synthetic */ void f0() {
        this.zzb &= -2;
        this.zze = zzp.zze;
    }

    public final /* synthetic */ void g0(String str) {
        this.zzb |= 2;
        this.zzf = str;
    }

    public final /* synthetic */ void h0() {
        this.zzb &= -3;
        this.zzf = zzp.zzf;
    }

    public final /* synthetic */ void i0(String str) {
        this.zzb |= 4;
        this.zzg = str;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzp, "\u0004\u000b\u0000\u0001\u0001\u000b\u000b\u0002\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဈ\u0002\u0004ဂ\u0003\u0005ဈ\u0004\u0006ဈ\u0005\u0007ဈ\u0006\bဂ\u0007\t2\n2\u000bဈ\b", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", n9.f32849a, "zzn", o9.f32916a, "zzo"});
        }
        if (i11 == 3) {
            return new p9();
        }
        if (i11 == 4) {
            return new m9(zzp);
        }
        if (i11 == 5) {
            return zzp;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzq;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (p9.class) {
            try {
                m1Var = zzq;
                if (m1Var == null) {
                    m1Var = new m1(zzp);
                    zzq = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final /* synthetic */ void x() {
        this.zzb &= -5;
        this.zzg = zzp.zzg;
    }

    public final /* synthetic */ void y(long j11) {
        this.zzb |= 8;
        this.zzh = j11;
    }

    public final /* synthetic */ void z(String str) {
        this.zzb |= 16;
        this.zzi = str;
    }
}
