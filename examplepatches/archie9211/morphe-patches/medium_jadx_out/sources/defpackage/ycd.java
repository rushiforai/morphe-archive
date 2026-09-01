package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ycd {
    public final ncd a;
    public final rcd b;
    public final xcd c;
    public final boolean d;

    public ycd(ncd ncdVar, rcd rcdVar, xcd xcdVar, boolean z) {
        ncdVar.getClass();
        rcdVar.getClass();
        xcdVar.getClass();
        this.a = ncdVar;
        this.b = rcdVar;
        this.c = xcdVar;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ycd)) {
            return false;
        }
        ycd ycdVar = (ycd) obj;
        return g76.L(this.a, ycdVar.a) && g76.L(this.b, ycdVar.b) && g76.L(this.c, ycdVar.c) && this.d == ycdVar.d;
    }

    public final int hashCode() {
        return ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return "ViewState(relatedTags=" + this.a + ", tagDetail=" + this.b + ", tagSections=" + this.c + ", isRefreshing=" + this.d + ")";
    }
}
