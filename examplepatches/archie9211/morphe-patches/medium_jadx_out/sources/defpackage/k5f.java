package defpackage;

import android.graphics.Rect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k5f {
    public final wx0 a;
    public final float b;

    public k5f(Rect rect, float f) {
        this.a = new wx0(rect);
        this.b = f;
    }

    public final Rect a() {
        wx0 wx0Var = this.a;
        wx0Var.getClass();
        return new Rect(wx0Var.a, wx0Var.b, wx0Var.c, wx0Var.d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!k5f.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        k5f k5fVar = (k5f) obj;
        return g76.L(this.a, k5fVar.a) && this.b == k5fVar.b;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (this.a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("WindowMetrics(_bounds=");
        sb.append(this.a);
        sb.append(", density=");
        return lv8.s(sb, this.b, ')');
    }

    public k5f(wx0 wx0Var, float f) {
        this.a = wx0Var;
        this.b = f;
    }
}
