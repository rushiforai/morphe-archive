package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class odf implements sdf {
    public final je a;
    public final List b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public odf(je jeVar, List list, boolean z, boolean z2, boolean z3) {
        this.a = jeVar;
        this.b = list;
        this.c = z;
        this.d = z2;
        this.e = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof odf)) {
            return false;
        }
        odf odfVar = (odf) obj;
        return this.a.equals(odfVar.a) && this.b.equals(odfVar.b) && this.c == odfVar.c && this.d == odfVar.d && this.e == odfVar.e;
    }

    public final int hashCode() {
        return ((((wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Entities(allEntitiesPillUiModel=");
        sb.append(this.a);
        sb.append(", entities=");
        sb.append(this.b);
        sb.append(", hasMoreEntities=");
        ho2.R(sb, this.c, ", isLoadingMoreEntities=", this.d, ", isRefreshing=");
        return lv8.t(sb, this.e, ")");
    }
}
