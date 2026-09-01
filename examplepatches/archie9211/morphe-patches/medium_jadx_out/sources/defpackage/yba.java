package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yba implements zba {
    public final List a;
    public final boolean b;

    public yba(List list, boolean z) {
        list.getClass();
        this.a = list;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yba)) {
            return false;
        }
        yba ybaVar = (yba) obj;
        return g76.L(this.a, ybaVar.a) && this.b == ybaVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Posts(posts=" + this.a + ", isLoadingMore=" + this.b + ")";
    }
}
