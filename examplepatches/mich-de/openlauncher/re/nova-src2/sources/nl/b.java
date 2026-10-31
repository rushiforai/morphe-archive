package nl;

import b.c0;
import el.g;
import java.security.InvalidAlgorithmParameterException;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class b extends g {

    /* renamed from: a, reason: collision with root package name */
    public final int f78359a;

    public b(int i5) {
        this.f78359a = i5;
    }

    public static b b(int i5) throws InvalidAlgorithmParameterException {
        if (i5 == 16 || i5 == 32) {
            return new b(i5);
        }
        throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 128-bit and 256-bit are supported", Integer.valueOf(i5 * 8)));
    }

    @Override // el.g
    public final boolean a() {
        return false;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof b) && ((b) obj).f78359a == this.f78359a;
    }

    public final int hashCode() {
        return Objects.hash(b.class, Integer.valueOf(this.f78359a));
    }

    public final String toString() {
        return c0.o(new StringBuilder("AesCmac PRF Parameters ("), this.f78359a, "-byte key)");
    }
}
