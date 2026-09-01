package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kj0 extends s54 {
    public final byte[] a;
    public final byte[] b;

    public kj0(byte[] bArr, byte[] bArr2) {
        this.a = bArr;
        this.b = bArr2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof s54) {
            s54 s54Var = (s54) obj;
            boolean z = s54Var instanceof kj0;
            kj0 kj0Var = (kj0) s54Var;
            if (Arrays.equals(this.a, z ? kj0Var.a : kj0Var.a)) {
                kj0 kj0Var2 = (kj0) s54Var;
                if (Arrays.equals(this.b, z ? kj0Var2.b : kj0Var2.b)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) ^ ((Arrays.hashCode(this.a) ^ 1000003) * 1000003);
    }

    public final String toString() {
        return "ExperimentIds{clearBlob=" + Arrays.toString(this.a) + ", encryptedBlob=" + Arrays.toString(this.b) + "}";
    }
}
