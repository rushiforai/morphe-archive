package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qsa {
    public static final byte[] c = new byte[0];
    public final byte[] a;
    public final byte[] b;

    public qsa(byte[] bArr, byte[] bArr2) {
        bArr.getClass();
        bArr2.getClass();
        this.a = bArr;
        this.b = bArr2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!qsa.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        qsa qsaVar = (qsa) obj;
        return Arrays.equals(this.a, qsaVar.a) && Arrays.equals(this.b, qsaVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) + (Arrays.hashCode(this.a) * 31);
    }

    public final String toString() {
        return ev6.y("RawBatchEvent(data=", Arrays.toString(this.a), ", metadata=", Arrays.toString(this.b), ")");
    }
}
