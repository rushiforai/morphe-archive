package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tx9 {
    public final boolean a;
    public final List b = ey3.a;

    public tx9(boolean z) {
        this.a = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tx9)) {
            return false;
        }
        tx9 tx9Var = (tx9) obj;
        return this.a == tx9Var.a && this.b.equals(tx9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a ? 1231 : 1237) * 31);
    }

    public final String toString() {
        return "PreReleaseInfo(isInvisible=" + this.a + ", poisoningFeatures=" + this.b + ')';
    }
}
