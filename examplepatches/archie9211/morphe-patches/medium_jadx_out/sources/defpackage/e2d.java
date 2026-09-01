package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e2d {
    public final boolean a;
    public final List b;
    public final d2d c;
    public final c2d d;
    public final String e;

    public e2d(boolean z, List list, d2d d2dVar, c2d c2dVar, String str) {
        list.getClass();
        d2dVar.getClass();
        str.getClass();
        this.a = z;
        this.b = list;
        this.c = d2dVar;
        this.d = c2dVar;
        this.e = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e2d)) {
            return false;
        }
        e2d e2dVar = (e2d) obj;
        return this.a == e2dVar.a && this.b.equals(e2dVar.b) && this.c == e2dVar.c && this.d.equals(e2dVar.d) && g76.L(this.e, e2dVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + wgd.p((this.a ? 1231 : 1237) * 31, 31, this.b)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(isRefreshing=");
        sb.append(this.a);
        sb.append(", filters=");
        sb.append(this.b);
        sb.append(", selectedFilter=");
        sb.append(this.c);
        sb.append(", content=");
        sb.append(this.d);
        sb.append(", source=");
        return ka1.v(sb, this.e, ")");
    }
}
