package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dyd {
    public final az4 a;
    public final d05 b;
    public final int c;
    public final int d;
    public final Object e;

    public dyd(az4 az4Var, d05 d05Var, int i, int i2, Object obj) {
        this.a = az4Var;
        this.b = d05Var;
        this.c = i;
        this.d = i2;
        this.e = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dyd)) {
            return false;
        }
        dyd dydVar = (dyd) obj;
        return g76.L(this.a, dydVar.a) && g76.L(this.b, dydVar.b) && this.c == dydVar.c && this.d == dydVar.d && g76.L(this.e, dydVar.e);
    }

    public final int hashCode() {
        az4 az4Var = this.a;
        int iHashCode = (((((((az4Var == null ? 0 : az4Var.hashCode()) * 31) + this.b.a) * 31) + this.c) * 31) + this.d) * 31;
        Object obj = this.e;
        return iHashCode + (obj != null ? obj.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TypefaceRequest(fontFamily=");
        sb.append(this.a);
        sb.append(", fontWeight=");
        sb.append(this.b);
        sb.append(", fontStyle=");
        String str = "Invalid";
        int i = this.c;
        sb.append((Object) (i == 0 ? "Normal" : i == 1 ? "Italic" : "Invalid"));
        sb.append(", fontSynthesis=");
        int i2 = this.d;
        if (i2 == 0) {
            str = "None";
        } else if (i2 == 1) {
            str = "Weight";
        } else if (i2 == 2) {
            str = "Style";
        } else if (i2 == 65535) {
            str = "All";
        }
        sb.append((Object) str);
        sb.append(", resourceLoaderCacheKey=");
        sb.append(this.e);
        sb.append(')');
        return sb.toString();
    }
}
