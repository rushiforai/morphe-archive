package rl;

import h6.c1;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.NoSuchProviderException;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import kl.w0;

/* loaded from: classes3.dex */
public final class e implements el.i {

    /* renamed from: e, reason: collision with root package name */
    public static final byte[] f86064e = {48, 42, 48, 5, 6, 3, 43, 101, 112, 3, 33, 0};

    /* renamed from: a, reason: collision with root package name */
    public final PublicKey f86065a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f86066b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f86067c;

    /* renamed from: d, reason: collision with root package name */
    public final Provider f86068d;

    public e(byte[] bArr, byte[] bArr2, byte[] bArr3, Provider provider) throws GeneralSecurityException {
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Can not use Ed25519 in FIPS-mode.");
        }
        if (bArr.length != 32) {
            throw new IllegalArgumentException("Given public key's length is not 32.");
        }
        this.f86065a = KeyFactory.getInstance("Ed25519", provider).generatePublic(new X509EncodedKeySpec(sl.d.a(f86064e, bArr)));
        this.f86066b = bArr2;
        this.f86067c = bArr3;
        this.f86068d = provider;
    }

    public static e b(ql.k kVar) throws GeneralSecurityException {
        Provider providerN = kl.a.n();
        if (providerN == null) {
            throw new NoSuchProviderException("Ed25519VerifyJce requires the Conscrypt provider.");
        }
        if (c1.b(1)) {
            return new e(kVar.f84176d.b(), kVar.f84177e.b(), kVar.f84175c.f84166a.equals(ql.g.f84163d) ? new byte[]{0} : new byte[0], providerN);
        }
        throw new GeneralSecurityException("Can not use Ed25519 in FIPS-mode.");
    }

    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        boolean zVerify;
        int length = bArr.length;
        byte[] bArr3 = this.f86066b;
        if (length != bArr3.length + 64) {
            throw new GeneralSecurityException("Invalid signature length: 64");
        }
        if (!w0.b(bArr3, bArr)) {
            throw new GeneralSecurityException("Invalid signature (output prefix mismatch)");
        }
        Signature signature = Signature.getInstance("Ed25519", this.f86068d);
        signature.initVerify(this.f86065a);
        signature.update(bArr2);
        signature.update(this.f86067c);
        try {
            zVerify = signature.verify(bArr, bArr3.length, 64);
        } catch (RuntimeException unused) {
            zVerify = false;
        }
        if (!zVerify) {
            throw new GeneralSecurityException("Signature check failed.");
        }
    }
}
