package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v5g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.AesEaxKey");
        a = new uhg(p1g.class, new xsa(28));
        b = new shg(qvgVarC, new zi5(28));
        c = new zfg(j1g.class, new dq1(29));
        d = new wfg(qvgVarC, new uob(28));
    }

    public static d1g a(ntg ntgVar) throws GeneralSecurityException {
        int i = e6g.a[ntgVar.ordinal()];
        if (i == 1) {
            return d1g.f;
        }
        if (i == 2 || i == 3) {
            return d1g.g;
        }
        if (i == 4) {
            return d1g.h;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static ntg b(d1g d1gVar) throws GeneralSecurityException {
        if (d1g.f == d1gVar) {
            return ntg.TINK;
        }
        if (d1g.g == d1gVar) {
            return ntg.CRUNCHY;
        }
        if (d1g.h == d1gVar) {
            return ntg.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
    }

    public static wmg c(p1g p1gVar) {
        if (p1gVar.c != 16) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d. Currently Tink only supports aes eax keys with tag size equal to 16 bytes.", Integer.valueOf(p1gVar.c)));
        }
        umg umgVarV = wmg.v();
        int i = p1gVar.b;
        umgVarV.c();
        ((wmg) umgVarV.b).zze = i;
        return (wmg) umgVarV.b();
    }
}
