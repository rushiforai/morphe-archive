package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xdf implements ydf {
    public final wdf a;
    public final List b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public xdf(wdf wdfVar, List list, boolean z, boolean z2, boolean z3) {
        wdfVar.getClass();
        this.a = wdfVar;
        this.b = list;
        this.c = z;
        this.d = z2;
        this.e = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xdf)) {
            return false;
        }
        xdf xdfVar = (xdf) obj;
        return this.a == xdfVar.a && this.b.equals(xdfVar.b) && this.c == xdfVar.c && this.d == xdfVar.d && this.e == xdfVar.e;
    }

    public final int hashCode() {
        return ((((wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Tags(selectedTagSort=");
        sb.append(this.a);
        sb.append(", tags=");
        sb.append(this.b);
        sb.append(", hasMoreTags=");
        ho2.R(sb, this.c, ", isLoadingMoreTags=", this.d, ", isRefreshing=");
        return lv8.t(sb, this.e, ")");
    }
}
