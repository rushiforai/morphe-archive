package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q1c implements fp3 {
    public final int a;
    public final int b;

    public q1c(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    @Override // defpackage.fp3
    public final void a(mu3 mu3Var) {
        boolean z = mu3Var.d != -1;
        h30 h30Var = mu3Var.a;
        if (z) {
            mu3Var.d = -1;
            mu3Var.e = -1;
        }
        int iV = iq7.v(this.a, 0, h30Var.l());
        int iV2 = iq7.v(this.b, 0, h30Var.l());
        if (iV != iV2) {
            if (iV < iV2) {
                mu3Var.e(iV, iV2);
            } else {
                mu3Var.e(iV2, iV);
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q1c)) {
            return false;
        }
        q1c q1cVar = (q1c) obj;
        return this.a == q1cVar.a && this.b == q1cVar.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SetComposingRegionCommand(start=");
        sb.append(this.a);
        sb.append(", end=");
        return km4.A(sb, this.b, ')');
    }
}
