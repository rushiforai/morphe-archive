package defpackage;

import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class a63 implements fp3 {
    public final int a;
    public final int b;

    public a63(int i, int i2) {
        this.a = i;
        this.b = i2;
        if (i >= 0 && i2 >= 0) {
            return;
        }
        c26.a("Expected lengthBeforeCursor and lengthAfterCursor to be non-negative, were " + i + " and " + i2 + " respectively.");
    }

    @Override // defpackage.fp3
    public final void a(mu3 mu3Var) {
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i2 < this.a) {
                int i4 = i3 + 1;
                int i5 = mu3Var.b;
                if (i5 <= i4) {
                    i3 = i5;
                    break;
                } else {
                    i3 = (Character.isHighSurrogate(mu3Var.b((i5 - i4) + (-1))) && Character.isLowSurrogate(mu3Var.b(mu3Var.b - i4))) ? i3 + 2 : i4;
                    i2++;
                }
            } else {
                break;
            }
        }
        int iL = 0;
        while (true) {
            if (i >= this.b) {
                break;
            }
            int i6 = iL + 1;
            int i7 = mu3Var.c;
            h30 h30Var = mu3Var.a;
            if (i7 + i6 >= h30Var.l()) {
                iL = h30Var.l() - mu3Var.c;
                break;
            } else {
                iL = (Character.isHighSurrogate(mu3Var.b((mu3Var.c + i6) + (-1))) && Character.isLowSurrogate(mu3Var.b(mu3Var.c + i6))) ? iL + 2 : i6;
                i++;
            }
        }
        int i8 = mu3Var.c;
        mu3Var.a(i8, iL + i8);
        int i9 = mu3Var.b;
        mu3Var.a(i9 - i3, i9);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a63)) {
            return false;
        }
        a63 a63Var = (a63) obj;
        return this.a == a63Var.a && this.b == a63Var.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DeleteSurroundingTextInCodePointsCommand(lengthBeforeCursor=");
        sb.append(this.a);
        sb.append(gYpYQDQkhfs.ResvZKWeiQ);
        return km4.A(sb, this.b, ')');
    }
}
