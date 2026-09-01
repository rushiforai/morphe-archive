package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cge implements ege {
    public final List a;
    public final boolean b;

    public cge(List list, boolean z) {
        this.a = list;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cge)) {
            return false;
        }
        cge cgeVar = (cge) obj;
        return this.a.equals(cgeVar.a) && this.b == cgeVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Success(books=" + this.a + ", isRefreshing=" + this.b + ")";
    }
}
