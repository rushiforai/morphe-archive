package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m7g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key");
        a = new uhg(c3g.class, new no3(29));
        b = new shg(qvgVarC, new xsa(29));
        c = new zfg(u2g.class, new zi5(29));
        d = new wfg(qvgVarC, new s7g());
    }

    public static b3g a(ntg ntgVar) throws GeneralSecurityException {
        int i = q7g.a[ntgVar.ordinal()];
        if (i == 1) {
            return b3g.c;
        }
        if (i == 2 || i == 3) {
            return b3g.d;
        }
        if (i == 4) {
            return b3g.e;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static ntg b(b3g b3gVar) throws GeneralSecurityException {
        if (b3g.c == b3gVar) {
            return ntg.TINK;
        }
        if (b3g.d == b3gVar) {
            return ntg.CRUNCHY;
        }
        if (b3g.e == b3gVar) {
            return ntg.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(b3gVar)));
    }
}
