package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ry5 {
    public static final ry5 g = new ry5(false, 0, true, 1, 1, h67.c);
    public final boolean a;
    public final int b;
    public final boolean c;
    public final int d;
    public final int e;
    public final h67 f;

    public ry5(boolean z, int i, boolean z2, int i2, int i3, h67 h67Var) {
        this.a = z;
        this.b = i;
        this.c = z2;
        this.d = i2;
        this.e = i3;
        this.f = h67Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ry5)) {
            return false;
        }
        ry5 ry5Var = (ry5) obj;
        return this.a == ry5Var.a && this.b == ry5Var.b && this.c == ry5Var.c && this.d == ry5Var.d && this.e == ry5Var.e && g76.L(this.f, ry5Var.f);
    }

    public final int hashCode() {
        return this.f.a.hashCode() + ((((((((((this.a ? 1231 : 1237) * 31) + this.b) * 31) + (this.c ? 1231 : 1237)) * 31) + this.d) * 31) + this.e) * 961);
    }

    public final String toString() {
        return "ImeOptions(singleLine=" + this.a + ", capitalization=" + ((Object) qk6.a(this.b)) + ", autoCorrect=" + this.c + ", keyboardType=" + ((Object) tk6.a(this.d)) + ", imeAction=" + ((Object) qy5.a(this.e)) + ", platformImeOptions=null, hintLocales=" + this.f + ')';
    }
}
