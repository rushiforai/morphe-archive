package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dsf extends fnf {
    private static final dsf zzo;
    private static volatile mof zzp;
    private int zza;
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzg = "";
    private String zzh = "";
    private gsf zzi;
    private srf zzj;
    private fsf zzk;
    private drf zzl;
    private vrf zzm;
    private yqf zzn;

    static {
        dsf dsfVar = new dsf();
        zzo = dsfVar;
        fnf.l(dsf.class, dsfVar);
    }

    public static zrf v() {
        return (zrf) zzo.h();
    }

    public static dsf w() {
        return zzo;
    }

    public final /* synthetic */ void A(drf drfVar) {
        this.zzl = drfVar;
        this.zza |= 256;
    }

    public final /* synthetic */ void B(vrf vrfVar) {
        this.zzm = vrfVar;
        this.zza |= 512;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzo, "\u0004\u000b\u0000\u0001\u0001\u000b\u000b\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ለ\u0004\u0006ဉ\u0005\u0007ဉ\u0006\bဉ\u0007\tဉ\b\nဉ\t\u000bဉ\n", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm", "zzn"});
        }
        if (i2 == 3) {
            return new dsf();
        }
        if (i2 == 4) {
            return new zrf(zzo);
        }
        if (i2 == 5) {
            return zzo;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzp;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (dsf.class) {
            try {
                dnfVar = zzp;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzo);
                    zzp = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final /* synthetic */ void x(String str) {
        str.getClass();
        this.zza |= 1;
        this.zzd = str;
    }

    public final /* synthetic */ void y() {
        this.zza &= -2;
        this.zzd = zzo.zzd;
    }

    public final /* synthetic */ void z(srf srfVar) {
        this.zzj = srfVar;
        this.zza |= 64;
    }
}
