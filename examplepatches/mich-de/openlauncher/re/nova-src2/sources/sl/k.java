package sl;

import java.security.KeyFactory;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.Provider;
import java.security.Signature;
import javax.crypto.Cipher;
import javax.crypto.KeyAgreement;
import javax.crypto.Mac;

/* loaded from: classes3.dex */
public final class k implements nl.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87515a;

    public Object a(String str, Provider provider) {
        switch (this.f87515a) {
            case 0:
                return provider == null ? Cipher.getInstance(str) : Cipher.getInstance(str, provider);
            case 1:
                return provider == null ? KeyAgreement.getInstance(str) : KeyAgreement.getInstance(str, provider);
            case 2:
                return provider == null ? KeyFactory.getInstance(str) : KeyFactory.getInstance(str, provider);
            case 3:
                return provider == null ? KeyPairGenerator.getInstance(str) : KeyPairGenerator.getInstance(str, provider);
            case 4:
                return provider == null ? Mac.getInstance(str) : Mac.getInstance(str, provider);
            case 5:
                return provider == null ? MessageDigest.getInstance(str) : MessageDigest.getInstance(str, provider);
            default:
                return provider == null ? Signature.getInstance(str) : Signature.getInstance(str, provider);
        }
    }

    public k(ol.a aVar, br.c cVar) {
        this.f87515a = 7;
    }
}
