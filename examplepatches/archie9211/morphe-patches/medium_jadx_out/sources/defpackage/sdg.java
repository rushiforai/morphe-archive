package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sdg extends h5g {
    private static final sdg zzb;
    private int zzd;
    private fbg zze;
    private long zzf;

    static {
        sdg sdgVar = new sdg();
        zzb = sdgVar;
        h5g.f(sdg.class, sdgVar);
    }

    public static pdg q() {
        return (pdg) zzb.k();
    }

    public static /* synthetic */ void r(sdg sdgVar, fbg fbgVar) {
        sdgVar.zze = fbgVar;
        sdgVar.zzd |= 1;
    }

    public static /* synthetic */ void s(sdg sdgVar, long j) {
        sdgVar.zzd |= 2;
        sdgVar.zzf = j;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဂ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i2 == 3) {
            return new sdg();
        }
        if (i2 == 4) {
            return new pdg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
