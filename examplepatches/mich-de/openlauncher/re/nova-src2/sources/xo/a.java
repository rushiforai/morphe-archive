package xo;

import com.nimbusds.jose.JOSEException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: e, reason: collision with root package name */
    public static final Set f96201e = Collections.unmodifiableSet(new HashSet(Arrays.asList("AES", "ChaCha20")));

    /* renamed from: a, reason: collision with root package name */
    public final Set f96202a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f96203b;

    /* renamed from: c, reason: collision with root package name */
    public final ap.a f96204c = new ap.a(0);

    /* renamed from: d, reason: collision with root package name */
    public final SecretKey f96205d;

    public a(Set set, Set set2, SecretKey secretKey) {
        if (set == null) {
            throw new IllegalArgumentException("The supported JWE algorithm set must not be null");
        }
        this.f96202a = Collections.unmodifiableSet(set);
        if (set2 == null) {
            throw new IllegalArgumentException("The supported encryption methods must not be null");
        }
        this.f96203b = set2;
        if (secretKey != null && set.size() > 1 && (secretKey.getAlgorithm() == null || !f96201e.contains(secretKey.getAlgorithm()))) {
            throw new IllegalArgumentException("The algorithm of the content encryption key (CEK) must be AES or ChaCha20");
        }
        this.f96205d = secretKey;
    }

    public final SecretKey b(uo.f fVar) throws JOSEException {
        SecretKey secretKey = this.f96205d;
        if (secretKey != null || fVar == null) {
            return secretKey;
        }
        SecureRandom secureRandom = new SecureRandom();
        Set set = b.f96206a;
        if (!set.contains(fVar)) {
            throw new JOSEException(e.k(fVar, set));
        }
        byte[] bArr = new byte[fVar.f91435c / 8];
        secureRandom.nextBytes(bArr);
        return new SecretKeySpec(bArr, "AES");
    }
}
