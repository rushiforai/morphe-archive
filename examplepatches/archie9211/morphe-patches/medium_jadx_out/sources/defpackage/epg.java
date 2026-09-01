package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class epg extends fnf {
    private static final epg zzf;
    private static volatile mof zzg;
    private String zza = "";
    private pmf zzd = pmf.b;
    private int zze;

    static {
        epg epgVar = new epg();
        zzf = epgVar;
        fnf.l(epg.class, epgVar);
    }

    public static bpg x() {
        return (bpg) zzf.h();
    }

    public static epg y() {
        return zzf;
    }

    public final /* synthetic */ void A(pmf pmfVar) {
        pmfVar.getClass();
        this.zzd = pmfVar;
    }

    public final int B() {
        int i = this.zze;
        int i2 = i != 0 ? i != 1 ? i != 2 ? i != 3 ? i != 4 ? 0 : 6 : 5 : 4 : 3 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }

    public final /* synthetic */ void C(int i) {
        this.zze = i - 2;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\n\u0003\f", new Object[]{"zza", "zzd", "zze"});
        }
        if (i2 == 3) {
            return new epg();
        }
        if (i2 == 4) {
            return new bpg(zzf);
        }
        if (i2 == 5) {
            return zzf;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzg;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (epg.class) {
            try {
                dnfVar = zzg;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzf);
                    zzg = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final String v() {
        return this.zza;
    }

    public final pmf w() {
        return this.zzd;
    }

    public final /* synthetic */ void z(String str) {
        str.getClass();
        this.zza = str;
    }
}
