package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c2g extends h5g {
    private static final c2g zzb;
    private int zzd;
    private v2g zze;
    private v2g zzf;
    private int zzg;

    static {
        c2g c2gVar = new c2g();
        zzb = c2gVar;
        h5g.f(c2g.class, c2gVar);
    }

    public static a2g q() {
        return (a2g) zzb.k();
    }

    public static /* synthetic */ void r(c2g c2gVar, v2g v2gVar) {
        c2gVar.zze = v2gVar;
        c2gVar.zzd |= 1;
    }

    public static /* synthetic */ void s(c2g c2gVar, v2g v2gVar) {
        c2gVar.zzf = v2gVar;
        c2gVar.zzd |= 2;
    }

    public static /* synthetic */ void t(c2g c2gVar, int i) {
        c2gVar.zzg = i - 1;
        c2gVar.zzd |= 4;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003᠌\u0002", new Object[]{"zzd", "zze", "zzf", "zzg", y2g.b});
        }
        if (i2 == 3) {
            return new c2g();
        }
        if (i2 == 4) {
            return new a2g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
