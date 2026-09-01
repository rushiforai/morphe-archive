package defpackage;

import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fn7 {
    public static final x2b d = new x2b("([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)/([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)");
    public static final x2b e = new x2b(";\\s*(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)=(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)|\"([^\"]*)\"))?");
    public final String a;
    public final String b;
    public final String[] c;

    public fn7(String str, String str2, String str3, String[] strArr) {
        str.getClass();
        strArr.getClass();
        this.a = str;
        this.b = str2;
        this.c = strArr;
    }

    public static Charset a(fn7 fn7Var) {
        String str;
        String[] strArr = fn7Var.c;
        int i = 0;
        int iU = hk7.u(0, strArr.length - 1, 2);
        if (iU < 0) {
            str = null;
            break;
        }
        while (!tuc.G(strArr[i], "charset", true)) {
            if (i == iU) {
                str = null;
                break;
            }
            i += 2;
        }
        str = strArr[i + 1];
        if (str == null) {
            return null;
        }
        try {
            return Charset.forName(str);
        } catch (IllegalArgumentException unused) {
            return null;
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof fn7) && g76.L(((fn7) obj).a, this.a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return this.a;
    }
}
