package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class vtg extends ytf {
    private static final vtg zzc;
    private static volatile ouf zzd;
    private int zze;
    private int zzf;
    private ztg zzg;

    static {
        vtg vtgVar = new vtg();
        zzc = vtgVar;
        ytf.j(vtg.class, vtgVar);
    }

    public static vtg u(hsf hsfVar, ptf ptfVar) {
        return (vtg) ytf.h(zzc, hsfVar, ptfVar);
    }

    public static /* synthetic */ void v(vtg vtgVar, ztg ztgVar) {
        vtgVar.zzg = ztgVar;
        vtgVar.zze |= 1;
    }

    public static ttg w() {
        return (ttg) zzc.o();
    }

    public final int t() {
        return this.zzf;
    }

    public final ztg x() {
        ztg ztgVar = this.zzg;
        return ztgVar == null ? ztg.w() : ztgVar;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (wtg.a[i - 1]) {
            case 1:
                return new vtg();
            case 2:
                return new ttg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0001\u0003\u0002\u0000\u0000\u0000\u0001\u000b\u0003ဉ\u0000", new Object[]{"zze", HrUBqHumRuLe.reiWT, "zzg"});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (vtg.class) {
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
}
