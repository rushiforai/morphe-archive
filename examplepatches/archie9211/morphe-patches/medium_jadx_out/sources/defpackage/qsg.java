package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qsg extends ytf {
    private static final qsg zzc;
    private static volatile ouf zzd;
    private int zze;
    private csg zzf;
    private int zzg;
    private int zzh;
    private int zzi;

    static {
        qsg qsgVar = new qsg();
        zzc = qsgVar;
        ytf.j(qsg.class, qsgVar);
    }

    public static psg A() {
        return (psg) zzc.o();
    }

    public static /* synthetic */ void v(qsg qsgVar, csg csgVar) {
        qsgVar.zzf = csgVar;
        qsgVar.zze |= 1;
    }

    public final ntg B() {
        ntg ntgVarZza = ntg.zza(this.zzi);
        return ntgVarZza == null ? ntg.UNRECOGNIZED : ntgVarZza;
    }

    public final boolean C() {
        return (this.zze & 1) != 0;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (osg.a[i - 1]) {
            case 1:
                return new qsg();
            case 2:
                return new psg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002\f\u0003\u000b\u0004\f", new Object[]{"zze", "zzf", "zzg", "zzh", "zzi"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (qsg.class) {
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

    public final int t() {
        return this.zzh;
    }

    public final csg y() {
        csg csgVar = this.zzf;
        return csgVar == null ? csg.y() : csgVar;
    }

    public final dsg z() {
        dsg dsgVarZza = dsg.zza(this.zzg);
        return dsgVarZza == null ? dsg.UNRECOGNIZED : dsgVarZza;
    }
}
