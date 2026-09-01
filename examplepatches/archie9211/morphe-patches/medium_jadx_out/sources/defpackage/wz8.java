package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wz8 {
    public final List a;
    public final Object b;

    public wz8(Object obj, List list) {
        list.getClass();
        this.a = list;
        this.b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wz8)) {
            return false;
        }
        wz8 wz8Var = (wz8) obj;
        return g76.L(this.a, wz8Var.a) && g76.L(this.b, wz8Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Object obj = this.b;
        return iHashCode + (obj == null ? 0 : obj.hashCode());
    }

    public final String toString() {
        return "Page(items=" + this.a + ", nextPagePagination=" + this.b + ")";
    }
}
