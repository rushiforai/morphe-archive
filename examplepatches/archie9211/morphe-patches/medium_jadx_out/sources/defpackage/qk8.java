package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qk8 extends sk8 {
    public final Long a;
    public final List b;

    public qk8(Long l, List list) {
        list.getClass();
        this.a = l;
        this.b = list;
    }

    @Override // defpackage.sk8
    public final Long a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qk8)) {
            return false;
        }
        qk8 qk8Var = (qk8) obj;
        return g76.L(this.a, qk8Var.a) && g76.L(this.b, qk8Var.b);
    }

    public final int hashCode() {
        Long l = this.a;
        return this.b.hashCode() + ((l == null ? 0 : l.hashCode()) * 31);
    }

    public final String toString() {
        return "Items(occurredAt=" + this.a + ", items=" + this.b + ")";
    }
}
