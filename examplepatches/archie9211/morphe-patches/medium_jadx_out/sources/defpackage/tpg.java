package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tpg extends ytf {
    private static final tpg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private hsf zzg = hsf.b;

    static {
        tpg tpgVar = new tpg();
        zzc = tpgVar;
        ytf.j(tpg.class, tpgVar);
    }

    public static rpg t() {
        return (rpg) zzc.o();
    }

    public static /* synthetic */ void u(tpg tpgVar, hsf hsfVar) {
        hsfVar.getClass();
        tpgVar.zzg = hsfVar;
    }

    public static tpg x() {
        return zzc;
    }

    public final hsf A() {
        return this.zzg;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (wpg.a[i - 1]) {
            case 1:
                return new tpg();
            case 2:
                return new rpg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0003\u0000\u0000\u0001\u000b\u0003\u0000\u0000\u0000\u0001\f\u0002\f\u000b\n", new Object[]{"zze", "zzf", "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (tpg.class) {
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

    public final ypg y() {
        ypg ypgVarZza = ypg.zza(this.zze);
        return ypgVarZza == null ? ypg.UNRECOGNIZED : ypgVarZza;
    }

    public final iqg z() {
        iqg iqgVarZza = iqg.zza(this.zzf);
        return iqgVarZza == null ? iqg.UNRECOGNIZED : iqgVarZza;
    }
}
