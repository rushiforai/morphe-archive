package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xub implements zub {
    public final az5 a;
    public final wub b;

    public xub(az5 az5Var, wub wubVar) {
        az5Var.getClass();
        wubVar.getClass();
        this.a = az5Var;
        this.b = wubVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xub)) {
            return false;
        }
        xub xubVar = (xub) obj;
        return g76.L(this.a, xubVar.a) && g76.L(this.b, xubVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "EmptySearch(searchHistory=" + this.a + ", tagsState=" + this.b + ")";
    }
}
