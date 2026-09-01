package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f6g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.AesGcmKey");
        a = new uhg(g2g.class, new z46());
        int i = 29;
        b = new shg(qvgVarC, new rz5(i));
        c = new zfg(r1g.class, new wz7(i));
        d = new wfg(qvgVarC, new tz7(i, false));
    }

    public static d2g a(ntg ntgVar) throws GeneralSecurityException {
        int i = q6g.a[ntgVar.ordinal()];
        if (i == 1) {
            return d2g.c;
        }
        if (i == 2 || i == 3) {
            return d2g.d;
        }
        if (i == 4) {
            return d2g.e;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static ntg b(d2g d2gVar) throws GeneralSecurityException {
        if (d2g.c == d2gVar) {
            return ntg.TINK;
        }
        if (d2g.d == d2gVar) {
            return ntg.CRUNCHY;
        }
        if (d2g.e == d2gVar) {
            return ntg.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d2gVar)));
    }

    public static void c(g2g g2gVar) {
        int i = g2gVar.c;
        int i2 = g2gVar.b;
        if (i != 16) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d. Currently Tink only supports serialization of AES GCM keys with tag size equal to 16 bytes.", Integer.valueOf(g2gVar.c)));
        }
        if (i2 != 12) {
            throw new GeneralSecurityException(String.format("Invalid IV size in bytes %d. Currently Tink only supports serialization of AES GCM keys with IV size equal to 12 bytes.", Integer.valueOf(i2)));
        }
    }
}
