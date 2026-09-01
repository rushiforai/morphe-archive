package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q2g extends h5g {
    private static final q2g zzb;
    private int zzd;
    private int zze;
    private int zzf;
    private String zzg = "";
    private String zzh = "";
    private String zzi = "";
    private String zzj = "";

    static {
        q2g q2gVar = new q2g();
        zzb = q2gVar;
        h5g.f(q2g.class, q2gVar);
    }

    public static n2g q() {
        return (n2g) zzb.k();
    }

    public static /* synthetic */ void r(q2g q2gVar, String str) {
        q2gVar.zzd |= 4;
        q2gVar.zzg = str;
    }

    public static /* synthetic */ void s(q2g q2gVar, String str) {
        str.getClass();
        q2gVar.zzd |= 16;
        q2gVar.zzi = str;
    }

    public static /* synthetic */ void t(q2g q2gVar, String str) {
        q2gVar.zzd |= 32;
        q2gVar.zzj = str;
    }

    public static /* synthetic */ void u(q2g q2gVar) {
        q2gVar.zzd |= 8;
        q2gVar.zzh = "9.0.0";
    }

    public static /* synthetic */ void v(q2g q2gVar) {
        q2gVar.zzd |= 1;
        q2gVar.zze = 24;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001င\u0000\u0002င\u0001\u0003ဈ\u0002\u0004ဈ\u0003\u0005ဈ\u0004\u0006ဈ\u0005", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i2 == 3) {
            return new q2g();
        }
        if (i2 == 4) {
            return new n2g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
