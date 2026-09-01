package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r1c implements fp3 {
    public final mx a;
    public final int b;

    public r1c(String str, int i) {
        this.a = new mx(str);
        this.b = i;
    }

    @Override // defpackage.fp3
    public final void a(mu3 mu3Var) {
        String str = this.a.b;
        int i = mu3Var.d;
        if (i != -1) {
            mu3Var.d(i, mu3Var.e, str);
            if (str.length() > 0) {
                mu3Var.e(i, str.length() + i);
            }
        } else {
            int i2 = mu3Var.b;
            mu3Var.d(i2, mu3Var.c, str);
            if (str.length() > 0) {
                mu3Var.e(i2, str.length() + i2);
            }
        }
        int i3 = mu3Var.b;
        int i4 = mu3Var.c;
        int i5 = i3 == i4 ? i4 : -1;
        int i6 = this.b;
        int iV = iq7.v(i6 > 0 ? (i5 + i6) - 1 : (i5 + i6) - str.length(), 0, mu3Var.a.l());
        mu3Var.f(iV, iV);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r1c)) {
            return false;
        }
        r1c r1cVar = (r1c) obj;
        return g76.L(this.a.b, r1cVar.a.b) && this.b == r1cVar.b;
    }

    public final int hashCode() {
        return (this.a.b.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SetComposingTextCommand(text='");
        sb.append(this.a.b);
        sb.append("', newCursorPosition=");
        return km4.A(sb, this.b, ')');
    }
}
