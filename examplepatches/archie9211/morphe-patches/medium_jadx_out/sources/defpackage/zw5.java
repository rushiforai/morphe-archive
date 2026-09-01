package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zw5 implements ne4 {
    public final ew5 a;
    public final boolean b;
    public final st2 c;

    public zw5(ew5 ew5Var, boolean z, st2 st2Var) {
        this.a = ew5Var;
        this.b = z;
        this.c = st2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zw5)) {
            return false;
        }
        zw5 zw5Var = (zw5) obj;
        return this.a.equals(zw5Var.a) && this.b == zw5Var.b && this.c == zw5Var.c;
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "ImageFetchResult(image=" + this.a + ", isSampled=" + this.b + ", dataSource=" + this.c + ')';
    }
}
