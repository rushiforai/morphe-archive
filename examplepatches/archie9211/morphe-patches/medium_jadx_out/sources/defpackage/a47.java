package defpackage;

import com.medium.android.core.models.CatalogName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a47 extends c47 {
    public final String a;
    public final CatalogName b;
    public final boolean c;
    public final boolean d;

    public a47(String str, CatalogName catalogName, boolean z, boolean z2) {
        str.getClass();
        catalogName.getClass();
        this.a = str;
        this.b = catalogName;
        this.c = z;
        this.d = z2;
    }

    @Override // defpackage.c47
    public final String a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a47)) {
            return false;
        }
        a47 a47Var = (a47) obj;
        return g76.L(this.a, a47Var.a) && g76.L(this.b, a47Var.b) && this.c == a47Var.c && this.d == a47Var.d;
    }

    public final int hashCode() {
        return ((((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Catalog(id=");
        sb.append(this.a);
        sb.append(", name=");
        sb.append(this.b);
        sb.append(", isChecked=");
        return b09.C(sb, this.c, ", isPublic=", this.d, ")");
    }
}
