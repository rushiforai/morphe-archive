package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gl6 extends yl6 {
    public final String a;
    public final int b;
    public final String c;

    public gl6(String str, int i) {
        str.getClass();
        this.a = str;
        this.b = i;
        if (i <= 0) {
            ay0.e("ArrayKClassValue must have at least one dimension. For regular X::class argument, use KClassValue.");
            throw null;
        }
        StringBuilder sb = new StringBuilder("ArrayKClassValue(");
        for (int i2 = 0; i2 < i; i2++) {
            sb.append("kotlin/Array<");
        }
        sb.append(this.a);
        int i3 = this.b;
        for (int i4 = 0; i4 < i3; i4++) {
            sb.append(">");
        }
        sb.append(")");
        this.c = sb.toString();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gl6)) {
            return false;
        }
        gl6 gl6Var = (gl6) obj;
        return g76.L(this.a, gl6Var.a) && this.b == gl6Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return this.c;
    }
}
