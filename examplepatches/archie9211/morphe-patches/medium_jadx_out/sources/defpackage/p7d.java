package defpackage;

import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p7d {
    public final String a;
    public final String b;
    public final boolean c;
    public final int d;
    public final String e;
    public final int f;
    public final int g;

    public p7d(String str, String str2, boolean z, int i, String str3, int i2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = i;
        this.e = str3;
        this.f = i2;
        String upperCase = str2.toUpperCase(Locale.ROOT);
        upperCase.getClass();
        this.g = muc.Q(upperCase, "INT", false) ? 3 : (muc.Q(upperCase, "CHAR", false) || muc.Q(upperCase, "CLOB", false) || muc.Q(upperCase, "TEXT", false)) ? 2 : muc.Q(upperCase, "BLOB", false) ? 5 : (muc.Q(upperCase, "REAL", false) || muc.Q(upperCase, "FLOA", false) || muc.Q(upperCase, "DOUB", false)) ? 4 : 1;
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (obj instanceof p7d) {
                boolean z = this.d > 0;
                p7d p7dVar = (p7d) obj;
                int i = p7dVar.f;
                if (z == (p7dVar.d > 0) && g76.L(this.a, p7dVar.a) && this.c == p7dVar.c) {
                    String str = p7dVar.e;
                    int i2 = this.f;
                    String str2 = this.e;
                    if ((i2 != 1 || i != 2 || str2 == null || mk7.p(str2, str)) && ((i2 != 2 || i != 1 || str == null || mk7.p(str, str2)) && ((i2 == 0 || i2 != i || (str2 == null ? str == null : mk7.p(str2, str))) && this.g == p7dVar.g))) {
                    }
                }
            }
            return false;
        }
        return true;
    }

    public final int hashCode() {
        return (((((this.a.hashCode() * 31) + this.g) * 31) + (this.c ? 1231 : 1237)) * 31) + this.d;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("\n            |Column {\n            |   name = '");
        sb.append(this.a);
        sb.append("',\n            |   type = '");
        sb.append(this.b);
        sb.append("',\n            |   affinity = '");
        sb.append(this.g);
        sb.append("',\n            |   notNull = '");
        sb.append(this.c);
        sb.append("',\n            |   primaryKeyPosition = '");
        sb.append(this.d);
        sb.append("',\n            |   defaultValue = '");
        String str = this.e;
        if (str == null) {
            str = "undefined";
        }
        sb.append(str);
        sb.append("'\n            |}\n        ");
        return nuc.A(nuc.C(sb.toString()));
    }
}
