package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class s1b {
    public wg6 b(Class cls) {
        return new un1(cls);
    }

    public lh6 c(Class cls) {
        return new by8(cls);
    }

    public String i(l55 l55Var) {
        String string = l55Var.getClass().getGenericInterfaces()[0].toString();
        return string.startsWith("kotlin.jvm.functions.") ? string.substring(21) : string;
    }

    public String j(co6 co6Var) {
        return i(co6Var);
    }

    public qj6 k(wg6 wg6Var, List list) {
        return new zwd(wg6Var, list);
    }

    public qh6 a(w55 w55Var) {
        return w55Var;
    }

    public xh6 d(bp7 bp7Var) {
        return bp7Var;
    }

    public ai6 e(c78 c78Var) {
        return c78Var;
    }

    public ti6 f(kv4 kv4Var) {
        return kv4Var;
    }

    public xi6 g(u4a u4aVar) {
        return u4aVar;
    }

    public bj6 h(v4a v4aVar) {
        return v4aVar;
    }
}
