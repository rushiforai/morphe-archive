package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ckg {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.AesCmacKey");
        a = new uhg(gjg.class, new d9g(2));
        b = new shg(qvgVarC, new k9g());
        c = new zfg(djg.class, new e9g());
        d = new wfg(qvgVarC, new n9g());
    }

    public static zwf a(ntg ntgVar) throws GeneralSecurityException {
        int i = dkg.a[ntgVar.ordinal()];
        if (i == 1) {
            return zwf.l;
        }
        if (i == 2) {
            return zwf.m;
        }
        if (i == 3) {
            return zwf.n;
        }
        if (i == 4) {
            return zwf.o;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static ntg b(zwf zwfVar) throws GeneralSecurityException {
        if (zwf.l == zwfVar) {
            return ntg.TINK;
        }
        if (zwf.m == zwfVar) {
            return ntg.CRUNCHY;
        }
        if (zwf.o == zwfVar) {
            return ntg.RAW;
        }
        if (zwf.n == zwfVar) {
            return ntg.zzc;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(zwfVar)));
    }
}
