package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xj8 implements qzd {
    public final String a;
    public final xi8 b;

    public xj8(String str, xi8 xi8Var) {
        this.a = str;
        this.b = xi8Var;
    }

    public static xj8 b(xj8 xj8Var, xi8 xi8Var) {
        String str = xj8Var.a;
        xi8Var.getClass();
        return new xj8(str, xi8Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xj8)) {
            return false;
        }
        xj8 xj8Var = (xj8) obj;
        return this.a.equals(xj8Var.a) && this.b.equals(xj8Var.b);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.a;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NotificationUiModel(key=" + this.a + ", notification=" + this.b + ")";
    }
}
