package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jsf extends fnf {
    private static final jsf zzn;
    private static volatile mof zzo;
    private int zza;
    private dsf zzk;
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzg = "";
    private String zzh = "";
    private String zzi = "";
    private String zzj = "";
    private String zzl = "";
    private String zzm = "";

    static {
        jsf jsfVar = new jsf();
        zzn = jsfVar;
        fnf.l(jsf.class, jsfVar);
    }

    public static isf v() {
        return (isf) zzn.h();
    }

    public final /* synthetic */ void A(dsf dsfVar) {
        dsfVar.getClass();
        this.zzk = dsfVar;
        this.zza |= 128;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzn, "\u0004\n\u0000\u0001\u0001\n\n\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ለ\u0004\u0006ለ\u0005\u0007ለ\u0006\bဉ\u0007\tለ\b\nለ\t", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl", "zzm"});
        }
        if (i2 == 3) {
            return new jsf();
        }
        if (i2 == 4) {
            return new isf(zzn);
        }
        if (i2 == 5) {
            return zzn;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzo;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (jsf.class) {
            try {
                dnfVar = zzo;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzn);
                    zzo = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final /* synthetic */ void w(String str) {
        str.getClass();
        this.zza |= 1;
        this.zzd = str;
    }

    public final /* synthetic */ void x(String str) {
        str.getClass();
        this.zza |= 2;
        this.zze = str;
    }

    public final /* synthetic */ void y(String str) {
        str.getClass();
        this.zza |= 4;
        this.zzf = str;
    }

    public final /* synthetic */ void z(String str) {
        this.zza |= 8;
        this.zzg = str;
    }
}
