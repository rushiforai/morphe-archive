package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class li0 extends fd2 {
    public final mi0 a;
    public final List b;
    public final List c;
    public final Boolean d;
    public final ed2 e;
    public final List f;
    public final int g;

    public li0(mi0 mi0Var, List list, List list2, Boolean bool, ed2 ed2Var, List list3, int i) {
        this.a = mi0Var;
        this.b = list;
        this.c = list2;
        this.d = bool;
        this.e = ed2Var;
        this.f = list3;
        this.g = i;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof fd2)) {
            return false;
        }
        li0 li0Var = (li0) ((fd2) obj);
        if (!this.a.equals(li0Var.a)) {
            return false;
        }
        List list = li0Var.b;
        List list2 = this.b;
        if (list2 == null) {
            if (list != null) {
                return false;
            }
        } else if (!list2.equals(list)) {
            return false;
        }
        List list3 = li0Var.c;
        List list4 = this.c;
        if (list4 == null) {
            if (list3 != null) {
                return false;
            }
        } else if (!list4.equals(list3)) {
            return false;
        }
        Boolean bool = li0Var.d;
        Boolean bool2 = this.d;
        if (bool2 == null) {
            if (bool != null) {
                return false;
            }
        } else if (!bool2.equals(bool)) {
            return false;
        }
        ed2 ed2Var = li0Var.e;
        ed2 ed2Var2 = this.e;
        if (ed2Var2 == null) {
            if (ed2Var != null) {
                return false;
            }
        } else if (!ed2Var2.equals(ed2Var)) {
            return false;
        }
        List list5 = li0Var.f;
        List list6 = this.f;
        if (list6 == null) {
            if (list5 != null) {
                return false;
            }
        } else if (!list6.equals(list5)) {
            return false;
        }
        return this.g == li0Var.g;
    }

    public final int hashCode() {
        int iHashCode = (this.a.hashCode() ^ 1000003) * 1000003;
        List list = this.b;
        int iHashCode2 = (iHashCode ^ (list == null ? 0 : list.hashCode())) * 1000003;
        List list2 = this.c;
        int iHashCode3 = (iHashCode2 ^ (list2 == null ? 0 : list2.hashCode())) * 1000003;
        Boolean bool = this.d;
        int iHashCode4 = (iHashCode3 ^ (bool == null ? 0 : bool.hashCode())) * 1000003;
        ed2 ed2Var = this.e;
        int iHashCode5 = (iHashCode4 ^ (ed2Var == null ? 0 : ed2Var.hashCode())) * 1000003;
        List list3 = this.f;
        return this.g ^ ((iHashCode5 ^ (list3 != null ? list3.hashCode() : 0)) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Application{execution=");
        sb.append(this.a);
        sb.append(", customAttributes=");
        sb.append(this.b);
        sb.append(", internalKeys=");
        sb.append(this.c);
        sb.append(", background=");
        sb.append(this.d);
        sb.append(", currentProcessDetails=");
        sb.append(this.e);
        sb.append(", appProcessDetails=");
        sb.append(this.f);
        sb.append(", uiOrientation=");
        return ho2.H(sb, this.g, "}");
    }
}
