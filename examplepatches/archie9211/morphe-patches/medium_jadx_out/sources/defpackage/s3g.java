package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class s3g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.KmsAeadKey");
        a = new uhg(l3g.class, new zi5(27));
        b = new shg(qvgVarC, new uob(27));
        c = new zfg(k3g.class, new xsa(27));
        d = new wfg(qvgVarC, new dq1(28));
    }

    public static d1g a(ntg ntgVar) throws GeneralSecurityException {
        int i = v3g.a[ntgVar.ordinal()];
        if (i == 1) {
            return d1g.l;
        }
        if (i == 2) {
            return d1g.m;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }
}
