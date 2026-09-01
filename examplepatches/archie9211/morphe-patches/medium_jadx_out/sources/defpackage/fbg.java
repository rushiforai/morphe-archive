package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fbg extends h5g {
    private static final fbg zzb;
    private int zzd;
    private int zze;
    private int zzg;
    private int zzi;
    private int zzj;
    private String zzf = "";
    private String zzh = "";

    static {
        fbg fbgVar = new fbg();
        zzb = fbgVar;
        h5g.f(fbg.class, fbgVar);
    }

    public static /* synthetic */ void q(fbg fbgVar, int i) {
        fbgVar.zzd |= 1;
        fbgVar.zze = i;
    }

    public static zag r() {
        return (zag) zzb.k();
    }

    public static /* synthetic */ void s(fbg fbgVar, String str) {
        fbgVar.zzd |= 8;
        fbgVar.zzh = str;
    }

    public static /* synthetic */ void t(fbg fbgVar, String str) {
        str.getClass();
        fbgVar.zzd |= 2;
        fbgVar.zzf = str;
    }

    public static /* synthetic */ void u(fbg fbgVar, int i) {
        fbgVar.zzd |= 32;
        fbgVar.zzj = i;
    }

    public static /* synthetic */ void v(fbg fbgVar, int i) {
        fbgVar.zzd |= 16;
        fbgVar.zzi = i;
    }

    public static /* synthetic */ void w(fbg fbgVar, cbg cbgVar) {
        fbgVar.zzg = cbgVar.zza();
        fbgVar.zzd |= 4;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0006\u0000\u0001\u0001\b\u0006\u0000\u0000\u0000\u0001င\u0000\u0002ဈ\u0001\u0004᠌\u0002\u0005ဈ\u0003\u0007င\u0004\bင\u0005", new Object[]{"zzd", "zze", "zzf", "zzg", y2g.d, "zzh", "zzi", "zzj"});
        }
        if (i2 == 3) {
            return new fbg();
        }
        if (i2 == 4) {
            return new zag(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
