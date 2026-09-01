package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jqg extends fnf {
    private static final jqg zzd;
    private static volatile mof zze;
    private int zza;

    static {
        jqg jqgVar = new jqg();
        zzd = jqgVar;
        fnf.l(jqg.class, jqgVar);
    }

    public static hqg w() {
        return (hqg) zzd.h();
    }

    public static jqg x() {
        return zzd;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzd, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\f", new Object[]{"zza"});
        }
        if (i2 == 3) {
            return new jqg();
        }
        if (i2 == 4) {
            return new hqg(zzd);
        }
        if (i2 == 5) {
            return zzd;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zze;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (jqg.class) {
            try {
                dnfVar = zze;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzd);
                    zze = dnfVar;
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
}
