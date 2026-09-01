package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y86 {
    public final wl8 a;
    public final Collection b;
    public final boolean c;
    public final boolean d;

    public y86(wl8 wl8Var, Collection collection, int i) {
        this(wl8Var, collection, wl8Var.a == vl8.NOT_NULL, (i & 8) == 0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y86)) {
            return false;
        }
        y86 y86Var = (y86) obj;
        return g76.L(this.a, y86Var.a) && g76.L(this.b, y86Var.b) && this.c == y86Var.c && this.d == y86Var.d;
    }

    public final int hashCode() {
        return ((((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(ziYqbdHrAXvj.BxcHjPykL);
        sb.append(this.a);
        sb.append(", qualifierApplicabilityTypes=");
        sb.append(this.b);
        sb.append(", definitelyNotNull=");
        sb.append(this.c);
        sb.append(", preferQualifierOverBound=");
        return ev6.A(sb, this.d, ')');
    }

    public y86(wl8 wl8Var, Collection collection, boolean z, boolean z2) {
        collection.getClass();
        this.a = wl8Var;
        this.b = collection;
        this.c = z;
        this.d = z2;
    }
}
