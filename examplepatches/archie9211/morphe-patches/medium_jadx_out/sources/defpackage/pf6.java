package defpackage;

import java.util.EnumMap;
import java.util.HashMap;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum pf6 {
    BOOLEAN(x0a.BOOLEAN, "boolean", "Z", "java.lang.Boolean"),
    CHAR(x0a.CHAR, "char", "C", "java.lang.Character"),
    BYTE(x0a.BYTE, "byte", "B", "java.lang.Byte"),
    SHORT(x0a.SHORT, "short", "S", "java.lang.Short"),
    INT(x0a.INT, "int", "I", "java.lang.Integer"),
    FLOAT(x0a.FLOAT, "float", "F", "java.lang.Float"),
    LONG(x0a.LONG, "long", "J", "java.lang.Long"),
    DOUBLE(x0a.DOUBLE, "double", "D", "java.lang.Double");

    public static final HashMap e = new HashMap();
    public static final EnumMap f = new EnumMap(x0a.class);
    public static final HashMap g = new HashMap();
    public static final HashSet h = new HashSet();
    public static final HashMap i = new HashMap();
    public final x0a a;
    public final String b;
    public final String c;
    public final y05 d;

    static {
        for (pf6 pf6Var : values()) {
            e.put(pf6Var.getJavaKeywordName(), pf6Var);
            f.put(pf6Var.getPrimitiveType(), pf6Var);
            g.put(pf6Var.getDesc(), pf6Var);
            String strReplace = pf6Var.d.a.a.replace('.', '/');
            h.add(strReplace);
            i.put(strReplace, km4.C(new StringBuilder("("), pf6Var.c, ")L", strReplace, ";"));
        }
    }

    pf6(x0a x0aVar, String str, String str2, String str3) {
        if (x0aVar == null) {
            a(8);
            throw null;
        }
        this.a = x0aVar;
        this.b = str;
        this.c = str2;
        this.d = new y05(str3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r8) {
        /*
            Method dump skipped, instruction units count: 274
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pf6.a(int):void");
    }

    public static pf6 get(String str) {
        if (str == null) {
            a(3);
            throw null;
        }
        pf6 pf6Var = (pf6) e.get(str);
        if (pf6Var != null) {
            return pf6Var;
        }
        ay0.d("Non-primitive type name passed: ".concat(str));
        return null;
    }

    public String getDesc() {
        return this.c;
    }

    public String getJavaKeywordName() {
        return this.b;
    }

    public x0a getPrimitiveType() {
        x0a x0aVar = this.a;
        if (x0aVar != null) {
            return x0aVar;
        }
        a(12);
        throw null;
    }

    public y05 getWrapperFqName() {
        return this.d;
    }

    public static pf6 get(x0a x0aVar) {
        if (x0aVar != null) {
            pf6 pf6Var = (pf6) f.get(x0aVar);
            if (pf6Var != null) {
                return pf6Var;
            }
            a(6);
            throw null;
        }
        a(5);
        throw null;
    }
}
