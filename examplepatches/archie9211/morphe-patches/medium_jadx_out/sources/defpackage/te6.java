package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class te6 {
    public final String a;

    public te6(String str) {
        if (str != null) {
            this.a = str;
        } else {
            a(7);
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r9) {
        /*
            Method dump skipped, instruction units count: 220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.te6.a(int):void");
    }

    public static te6 b(y05 y05Var) {
        if (y05Var != null) {
            return new te6(y05Var.a.a.replace('.', '/'));
        }
        a(4);
        throw null;
    }

    public static te6 c(String str) {
        if (str != null) {
            return new te6(str);
        }
        a(0);
        throw null;
    }

    public static String e(mn1 mn1Var) {
        y05 y05Var = mn1Var.a;
        String strReplace = mn1Var.b.a.a.replace('.', '$');
        if (!y05Var.a.c()) {
            strReplace = y05Var.a.a.replace('.', '/') + "/" + strReplace;
        }
        if (strReplace != null) {
            return strReplace;
        }
        a(3);
        throw null;
    }

    public final String d() {
        String str = this.a;
        if (str != null) {
            return str;
        }
        a(10);
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || te6.class != obj.getClass()) {
            return false;
        }
        return this.a.equals(((te6) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return this.a;
    }
}
