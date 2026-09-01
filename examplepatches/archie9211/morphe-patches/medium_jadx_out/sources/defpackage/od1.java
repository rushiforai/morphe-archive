package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class od1 implements rd1 {
    public final String a;
    public final List b;

    public od1(String str, List list) {
        str.getClass();
        list.getClass();
        this.a = str;
        this.b = list;
    }

    @Override // defpackage.rd1
    public final String a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof od1)) {
            return false;
        }
        od1 od1Var = (od1) obj;
        return g76.L(this.a, od1Var.a) && g76.L(this.b, od1Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ka1.s("ItemsRemoved(catalogId=", this.a, ", catalogItemIds=", ")", this.b);
    }
}
