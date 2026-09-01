package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s29 implements ix {
    public final int a;
    public final int b;
    public final long c;
    public final yid d;
    public final pa9 e;
    public final lz6 f;
    public final int g;
    public final int h;
    public final zjd i;

    public s29(int i, int i2, long j, yid yidVar, pa9 pa9Var, lz6 lz6Var, int i3, int i4, zjd zjdVar) {
        this.a = i;
        this.b = i2;
        this.c = j;
        this.d = yidVar;
        this.e = pa9Var;
        this.f = lz6Var;
        this.g = i3;
        this.h = i4;
        this.i = zjdVar;
        rkd[] rkdVarArr = qkd.b;
        if (qkd.a(j, qkd.c)) {
            return;
        }
        if (qkd.c(j) >= 0.0f) {
            return;
        }
        c26.c("lineHeight can't be negative (" + qkd.c(j) + ')');
    }

    public final s29 a(s29 s29Var) {
        return s29Var == null ? this : t29.a(this, s29Var.a, s29Var.b, s29Var.c, s29Var.d, s29Var.e, s29Var.f, s29Var.g, s29Var.h, s29Var.i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s29)) {
            return false;
        }
        s29 s29Var = (s29) obj;
        return this.a == s29Var.a && this.b == s29Var.b && qkd.a(this.c, s29Var.c) && g76.L(this.d, s29Var.d) && g76.L(this.e, s29Var.e) && g76.L(this.f, s29Var.f) && this.g == s29Var.g && this.h == s29Var.h && g76.L(this.i, s29Var.i);
    }

    public final int hashCode() {
        int i = ((this.a * 31) + this.b) * 31;
        rkd[] rkdVarArr = qkd.b;
        int iN = (ev6.n(this.c) + i) * 31;
        yid yidVar = this.d;
        int iHashCode = (iN + (yidVar != null ? yidVar.hashCode() : 0)) * 31;
        pa9 pa9Var = this.e;
        int iHashCode2 = (iHashCode + (pa9Var != null ? pa9Var.hashCode() : 0)) * 31;
        lz6 lz6Var = this.f;
        int iHashCode3 = (((((iHashCode2 + (lz6Var != null ? lz6Var.hashCode() : 0)) * 31) + this.g) * 31) + this.h) * 31;
        zjd zjdVar = this.i;
        return iHashCode3 + (zjdVar != null ? zjdVar.hashCode() : 0);
    }

    public final String toString() {
        return "ParagraphStyle(textAlign=" + ((Object) jgd.a(this.a)) + ", textDirection=" + ((Object) qhd.a(this.b)) + ", lineHeight=" + ((Object) qkd.e(this.c)) + ", textIndent=" + this.d + ", platformStyle=" + this.e + ", lineHeightStyle=" + this.f + ", lineBreak=" + ((Object) bz6.a(this.g)) + ", hyphens=" + ((Object) tt5.a(this.h)) + ", textMotion=" + this.i + ')';
    }
}
