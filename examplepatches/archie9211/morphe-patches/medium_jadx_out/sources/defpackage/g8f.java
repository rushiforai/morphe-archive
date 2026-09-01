package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g8f {
    public final elb a;
    public final u73 b = new u73(6);

    public g8f(elb elbVar) {
        this.a = elbVar;
    }

    public final void a(anb anbVar, y70 y70Var) {
        u70 u70Var = (u70) y70Var.keySet();
        y70 y70Var2 = u70Var.a;
        if (y70Var2.isEmpty()) {
            return;
        }
        if (y70Var.c > 999) {
            fp7.p(y70Var, new e8f(this, anbVar, 0));
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT `progress`,`work_spec_id` FROM `WorkProgress` WHERE `work_spec_id` IN (");
        wo7.f(y70Var2.c, sb);
        sb.append(")");
        gnb gnbVarB0 = anbVar.B0(sb.toString());
        Iterator it2 = u70Var.iterator();
        int i = 1;
        while (true) {
            t70 t70Var = (t70) it2;
            if (!t70Var.hasNext()) {
                try {
                    break;
                } finally {
                    gnbVarB0.close();
                }
            } else {
                gnbVarB0.M(i, (String) t70Var.next());
                i++;
            }
        }
        gnbVarB0.getClass();
        int iQ = en7.q(gnbVarB0, "work_spec_id");
        if (iQ == -1) {
            return;
        }
        while (gnbVarB0.w0()) {
            List list = (List) y70Var.get(gnbVarB0.d0(iQ));
            if (list != null) {
                byte[] blob = gnbVarB0.getBlob(0);
                dt2 dt2Var = dt2.b;
                list.add(ht2.m0(blob));
            }
        }
    }

    public final void b(anb anbVar, y70 y70Var) {
        u70 u70Var = (u70) y70Var.keySet();
        y70 y70Var2 = u70Var.a;
        if (y70Var2.isEmpty()) {
            return;
        }
        if (y70Var.c > 999) {
            fp7.p(y70Var, new e8f(this, anbVar, 1));
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT `tag`,`work_spec_id` FROM `WorkTag` WHERE `work_spec_id` IN (");
        wo7.f(y70Var2.c, sb);
        sb.append(")");
        gnb gnbVarB0 = anbVar.B0(sb.toString());
        Iterator it2 = u70Var.iterator();
        int i = 1;
        while (true) {
            t70 t70Var = (t70) it2;
            if (!t70Var.hasNext()) {
                try {
                    break;
                } finally {
                    gnbVarB0.close();
                }
            } else {
                gnbVarB0.M(i, (String) t70Var.next());
                i++;
            }
        }
        gnbVarB0.getClass();
        int iQ = en7.q(gnbVarB0, "work_spec_id");
        if (iQ == -1) {
            return;
        }
        while (gnbVarB0.w0()) {
            List list = (List) y70Var.get(gnbVarB0.d0(iQ));
            if (list != null) {
                list.add(gnbVarB0.d0(0));
            }
        }
    }

    public final void c(String str) {
        str.getClass();
        n01.c0(this.a, false, true, new nmc(str, 23));
    }

    public final j7f d(String str) {
        str.getClass();
        return (j7f) n01.c0(this.a, true, false, new nmc(str, 15));
    }

    public final c8f e(String str) {
        str.getClass();
        return (c8f) n01.c0(this.a, true, false, new nmc(str, 14));
    }

    public final List f(String str) {
        str.getClass();
        return (List) n01.c0(this.a, true, false, new nmc(str, 24));
    }

    public final void g(long j, String str) {
        str.getClass();
        ((Number) n01.c0(this.a, false, true, new d8f(str, 0, j))).intValue();
    }

    public final void h(int i, String str) {
        str.getClass();
        n01.c0(this.a, false, true, new ne(str, i, 6));
    }

    public final void i(long j, String str) {
        str.getClass();
        n01.c0(this.a, false, true, new d8f(str, 1, j));
    }

    public final void j(j7f j7fVar, String str) {
        j7fVar.getClass();
        str.getClass();
        ((Number) n01.c0(this.a, false, true, new vrd(j7fVar, 20, str))).intValue();
    }

    public final void k(int i, String str) {
        str.getClass();
        n01.c0(this.a, false, true, new ne(i, str));
    }
}
