package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z98 {
    public final int a;
    public ob8 b = null;
    public Bundle c = null;

    public z98(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z98)) {
            return false;
        }
        z98 z98Var = (z98) obj;
        if (this.a != z98Var.a || !g76.L(this.b, z98Var.b)) {
            return false;
        }
        Bundle bundle = this.c;
        Bundle bundle2 = z98Var.c;
        if (g76.L(bundle, bundle2)) {
            return true;
        }
        return (bundle == null || bundle2 == null || !yo7.p(bundle, bundle2)) ? false : true;
    }

    public final int hashCode() {
        int i = this.a * 31;
        ob8 ob8Var = this.b;
        int iHashCode = i + (ob8Var != null ? ob8Var.hashCode() : 0);
        Bundle bundle = this.c;
        if (bundle != null) {
            return yo7.q(bundle) + (iHashCode * 31);
        }
        return iHashCode;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(z98.class.getSimpleName());
        sb.append("(0x");
        sb.append(Integer.toHexString(this.a));
        sb.append(")");
        if (this.b != null) {
            sb.append(" navOptions=");
            sb.append(this.b);
        }
        return sb.toString();
    }
}
