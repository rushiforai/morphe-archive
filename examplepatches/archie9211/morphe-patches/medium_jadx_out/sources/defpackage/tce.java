package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tce implements wce {
    public final boolean a;
    public final az5 b;
    public final az5 c;
    public final boolean d;
    public final String e;

    public tce(boolean z, az5 az5Var, az5 az5Var2, boolean z2, String str) {
        az5Var.getClass();
        az5Var2.getClass();
        this.a = z;
        this.b = az5Var;
        this.c = az5Var2;
        this.d = z2;
        this.e = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tce)) {
            return false;
        }
        tce tceVar = (tce) obj;
        return this.a == tceVar.a && g76.L(this.b, tceVar.b) && g76.L(this.c, tceVar.c) && this.d == tceVar.d && this.e.equals(tceVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((ka1.b(this.c, ka1.b(this.b, (this.a ? 1231 : 1237) * 31, 31), 31) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Catalogs(showGetStartedCard=");
        sb.append(this.a);
        sb.append(", predefinedUiModels=");
        sb.append(this.b);
        sb.append(", plainUiModels=");
        sb.append(this.c);
        sb.append(", isRefreshing=");
        sb.append(this.d);
        sb.append(", source=");
        return ka1.v(sb, this.e, ")");
    }
}
