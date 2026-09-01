package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t1c implements fp3 {
    public final int a;
    public final int b;

    public t1c(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    @Override // defpackage.fp3
    public final void a(mu3 mu3Var) {
        int iV = iq7.v(this.a, 0, mu3Var.a.l());
        int iV2 = iq7.v(this.b, 0, mu3Var.a.l());
        if (iV < iV2) {
            mu3Var.f(iV, iV2);
        } else {
            mu3Var.f(iV2, iV);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t1c)) {
            return false;
        }
        t1c t1cVar = (t1c) obj;
        return this.a == t1cVar.a && this.b == t1cVar.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SetSelectionCommand(start=");
        sb.append(this.a);
        sb.append(", end=");
        return km4.A(sb, this.b, ')');
    }
}
