package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z80 {
    public static final z80 a = new z80();

    public final boolean a(Object obj, Object obj2) {
        if (this == obj2) {
            return true;
        }
        if (!(obj instanceof rx5) || !(obj2 instanceof rx5)) {
            return g76.L(obj, obj2);
        }
        rx5 rx5Var = (rx5) obj;
        rx5 rx5Var2 = (rx5) obj2;
        return g76.L(rx5Var.a, rx5Var2.a) && rx5Var.b.equals(rx5Var2.b) && rx5Var.e.equals(rx5Var2.e) && g76.L(rx5Var.q, rx5Var2.q) && rx5Var.r == rx5Var2.r && rx5Var.s == rx5Var2.s;
    }

    public final int b(Object obj) {
        if (!(obj instanceof rx5)) {
            if (obj != null) {
                return obj.hashCode();
            }
            return 0;
        }
        rx5 rx5Var = (rx5) obj;
        return rx5Var.s.hashCode() + ((rx5Var.r.hashCode() + ((rx5Var.q.hashCode() + ((rx5Var.e.hashCode() + ((rx5Var.b.hashCode() + (rx5Var.a.hashCode() * 31)) * 961)) * 961)) * 31)) * 31);
    }

    public final String toString() {
        return "AsyncImageModelEqualityDelegate.Default";
    }
}
