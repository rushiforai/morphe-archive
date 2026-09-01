package defpackage;

import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n5g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey");
        a = new uhg(f1g.class, new h1c(28));
        b = new shg(qvgVarC, new jzb());
        c = new zfg(u0g.class, new no3(28));
        d = new wfg(qvgVarC, new hpe(28));
    }

    public static d1g a(ntg ntgVar) throws GeneralSecurityException {
        int i = x5g.a[ntgVar.ordinal()];
        if (i == 1) {
            return d1g.c;
        }
        if (i == 2 || i == 3) {
            return d1g.d;
        }
        if (i == 4) {
            return d1g.e;
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }

    public static e1g b(iqg iqgVar) throws GeneralSecurityException {
        int i = x5g.b[iqgVar.ordinal()];
        if (i == 1) {
            return e1g.c;
        }
        if (i == 2) {
            return e1g.d;
        }
        if (i == 3) {
            return e1g.e;
        }
        if (i == 4) {
            return e1g.f;
        }
        if (i == 5) {
            return e1g.g;
        }
        throw new GeneralSecurityException(b09.w(iqgVar.zza(), "Unable to parse HashType: "));
    }

    public static ntg c(d1g d1gVar) throws GeneralSecurityException {
        if (d1g.c == d1gVar) {
            return ntg.TINK;
        }
        if (d1g.d == d1gVar) {
            return ntg.CRUNCHY;
        }
        if (d1g.e == d1gVar) {
            return ntg.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
    }

    public static tqg d(f1g f1gVar) {
        iqg iqgVar;
        rqg rqgVarX = tqg.x();
        int i = f1gVar.d;
        rqgVarX.c();
        ((tqg) rqgVarX.b).zzf = i;
        e1g e1gVar = f1gVar.f;
        if (e1g.c == e1gVar) {
            iqgVar = iqg.SHA1;
        } else if (e1g.d == e1gVar) {
            iqgVar = iqg.SHA224;
        } else if (e1g.e == e1gVar) {
            iqgVar = iqg.SHA256;
        } else if (e1g.f == e1gVar) {
            iqgVar = iqg.SHA384;
        } else {
            if (e1g.g != e1gVar) {
                throw new GeneralSecurityException("Unable to serialize HashType ".concat(String.valueOf(e1gVar)));
            }
            iqgVar = iqg.SHA512;
        }
        rqgVarX.c();
        ((tqg) rqgVarX.b).zze = iqgVar.zza();
        return (tqg) rqgVarX.b();
    }
}
