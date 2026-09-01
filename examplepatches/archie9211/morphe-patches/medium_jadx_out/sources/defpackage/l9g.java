package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class l9g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key");
        a = new uhg(m5g.class, new k9g());
        b = new shg(qvgVarC, new q9g(0));
        c = new zfg(g5g.class, new n9g());
        d = new wfg(qvgVarC, new s9g(0));
    }

    public static d1g a(ntg ntgVar) throws GeneralSecurityException {
        int i = r9g.a[ntgVar.ordinal()];
        if (i == 1) {
            return d1g.p;
        }
        if (i == 2 || i == 3) {
            return d1g.q;
        }
        if (i == 4) {
            return d1g.r;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static ntg b(d1g d1gVar) throws GeneralSecurityException {
        if (d1g.p == d1gVar) {
            return ntg.TINK;
        }
        if (d1g.q == d1gVar) {
            return ntg.CRUNCHY;
        }
        if (d1g.r == d1gVar) {
            return ntg.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
    }
}
