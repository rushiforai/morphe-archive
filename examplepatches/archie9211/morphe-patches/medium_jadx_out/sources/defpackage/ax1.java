package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ax1 implements fp3 {
    public final mx a;
    public final int b;

    public ax1(String str, int i) {
        this(new mx(str), i);
    }

    @Override // defpackage.fp3
    public final void a(mu3 mu3Var) {
        int i = mu3Var.d;
        mx mxVar = this.a;
        if (i != -1) {
            mu3Var.d(i, mu3Var.e, mxVar.b);
        } else {
            mu3Var.d(mu3Var.b, mu3Var.c, mxVar.b);
        }
        int i2 = mu3Var.b;
        int i3 = mu3Var.c;
        int i4 = i2 == i3 ? i3 : -1;
        int i5 = this.b;
        int iV = iq7.v(i5 > 0 ? (i4 + i5) - 1 : (i4 + i5) - mxVar.b.length(), 0, mu3Var.a.l());
        mu3Var.f(iV, iV);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ax1)) {
            return false;
        }
        ax1 ax1Var = (ax1) obj;
        return g76.L(this.a.b, ax1Var.a.b) && this.b == ax1Var.b;
    }

    public final int hashCode() {
        return (this.a.b.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CommitTextCommand(text='");
        sb.append(this.a.b);
        sb.append("', newCursorPosition=");
        return km4.A(sb, this.b, ')');
    }

    public ax1(mx mxVar, int i) {
        this.a = mxVar;
        this.b = i;
    }
}
