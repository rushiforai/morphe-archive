package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ci0 extends tc2 {
    public final String a;
    public final byte[] b;

    public ci0(String str, byte[] bArr) {
        this.a = str;
        this.b = bArr;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof tc2)) {
            return false;
        }
        tc2 tc2Var = (tc2) obj;
        ci0 ci0Var = (ci0) tc2Var;
        if (this.a.equals(ci0Var.a)) {
            return Arrays.equals(this.b, tc2Var instanceof ci0 ? ((ci0) tc2Var).b : ci0Var.b);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }

    public final String toString() {
        return "File{filename=" + this.a + ", contents=" + Arrays.toString(this.b) + "}";
    }
}
