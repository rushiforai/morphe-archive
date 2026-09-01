package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pu9 {
    public final List a;
    public final List b;
    public final boolean c;

    public pu9(List list, List list2) {
        list.getClass();
        list2.getClass();
        this.a = list;
        this.b = list2;
        this.c = list.isEmpty() && list2.isEmpty();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pu9)) {
            return false;
        }
        pu9 pu9Var = (pu9) obj;
        return g76.L(this.a, pu9Var.a) && g76.L(this.b, pu9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "RecircViewModels(beforeAuthorFooterRecircViewModels=" + this.a + ", afterAuthorFooterRecircViewModels=" + this.b + ")";
    }
}
