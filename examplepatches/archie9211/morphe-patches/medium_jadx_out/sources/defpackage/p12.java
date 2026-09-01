package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class p12 {
    public final int a;
    public final Integer b;

    public p12(int i, ep7 ep7Var, Integer num) {
        this.a = i;
        this.b = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p12)) {
            return false;
        }
        p12 p12Var = (p12) obj;
        return this.a == p12Var.a && g76.L(null, null) && g76.L(this.b, p12Var.b);
    }

    public final int hashCode() {
        int i = ((this.a * 31) + 0) * 31;
        Integer num = this.b;
        return i + (num != null ? num.hashCode() : 0);
    }

    public final String toString() {
        return CspinKvYN.iCKiPsFDfM + this.a + ", sourceInfo=" + ((Object) null) + ", groupOffset=" + this.b + ')';
    }
}
