package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ipg extends fnf {
    private static final ipg zzh;
    private static volatile mof zzi;
    private int zze;
    private boolean zzf;
    private String zza = "";
    private String zzd = "";
    private String zzg = "";

    static {
        ipg ipgVar = new ipg();
        zzh = ipgVar;
        fnf.l(ipg.class, ipgVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzh, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003\u000b\u0004\u0007\u0005Ȉ", new Object[]{"zza", "zzd", "zze", "zzf", "zzg"});
        }
        if (i2 == 3) {
            return new ipg();
        }
        if (i2 == 4) {
            return new rpf(zzh);
        }
        if (i2 == 5) {
            return zzh;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzi;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ipg.class) {
            try {
                dnfVar = zzi;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzh);
                    zzi = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
