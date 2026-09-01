package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nza {
    public final boolean a;
    public final eza b;
    public final mza c;
    public final iza d;
    public final dza e;
    public final boolean f;
    public final String g;

    public nza(boolean z, eza ezaVar, mza mzaVar, iza izaVar, dza dzaVar, boolean z2, String str) {
        ezaVar.getClass();
        str.getClass();
        this.a = z;
        this.b = ezaVar;
        this.c = mzaVar;
        this.d = izaVar;
        this.e = dzaVar;
        this.f = z2;
        this.g = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nza)) {
            return false;
        }
        nza nzaVar = (nza) obj;
        return this.a == nzaVar.a && this.b == nzaVar.b && this.c.equals(nzaVar.c) && this.d.equals(nzaVar.d) && this.e.equals(nzaVar.e) && this.f == nzaVar.f && g76.L(this.g, nzaVar.g);
    }

    public final int hashCode() {
        return this.g.hashCode() + ((((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + ((this.a ? 1231 : 1237) * 31)) * 31)) * 31)) * 31)) * 31) + (this.f ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(isRefreshing=");
        sb.append(this.a);
        sb.append(", selectedFilter=");
        sb.append(this.b);
        sb.append(", writers=");
        sb.append(this.c);
        sb.append(", tags=");
        sb.append(this.d);
        sb.append(", collections=");
        sb.append(this.e);
        sb.append(", hasReadContactsPermission=");
        sb.append(this.f);
        sb.append(", source=");
        return ka1.v(sb, this.g, ")");
    }
}
