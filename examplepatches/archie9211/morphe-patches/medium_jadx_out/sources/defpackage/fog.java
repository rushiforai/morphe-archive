package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fog extends fnf {
    private static final fog zzf;
    private static volatile mof zzg;
    private int zza;
    private int zzd;
    private int zze;

    static {
        fog fogVar = new fog();
        zzf = fogVar;
        fnf.l(fog.class, fogVar);
    }

    public static dog w() {
        return (dog) zzf.h();
    }

    public static fog x() {
        return zzf;
    }

    public final int A() {
        int i = this.zze;
        int i2 = i != 0 ? i != 1 ? i != 2 ? 0 : 4 : 3 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }

    public final void B(int i) {
        if (i != 1) {
            this.zzd = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }

    public final void C(int i) {
        if (i != 1) {
            this.zze = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002\f\u0003\f", new Object[]{"zza", "zzd", "zze"});
        }
        if (i2 == 3) {
            return new fog();
        }
        if (i2 == 4) {
            return new dog(zzf);
        }
        if (i2 == 5) {
            return zzf;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzg;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (fog.class) {
            try {
                dnfVar = zzg;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzf);
                    zzg = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final apg v() {
        apg apgVarZzb = apg.zzb(this.zza);
        return apgVarZzb == null ? apg.UNRECOGNIZED : apgVarZzb;
    }

    public final /* synthetic */ void y(apg apgVar) {
        this.zza = apgVar.zza();
    }

    public final int z() {
        int i = this.zzd;
        int i2 = i != 0 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? 0 : 7 : 6 : 5 : 4 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }
}
