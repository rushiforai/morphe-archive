package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qy3 {
    public final wy3 a;
    public final byte[] b;

    public qy3(wy3 wy3Var, byte[] bArr) {
        if (wy3Var == null) {
            z72.c("encoding is null");
            throw null;
        }
        if (bArr == null) {
            z72.c("bytes is null");
            throw null;
        }
        this.a = wy3Var;
        this.b = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qy3)) {
            return false;
        }
        qy3 qy3Var = (qy3) obj;
        if (this.a.equals(qy3Var.a)) {
            return Arrays.equals(this.b, qy3Var.b);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }

    public final String toString() {
        return "EncodedPayload{encoding=" + this.a + ", bytes=[...]}";
    }
}
