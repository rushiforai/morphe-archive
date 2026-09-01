package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u4b {
    public final Map a;
    public final List b;

    public u4b(Map map, List list) {
        this.a = map;
        this.b = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u4b)) {
            return false;
        }
        u4b u4bVar = (u4b) obj;
        return this.a.equals(u4bVar.a) && this.b.equals(u4bVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ReorderSubmission(movements=" + this.a + ", items=" + this.b + ")";
    }
}
