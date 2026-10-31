package xo;

import com.nimbusds.jose.KeyLengthException;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.crypto.SecretKey;
import uo.m;

/* loaded from: classes4.dex */
public abstract class f extends c3.b {

    /* renamed from: h, reason: collision with root package name */
    public static final Set f96214h;

    /* renamed from: g, reason: collision with root package name */
    public final SecretKey f96215g;

    static {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        linkedHashSet.add(m.f91476c);
        linkedHashSet.add(m.f91477d);
        linkedHashSet.add(m.f91478e);
        f96214h = Collections.unmodifiableSet(linkedHashSet);
    }

    public f(SecretKey secretKey) throws KeyLengthException {
        Set setUnmodifiableSet;
        if (secretKey.getEncoded() != null) {
            byte[] encoded = secretKey.getEncoded();
            int length = encoded == null ? 0 : encoded.length * 8;
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            if (length >= 256) {
                linkedHashSet.add(m.f91476c);
            }
            if (length >= 384) {
                linkedHashSet.add(m.f91477d);
            }
            if (length >= 512) {
                linkedHashSet.add(m.f91478e);
            }
            setUnmodifiableSet = Collections.unmodifiableSet(linkedHashSet);
        } else {
            setUnmodifiableSet = f96214h;
        }
        super(setUnmodifiableSet);
        if (secretKey.getEncoded() != null) {
            byte[] encoded2 = secretKey.getEncoded();
            if ((encoded2 != null ? encoded2.length * 8 : 0) < 256) {
                throw new KeyLengthException("The secret length must be at least 256 bits");
            }
        }
        this.f96215g = secretKey;
    }
}
