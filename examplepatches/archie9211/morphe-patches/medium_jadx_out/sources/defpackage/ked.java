package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ked implements led {
    public final String a;
    public final List b;
    public final boolean c;

    public ked(String str, List list, boolean z) {
        list.getClass();
        this.a = str;
        this.b = list;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ked)) {
            return false;
        }
        ked kedVar = (ked) obj;
        return this.a.equals(kedVar.a) && g76.L(this.b, kedVar.b) && this.c == kedVar.c;
    }

    public final int hashCode() {
        return wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(b09.E("WhoToFollow(tagName=", this.a, ", items=", ", isRefreshing=", this.b), this.c, ")");
    }
}
