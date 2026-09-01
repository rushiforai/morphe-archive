package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g67 {
    public final List a;
    public final String b;
    public final String c;

    public g67(String str, String str2, List list) {
        list.getClass();
        str.getClass();
        str2.getClass();
        this.a = list;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g67)) {
            return false;
        }
        g67 g67Var = (g67) obj;
        return g76.L(this.a, g67Var.a) && g76.L(this.b, g67Var.b) && g76.L(this.c, g67Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LocaleInfo(locales=");
        sb.append(this.a);
        sb.append(", currentLocale=");
        sb.append(this.b);
        sb.append(", timeZone=");
        return ka1.v(sb, this.c, ")");
    }
}
