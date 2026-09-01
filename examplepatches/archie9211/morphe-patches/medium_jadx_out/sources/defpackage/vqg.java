package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vqg extends fnf {
    private static final vqg zzf;
    private static volatile mof zzg;
    private int zza;
    private int zzd;
    private int zze;

    static {
        vqg vqgVar = new vqg();
        zzf = vqgVar;
        fnf.l(vqg.class, vqgVar);
    }

    public static uqg y() {
        return (uqg) zzf.h();
    }

    public static vqg z() {
        return zzf;
    }

    public final /* synthetic */ void A(apg apgVar) {
        this.zza = apgVar.zza();
    }

    public final /* synthetic */ void B(apg apgVar) {
        this.zzd = apgVar.zza();
    }

    public final /* synthetic */ void C(int i) {
        this.zze = i;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002\f\u0003\u0004", new Object[]{"zza", "zzd", "zze"});
        }
        if (i2 == 3) {
            return new vqg();
        }
        if (i2 == 4) {
            return new uqg(zzf);
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
        synchronized (vqg.class) {
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

    public final apg w() {
        apg apgVarZzb = apg.zzb(this.zzd);
        return apgVarZzb == null ? apg.UNRECOGNIZED : apgVarZzb;
    }

    public final int x() {
        return this.zze;
    }
}
