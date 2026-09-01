package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s67 {
    public final Object a;
    public final m45 b;

    public s67(Object obj, m45 m45Var) {
        this.a = obj;
        this.b = m45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && s67.class == obj.getClass() && this.a.equals(((s67) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
