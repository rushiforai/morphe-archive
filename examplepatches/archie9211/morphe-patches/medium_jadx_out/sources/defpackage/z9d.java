package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z9d implements cad {
    public final String a;
    public final List b;
    public final boolean c;
    public final boolean d;

    public z9d(String str, List list, boolean z, boolean z2) {
        this.a = str;
        this.b = list;
        this.c = z;
        this.d = z2;
    }

    @Override // defpackage.cad
    public final boolean a() {
        return this.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z9d)) {
            return false;
        }
        z9d z9dVar = (z9d) obj;
        return this.a.equals(z9dVar.a) && this.b.equals(z9dVar.b) && this.c == z9dVar.c && this.d == z9dVar.d;
    }

    public final int hashCode() {
        return ((wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return b09.C(b09.E("Content(tagName=", this.a, ", posts=", ", isLoadingMore=", this.b), this.c, ", isRefreshing=", this.d, ")");
    }
}
