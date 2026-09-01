package defpackage;

import android.graphics.Insets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b36 {
    public static final b36 e = new b36(0, 0, 0, 0);
    public final int a;
    public final int b;
    public final int c;
    public final int d;

    public b36(int i, int i2, int i3, int i4) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = i4;
    }

    public static b36 a(b36 b36Var, b36 b36Var2) {
        return c(Math.max(b36Var.a, b36Var2.a), Math.max(b36Var.b, b36Var2.b), Math.max(b36Var.c, b36Var2.c), Math.max(b36Var.d, b36Var2.d));
    }

    public static b36 b(b36 b36Var, b36 b36Var2) {
        return c(Math.min(b36Var.a, b36Var2.a), Math.min(b36Var.b, b36Var2.b), Math.min(b36Var.c, b36Var2.c), Math.min(b36Var.d, b36Var2.d));
    }

    public static b36 c(int i, int i2, int i3, int i4) {
        return (i == 0 && i2 == 0 && i3 == 0 && i4 == 0) ? e : new b36(i, i2, i3, i4);
    }

    public static b36 d(Insets insets) {
        return c(insets.left, insets.top, insets.right, insets.bottom);
    }

    public final Insets e() {
        return nm.x(this.a, this.b, this.c, this.d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || b36.class != obj.getClass()) {
            return false;
        }
        b36 b36Var = (b36) obj;
        return this.d == b36Var.d && this.a == b36Var.a && this.c == b36Var.c && this.b == b36Var.b;
    }

    public final int hashCode() {
        return (((((this.a * 31) + this.b) * 31) + this.c) * 31) + this.d;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Insets{left=");
        sb.append(this.a);
        sb.append(", top=");
        sb.append(this.b);
        sb.append(", right=");
        sb.append(this.c);
        sb.append(", bottom=");
        return km4.A(sb, this.d, '}');
    }
}
