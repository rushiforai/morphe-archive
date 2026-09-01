package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xy3 {
    public final ew5 a;
    public final boolean b;
    public final st2 c;
    public final String d;

    public xy3(ew5 ew5Var, boolean z, st2 st2Var, String str) {
        this.a = ew5Var;
        this.b = z;
        this.c = st2Var;
        this.d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xy3)) {
            return false;
        }
        xy3 xy3Var = (xy3) obj;
        return g76.L(this.a, xy3Var.a) && this.b == xy3Var.b && this.c == xy3Var.c && g76.L(this.d, xy3Var.d);
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31)) * 31;
        String str = this.d;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ExecuteResult(image=");
        sb.append(this.a);
        sb.append(", isSampled=");
        sb.append(this.b);
        sb.append(", dataSource=");
        sb.append(this.c);
        sb.append(", diskCacheKey=");
        return ev6.z(sb, this.d, ')');
    }
}
