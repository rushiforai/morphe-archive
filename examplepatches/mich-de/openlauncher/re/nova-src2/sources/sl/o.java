package sl;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.NoSuchProviderException;
import java.security.Provider;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Objects;
import kl.w0;
import ql.u;
import ql.w;

/* loaded from: classes3.dex */
public abstract class o implements el.i {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f87525a = new byte[0];

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f87526b = {0};

    /* renamed from: c, reason: collision with root package name */
    public static final x7.l f87527c;

    static {
        x7.e eVarD = x7.l.d();
        eVarD.a(l.f87516a, ql.s.f84204b);
        eVarD.a(l.f87517b, ql.s.f84205c);
        eVarD.a(l.f87518c, ql.s.f84206d);
        f87527c = eVarD.b();
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002a A[Catch: NoSuchProviderException -> 0x003d, TryCatch #0 {NoSuchProviderException -> 0x003d, blocks: (B:2:0x0000, B:4:0x0010, B:8:0x0021, B:13:0x0030, B:15:0x0035, B:16:0x003c, B:7:0x001d, B:11:0x002a), top: B:23:0x0000 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static el.i b(w wVar) throws NoSuchProviderException {
        Provider providerN;
        try {
            int i5 = w0.f71650a;
            if (Objects.equals(System.getProperty("java.vendor"), "The Android Project")) {
                providerN = null;
                if ((!Objects.equals(System.getProperty("java.vendor"), "The Android Project") ? null : kl.a.i()).intValue() > 21) {
                    providerN = kl.a.n();
                }
            }
            if (providerN != null) {
                return rl.j.b(wVar, providerN);
            }
            throw new NoSuchProviderException("RSA-PKCS1.5 using Conscrypt is not supported.");
        } catch (NoSuchProviderException unused) {
            KeyFactory keyFactory = (KeyFactory) j.f87513f.f87514a.a("RSA");
            BigInteger bigInteger = wVar.f84226d;
            u uVar = wVar.f84225c;
            return new n((RSAPublicKey) keyFactory.generatePublic(new RSAPublicKeySpec(bigInteger, uVar.f84215b)), (l) f87527c.j(uVar.f84217d), wVar.f84227e.b(), uVar.f84216c.equals(ql.t.f84210d) ? f87526b : f87525a);
        }
    }
}
