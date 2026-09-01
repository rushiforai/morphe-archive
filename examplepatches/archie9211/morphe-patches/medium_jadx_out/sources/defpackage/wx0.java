package defpackage;

import android.graphics.Rect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wx0 {
    public final int a;
    public final int b;
    public final int c;
    public final int d;

    static {
        new wx0(0, 0, 0, 0);
    }

    public wx0(int i, int i2, int i3, int i4) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = i4;
        if (i > i3) {
            ywb.g(ev6.v("Left must be less than or equal to right, left: ", i, i3, ", right: "));
            throw null;
        }
        if (i2 <= i4) {
            return;
        }
        ywb.g(ev6.v("top must be less than or equal to bottom, top: ", i2, i4, ", bottom: "));
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!wx0.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        wx0 wx0Var = (wx0) obj;
        return this.a == wx0Var.a && this.b == wx0Var.b && this.c == wx0Var.c && this.d == wx0Var.d;
    }

    public final int hashCode() {
        return (((((this.a * 31) + this.b) * 31) + this.c) * 31) + this.d;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(wx0.class.getSimpleName());
        sb.append(" { [");
        sb.append(this.a);
        sb.append(',');
        sb.append(this.b);
        sb.append(',');
        sb.append(this.c);
        sb.append(',');
        return ho2.H(sb, this.d, "] }");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public wx0(Rect rect) {
        this(rect.left, rect.top, rect.right, rect.bottom);
        rect.getClass();
    }
}
