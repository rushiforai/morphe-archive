package xo;

import com.nimbusds.jose.KeyLengthException;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.crypto.SecretKey;
import uo.i;

/* loaded from: classes4.dex */
public abstract class c extends a {

    /* renamed from: f, reason: collision with root package name */
    public static final Set f96208f;

    static {
        Set set = b.f96206a;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        linkedHashSet.add(i.f91446k);
        f96208f = Collections.unmodifiableSet(linkedHashSet);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public c(SecretKey secretKey) throws KeyLengthException {
        Set set;
        byte[] encoded = secretKey.getEncoded();
        int length = encoded == null ? 0 : encoded.length * 8;
        if (length == 0) {
            set = uo.e.f91425a;
        } else {
            set = (Set) b.f96207b.get(Integer.valueOf(length));
            if (set == null) {
                throw new KeyLengthException("The Content Encryption Key length must be 128 bits (16 bytes), 192 bits (24 bytes), 256 bits (32 bytes), 384 bits (48 bytes) or 512 bites (64 bytes)");
            }
        }
        super(f96208f, set, secretKey);
    }
}
