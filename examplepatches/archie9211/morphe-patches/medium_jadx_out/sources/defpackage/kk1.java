package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kk1 {
    public static final jk1 b = new jk1();
    public final Object a;

    public /* synthetic */ kk1(Object obj) {
        this.a = obj;
    }

    public static final Object a(Object obj) {
        if (obj instanceof jk1) {
            return null;
        }
        return obj;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof kk1) {
            return g76.L(this.a, ((kk1) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.a;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        Object obj = this.a;
        if (obj instanceof ik1) {
            return ((ik1) obj).toString();
        }
        return "Value(" + obj + ')';
    }
}
