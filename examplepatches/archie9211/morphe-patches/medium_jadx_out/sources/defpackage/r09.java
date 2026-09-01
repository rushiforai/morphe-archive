package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r09 implements y09 {
    public final String a;
    public final int b;
    public final int c;

    public r09(String str, int i, int i2) {
        this.a = str;
        this.b = i;
        this.c = i2;
    }

    @Override // defpackage.y09
    public final Integer a() {
        return Integer.valueOf(this.c);
    }

    @Override // defpackage.y09
    public final Integer b() {
        return Integer.valueOf(this.b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r09)) {
            return false;
        }
        r09 r09Var = (r09) obj;
        return this.a.equals(r09Var.a) && this.b == r09Var.b && this.c == r09Var.c;
    }

    @Override // defpackage.y09
    public final Object getData() {
        return null;
    }

    @Override // defpackage.y09
    public final String getParagraphName() {
        return this.a;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + this.b) * 31) + this.c;
    }

    public final String toString() {
        return ho2.H(y30.t(this.b, "Empty(paragraphName=", this.a, ", width=", ", height="), this.c, ")");
    }
}
