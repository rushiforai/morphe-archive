package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class w8g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.XAesGcmKey");
        int i = 0;
        a = new uhg(a5g.class, new z8g(i));
        b = new shg(qvgVarC, new y8g());
        c = new zfg(u4g.class, new d9g(i));
        d = new wfg(qvgVarC, new b9g());
    }

    public static e1g a(ntg ntgVar) throws GeneralSecurityException {
        int i = i9g.a[ntgVar.ordinal()];
        if (i == 1) {
            return e1g.h;
        }
        if (i == 2) {
            return e1g.i;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }
}
