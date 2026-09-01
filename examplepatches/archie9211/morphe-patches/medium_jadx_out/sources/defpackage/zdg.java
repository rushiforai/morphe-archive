package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zdg extends h5g {
    private static final zdg zzb;
    private int zzd;
    private int zze;
    private boolean zzf;
    private long zzg;
    private boolean zzh;
    private int zzi;
    private int zzj;

    static {
        zdg zdgVar = new zdg();
        zzb = zdgVar;
        h5g.f(zdg.class, zdgVar);
    }

    public static vdg q() {
        return (vdg) zzb.k();
    }

    public static /* synthetic */ void r(zdg zdgVar, boolean z) {
        zdgVar.zzd |= 8;
        zdgVar.zzh = z;
    }

    public static /* synthetic */ void s(zdg zdgVar, int i) {
        zdgVar.zzd |= 16;
        zdgVar.zzi = i;
    }

    public static /* synthetic */ void t(zdg zdgVar, long j) {
        zdgVar.zzd |= 4;
        zdgVar.zzg = j;
    }

    public static /* synthetic */ void u(zdg zdgVar, int i) {
        zdgVar.zzd |= 32;
        zdgVar.zzj = i;
    }

    public static /* synthetic */ void v(zdg zdgVar) {
        zdgVar.zzd |= 2;
        zdgVar.zzf = true;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001င\u0000\u0002ဇ\u0001\u0003ဂ\u0002\u0004ဇ\u0003\u0005င\u0004\u0006င\u0005", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i2 == 3) {
            return new zdg();
        }
        if (i2 == 4) {
            return new vdg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
