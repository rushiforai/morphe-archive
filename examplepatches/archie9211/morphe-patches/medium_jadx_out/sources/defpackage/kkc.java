package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kkc implements ne4 {
    public final yx5 a;
    public final String b;
    public final st2 c;

    public kkc(yx5 yx5Var, String str, st2 st2Var) {
        this.a = yx5Var;
        this.b = str;
        this.c = st2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kkc)) {
            return false;
        }
        kkc kkcVar = (kkc) obj;
        return g76.L(this.a, kkcVar.a) && g76.L(this.b, kkcVar.b) && this.c == kkcVar.c;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        return "SourceFetchResult(source=" + this.a + ", mimeType=" + this.b + ", dataSource=" + this.c + ')';
    }
}
