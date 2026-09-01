package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class msf extends fnf {
    private static final msf zzf;
    private static volatile mof zzg;
    private int zza;
    private String zzd = "";
    private String zze = "";

    static {
        msf msfVar = new msf();
        zzf = msfVar;
        fnf.l(msf.class, msfVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001", new Object[]{"zza", "zzd", "zze"});
        }
        if (i2 == 3) {
            return new msf();
        }
        if (i2 == 4) {
            return new rpf(zzf);
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
        synchronized (msf.class) {
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
        return this.zzd;
    }

    public final String w() {
        return this.zze;
    }
}
