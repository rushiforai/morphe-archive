package lp;

import javax.crypto.SecretKey;

/* loaded from: classes4.dex */
public final class e implements SecretKey {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ SecretKey f75085a;

    public e(SecretKey secretKey) {
        this.f75085a = secretKey;
    }

    @Override // java.security.Key
    public final String getAlgorithm() {
        return "AES";
    }

    @Override // java.security.Key
    public final byte[] getEncoded() {
        return this.f75085a.getEncoded();
    }

    @Override // java.security.Key
    public final String getFormat() {
        return this.f75085a.getFormat();
    }
}
