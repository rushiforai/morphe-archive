package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class org extends ytf {
    private static final org zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private int zzg;

    static {
        org orgVar = new org();
        zzc = orgVar;
        ytf.j(org.class, orgVar);
    }

    public static org A() {
        return zzc;
    }

    public static nrg z() {
        return (nrg) zzc.o();
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (irg.a[i - 1]) {
            case 1:
                return new org();
            case 2:
                return new nrg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002\f\u0003\f", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (org.class) {
                    try {
                        wtfVar = zzd;
                        if (wtfVar == null) {
                            wtfVar = new wtf();
                            zzd = wtfVar;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return wtfVar;
            case 6:
                return (byte) 1;
            default:
                throw null;
        }
    }

    public final yqg t() {
        yqg yqgVarZza = yqg.zza(this.zzg);
        return yqgVarZza == null ? yqg.UNRECOGNIZED : yqgVarZza;
    }

    public final drg x() {
        drg drgVarZza = drg.zza(this.zzf);
        return drgVarZza == null ? drg.UNRECOGNIZED : drgVarZza;
    }

    public final brg y() {
        brg brgVarZza = brg.zza(this.zze);
        return brgVarZza == null ? brg.UNRECOGNIZED : brgVarZza;
    }
}
