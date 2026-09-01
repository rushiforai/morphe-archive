package defpackage;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rjg {
    public Object a = null;
    public Object b = null;
    public Object c = null;
    public Object d = d1g.G;

    public ujg a() throws GeneralSecurityException {
        Integer num = (Integer) this.a;
        if (num == null) {
            ygf.l("key size is not set");
            return null;
        }
        if (((Integer) this.b) == null) {
            ygf.l("tag size is not set");
            return null;
        }
        if (((tjg) this.c) == null) {
            ygf.l("hash type is not set");
            return null;
        }
        if (((sjg) this.d) == null) {
            ygf.l("variant is not set");
            return null;
        }
        if (num.intValue() < 16) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; must be at least 16 bytes", (Integer) this.a));
        }
        Integer num2 = (Integer) this.b;
        int iIntValue = num2.intValue();
        tjg tjgVar = (tjg) this.c;
        if (iIntValue < 10) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; must be at least 10 bytes", num2));
        }
        if (tjgVar == tjg.b) {
            if (iIntValue > 20) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 20 bytes for SHA1", num2));
            }
        } else if (tjgVar == tjg.c) {
            if (iIntValue > 28) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 28 bytes for SHA224", num2));
            }
        } else if (tjgVar == tjg.d) {
            if (iIntValue > 32) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 32 bytes for SHA256", num2));
            }
        } else if (tjgVar == tjg.e) {
            if (iIntValue > 48) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 48 bytes for SHA384", num2));
            }
        } else {
            if (tjgVar != tjg.f) {
                ygf.l("unknown hash type; must be SHA256, SHA384 or SHA512");
                return null;
            }
            if (iIntValue > 64) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 64 bytes for SHA512", num2));
            }
        }
        return new ujg(((Integer) this.a).intValue(), ((Integer) this.b).intValue(), (sjg) this.d, (tjg) this.c);
    }

    public prg b() throws GeneralSecurityException {
        d1g d1gVar = d1g.C;
        d2g d2gVar = (d2g) this.a;
        if (d2gVar == null) {
            ygf.l("signature encoding is not set");
            return null;
        }
        grg grgVar = (grg) this.b;
        if (grgVar == null) {
            ygf.l("EC curve type is not set");
            return null;
        }
        d1g d1gVar2 = (d1g) this.c;
        if (d1gVar2 == null) {
            ygf.l("hash type is not set");
            return null;
        }
        d1g d1gVar3 = (d1g) this.d;
        if (grgVar == grg.c && d1gVar2 != d1g.A) {
            ygf.l("NIST_P256 requires SHA256");
            return null;
        }
        if (grgVar == grg.d && d1gVar2 != d1g.B && d1gVar2 != d1gVar) {
            ygf.l("NIST_P384 requires SHA384 or SHA512");
            return null;
        }
        if (grgVar != grg.e || d1gVar2 == d1gVar) {
            return new prg(d2gVar, grgVar, d1gVar2, d1gVar3);
        }
        ygf.l("NIST_P521 requires SHA512");
        return null;
    }
}
