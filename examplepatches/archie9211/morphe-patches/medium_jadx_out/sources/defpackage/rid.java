package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rid {
    public ip6 a;
    public m73 b;
    public yy4 c;
    public mkd d;
    public Object e;
    public final k49 f = qo7.u(Boolean.TRUE);
    public long g;

    public rid(ip6 ip6Var, m73 m73Var, yy4 yy4Var, mkd mkdVar, Object obj) {
        this.a = ip6Var;
        this.b = m73Var;
        this.c = yy4Var;
        this.d = mkdVar;
        this.e = obj;
        this.g = uhd.a(this.d, this.b, this.c, uhd.a, 1);
    }

    public static void a(rid ridVar, ip6 ip6Var, m73 m73Var, mkd mkdVar, int i) {
        if ((i & 1) != 0) {
            ip6Var = ridVar.a;
        }
        if ((i & 2) != 0) {
            m73Var = ridVar.b;
        }
        yy4 yy4Var = ridVar.c;
        if ((i & 8) != 0) {
            mkdVar = ridVar.d;
        }
        Object obj = ridVar.e;
        ip6 ip6Var2 = ridVar.a;
        k49 k49Var = ridVar.f;
        if (ip6Var == ip6Var2 && g76.L(m73Var, ridVar.b) && g76.L(yy4Var, ridVar.c) && g76.L(mkdVar, ridVar.d)) {
            if (g76.L(obj, ridVar.e)) {
                return;
            }
            ridVar.e = obj;
            k49Var.setValue(Boolean.TRUE);
            return;
        }
        ridVar.a = ip6Var;
        ridVar.b = m73Var;
        ridVar.c = yy4Var;
        ridVar.d = mkdVar;
        k49Var.setValue(Boolean.TRUE);
    }
}
