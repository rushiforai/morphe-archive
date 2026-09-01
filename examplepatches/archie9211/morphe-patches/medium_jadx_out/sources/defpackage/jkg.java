package defpackage;

import j$.util.Objects;
import java.security.InvalidAlgorithmParameterException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jkg extends bzf {
    public final int a;

    public jkg(int i) {
        this.a = i;
    }

    public static jkg b(int i) throws InvalidAlgorithmParameterException {
        if (i == 16 || i == 32) {
            return new jkg(i);
        }
        throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 128-bit and 256-bit are supported", Integer.valueOf(i << 3)));
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return false;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof jkg) && ((jkg) obj).a == this.a;
    }

    public final int hashCode() {
        return Objects.hash(jkg.class, Integer.valueOf(this.a));
    }

    public final String toString() {
        return ev6.w("AesCmac PRF Parameters (", this.a, "-byte key)");
    }
}
