package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zog extends ytf {
    private static final zog zzc;
    private static volatile ouf zzd;
    private int zze;
    private tpg zzf;
    private oog zzg;
    private int zzh;

    static {
        zog zogVar = new zog();
        zzc = zogVar;
        ytf.j(zog.class, zogVar);
    }

    public static /* synthetic */ void u(zog zogVar, oog oogVar) {
        zogVar.zzg = oogVar;
        zogVar.zze |= 2;
    }

    public static /* synthetic */ void w(zog zogVar, tpg tpgVar) {
        zogVar.zzf = tpgVar;
        zogVar.zze |= 1;
    }

    public static yog y() {
        return (yog) zzc.o();
    }

    public static zog z() {
        return zzc;
    }

    public final tpg A() {
        tpg tpgVar = this.zzf;
        return tpgVar == null ? tpg.x() : tpgVar;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (cpg.a[i - 1]) {
            case 1:
                return new zog();
            case 2:
                return new yog(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003\f", new Object[]{"zze", "zzf", "zzg", "zzh"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (zog.class) {
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

    public final pog t() {
        pog pogVarZza = pog.zza(this.zzh);
        return pogVarZza == null ? pog.UNRECOGNIZED : pogVarZza;
    }

    public final oog x() {
        oog oogVar = this.zzg;
        return oogVar == null ? oog.v() : oogVar;
    }
}
