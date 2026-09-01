package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class u6g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.AesGcmSivKey");
        a = new uhg(r2g.class, new jzb());
        b = new shg(qvgVarC, new u3b(29));
        c = new zfg(j2g.class, new hpe(29));
        d = new wfg(qvgVarC, new h1c(29));
    }

    public static d1g a(ntg ntgVar) throws GeneralSecurityException {
        int i = f7g.a[ntgVar.ordinal()];
        if (i == 1) {
            return d1g.i;
        }
        if (i == 2 || i == 3) {
            return d1g.j;
        }
        if (i == 4) {
            return d1g.k;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static ntg b(d1g d1gVar) throws GeneralSecurityException {
        if (d1g.i == d1gVar) {
            return ntg.TINK;
        }
        if (d1g.j == d1gVar) {
            return ntg.CRUNCHY;
        }
        if (d1g.k == d1gVar) {
            return ntg.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
    }
}
