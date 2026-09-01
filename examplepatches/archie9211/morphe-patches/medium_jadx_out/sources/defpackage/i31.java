package defpackage;

import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i31 {
    public static final i31 b;
    public final String a;

    static {
        Pattern.compile("ApolloCacheReference\\{(.*)\\}").getClass();
        b = new i31("QUERY_ROOT");
    }

    public i31(String str, List list) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(":");
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            sb.append((String) it2.next());
        }
        this.a = sb.toString();
    }

    public final boolean equals(Object obj) {
        i31 i31Var = obj instanceof i31 ? (i31) obj : null;
        return g76.L(this.a, i31Var != null ? i31Var.a : null);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.z(new StringBuilder("CacheKey("), this.a, ')');
    }

    public i31(String str) {
        str.getClass();
        this.a = str;
    }
}
