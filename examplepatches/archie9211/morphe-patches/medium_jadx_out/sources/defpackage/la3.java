package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class la3 {
    public final int a;
    public final Bundle b;
    public final ob8 c;

    public la3(int i, Bundle bundle, ob8 ob8Var, int i2) {
        ob8Var = (i2 & 4) != 0 ? qb8.V() : ob8Var;
        this.a = i;
        this.b = bundle;
        this.c = ob8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof la3)) {
            return false;
        }
        la3 la3Var = (la3) obj;
        return this.a == la3Var.a && this.b.equals(la3Var.b) && g76.L(this.c, la3Var.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a * 31)) * 31;
        ob8 ob8Var = this.c;
        return (iHashCode + (ob8Var == null ? 0 : ob8Var.hashCode())) * 31;
    }

    public final String toString() {
        return "Destination(resId=" + this.a + ", args=" + this.b + ", navOptions=" + this.c + ", navigatorExtras=null)";
    }
}
