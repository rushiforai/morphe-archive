package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aza implements dza {
    public final int a;
    public final List b;
    public final boolean c;

    public aza(int i, List list, boolean z) {
        this.a = i;
        this.b = list;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aza)) {
            return false;
        }
        aza azaVar = (aza) obj;
        return this.a == azaVar.a && this.b.equals(azaVar.b) && this.c == azaVar.c;
    }

    public final int hashCode() {
        return wgd.p(this.a * 31, 31, this.b) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CollectionsLists(totalCount=");
        sb.append(this.a);
        sb.append(", collections=");
        sb.append(this.b);
        sb.append(", hasNextPage=");
        return lv8.t(sb, this.c, ")");
    }
}
