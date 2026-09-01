package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class d41 {
    public final y05 a;
    public final n98 b;

    static {
        n98 n98Var = olc.f;
        y05 y05Var = y05.c;
        sgg.b0(n98Var);
    }

    public d41(y05 y05Var, n98 n98Var) {
        y05Var.getClass();
        this.a = y05Var;
        this.b = n98Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d41)) {
            return false;
        }
        d41 d41Var = (d41) obj;
        return this.a.equals(d41Var.a) && this.b.equals(d41Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a.hashCode() + 527) * 961);
    }

    public final String toString() {
        return tuc.K(this.a.a.a, '.', '/') + "/" + this.b;
    }
}
