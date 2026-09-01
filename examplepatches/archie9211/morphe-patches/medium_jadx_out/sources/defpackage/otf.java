package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class otf extends fnf {
    private static final otf zzf;
    private static volatile mof zzg;
    private int zza;
    private int zzd;
    private int zze;

    static {
        otf otfVar = new otf();
        zzf = otfVar;
        fnf.l(otf.class, otfVar);
    }

    public static otf w(byte[] bArr) {
        return (otf) fnf.p(zzf, bArr);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzf, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဌ\u0000\u0002ဌ\u0001", new Object[]{"zza", "zzd", "zze"});
        }
        if (i2 == 3) {
            return new otf();
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
        synchronized (otf.class) {
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

    public final qtf v() {
        qtf qtfVar;
        switch (this.zze) {
            case 0:
                qtfVar = qtf.JS_CODE_UNSPECIFIED;
                break;
            case 1:
                qtfVar = qtf.JS_CODE_SUCCESS;
                break;
            case 2:
                qtfVar = qtf.JS_NETWORK_ERROR;
                break;
            case 3:
                qtfVar = qtf.JS_INTERNAL_ERROR;
                break;
            case 4:
                qtfVar = qtf.JS_INVALID_SITE_KEY;
                break;
            case 5:
                qtfVar = qtf.JS_INVALID_SITE_KEY_TYPE;
                break;
            case 6:
                qtfVar = qtf.JS_3P_APP_PACKAGE_NAME_NOT_ALLOWED;
                break;
            case 7:
                qtfVar = qtf.JS_INVALID_ACTION;
                break;
            case 8:
                qtfVar = qtf.JS_THIRD_PARTY_APP_PACKAGE_NAME_NOT_ALLOWED;
                break;
            case 9:
                qtfVar = qtf.JS_PROGRAM_ERROR;
                break;
            default:
                qtfVar = null;
                break;
        }
        return qtfVar == null ? qtf.UNRECOGNIZED : qtfVar;
    }
}
