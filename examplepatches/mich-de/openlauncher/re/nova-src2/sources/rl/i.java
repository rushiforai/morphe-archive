package rl;

import h6.c1;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.interfaces.RSAPrivateCrtKey;
import ql.s;

/* loaded from: classes3.dex */
public final class i implements el.h {

    /* renamed from: g, reason: collision with root package name */
    public static final byte[] f86082g = new byte[0];

    /* renamed from: h, reason: collision with root package name */
    public static final byte[] f86083h = {0};

    /* renamed from: i, reason: collision with root package name */
    public static final byte[] f86084i = {1, 2, 3};

    /* renamed from: a, reason: collision with root package name */
    public final RSAPrivateCrtKey f86085a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86086b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f86087c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f86088d;

    /* renamed from: e, reason: collision with root package name */
    public final el.i f86089e;

    /* renamed from: f, reason: collision with root package name */
    public final Provider f86090f;

    public i(RSAPrivateCrtKey rSAPrivateCrtKey, s sVar, byte[] bArr, byte[] bArr2, el.i iVar, Provider provider) throws GeneralSecurityException {
        if (!c1.c(2)) {
            throw new GeneralSecurityException("Can not use RSA PKCS1.5 in FIPS-mode, as BoringCrypto module is not available.");
        }
        if (sVar != s.f84204b && sVar != s.f84205c && sVar != s.f84206d) {
            throw new GeneralSecurityException("Unsupported hash: " + sVar);
        }
        sl.s.b(rSAPrivateCrtKey.getModulus().bitLength());
        sl.s.c(rSAPrivateCrtKey.getPublicExponent());
        this.f86085a = rSAPrivateCrtKey;
        this.f86086b = j.c(sVar);
        this.f86087c = bArr;
        this.f86088d = bArr2;
        this.f86089e = iVar;
        this.f86090f = provider;
    }
}
