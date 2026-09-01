package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z53 implements fp3 {
    public final int a;
    public final int b;

    public z53(int i, int i2) {
        this.a = i;
        this.b = i2;
        if (i >= 0 && i2 >= 0) {
            return;
        }
        c26.a("Expected lengthBeforeCursor and lengthAfterCursor to be non-negative, were " + i + " and " + i2 + " respectively.");
    }

    @Override // defpackage.fp3
    public final void a(mu3 mu3Var) {
        int i = mu3Var.c;
        h30 h30Var = mu3Var.a;
        int i2 = this.b;
        int iL = i + i2;
        if (((i ^ iL) & (i2 ^ iL)) < 0) {
            iL = h30Var.l();
        }
        mu3Var.a(mu3Var.c, Math.min(iL, h30Var.l()));
        int i3 = mu3Var.b;
        int i4 = this.a;
        int i5 = i3 - i4;
        if (((i4 ^ i3) & (i3 ^ i5)) < 0) {
            i5 = 0;
        }
        mu3Var.a(Math.max(0, i5), mu3Var.b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z53)) {
            return false;
        }
        z53 z53Var = (z53) obj;
        return this.a == z53Var.a && this.b == z53Var.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DeleteSurroundingTextCommand(lengthBeforeCursor=");
        sb.append(this.a);
        sb.append(", lengthAfterCursor=");
        return km4.A(sb, this.b, ')');
    }
}
