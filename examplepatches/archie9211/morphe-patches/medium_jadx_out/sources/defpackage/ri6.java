package defpackage;

import java.io.IOException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ri6 implements qg6 {
    public static final /* synthetic */ fj6[] f;
    public final vg6 a;
    public final int b;
    public final oi6 c;
    public final k1b d;
    public final k1b e;

    static {
        u4a u4aVar = new u4a(ri6.class, "descriptor", "getDescriptor()Lorg/jetbrains/kotlin/descriptors/ParameterDescriptor;", 0);
        s1b s1bVar = n1b.a;
        f = new fj6[]{s1bVar.g(u4aVar), km4.t(ri6.class, "annotations", "getAnnotations()Ljava/util/List;", 0, s1bVar)};
    }

    public ri6(vg6 vg6Var, int i, oi6 oi6Var, m45 m45Var) {
        oi6Var.getClass();
        this.a = vg6Var;
        this.b = i;
        this.c = oi6Var;
        this.d = no7.y(null, m45Var);
        this.e = no7.y(null, new pi6(this, 0));
    }

    public final r39 a() {
        fj6 fj6Var = f[0];
        Object objInvoke = this.d.invoke();
        objInvoke.getClass();
        return (r39) objInvoke;
    }

    public final vj6 e() {
        mn6 type = a().getType();
        type.getClass();
        return new vj6(type, new pi6(this, 1), false);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ri6)) {
            return false;
        }
        ri6 ri6Var = (ri6) obj;
        return this.a.equals(ri6Var.a) && this.b == ri6Var.b;
    }

    public final boolean f() {
        r39 r39VarA = a();
        lqe lqeVar = r39VarA instanceof lqe ? (lqe) r39VarA : null;
        if (lqeVar != null) {
            return f93.a(lqeVar);
        }
        return false;
    }

    @Override // defpackage.qg6
    public final List getAnnotations() {
        fj6 fj6Var = f[1];
        Object objInvoke = this.e.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    public final String getName() {
        r39 r39VarA = a();
        lqe lqeVar = r39VarA instanceof lqe ? (lqe) r39VarA : null;
        if (lqeVar != null && !lqeVar.h().u()) {
            n98 name = lqeVar.getName();
            name.getClass();
            if (!name.b) {
                return name.b();
            }
        }
        return null;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final boolean k() {
        r39 r39VarA = a();
        return (r39VarA instanceof lqe) && ((lqe) r39VarA).k != null;
    }

    public final String toString() throws IOException {
        String string;
        StringBuilder sb = new StringBuilder();
        int i = y1b.a[this.c.ordinal()];
        if (i == 1) {
            sb.append("instance parameter");
        } else if (i == 2) {
            sb.append("context parameter " + getName());
        } else if (i == 3) {
            sb.append("extension receiver parameter");
        } else {
            if (i != 4) {
                ygf.a();
                return null;
            }
            sb.append("parameter #" + this.b + ' ' + getName());
        }
        sb.append(" of ");
        rg6 rg6Var = this.a;
        if (rg6Var instanceof fj6) {
            fj6 fj6Var = (fj6) rg6Var;
            StringBuilder sb2 = new StringBuilder();
            vo7.p(sb2, fj6Var);
            sb2.append(fj6Var instanceof fi6 ? "var " : "val ");
            vo7.q(sb2, fj6Var);
            sb2.append(aq7.z(n98.e(fj6Var.getName())));
            sb2.append(": ");
            sb2.append(vo7.L(fj6Var.getReturnType()));
            string = sb2.toString();
        } else {
            if (!(rg6Var instanceof qh6)) {
                ik4.m("Illegal callable: ", rg6Var);
                return null;
            }
            qh6 qh6Var = (qh6) rg6Var;
            StringBuilder sb3 = new StringBuilder();
            vo7.p(sb3, qh6Var);
            sb3.append("fun ");
            vo7.q(sb3, qh6Var);
            sb3.append(aq7.z(n98.e(qh6Var.getName())));
            bu1.E0(yi2.M(qh6Var), sb3, ", ", "(", ")", p79.l, 48);
            sb3.append(": ");
            sb3.append(vo7.L(qh6Var.getReturnType()));
            string = sb3.toString();
        }
        sb.append(string);
        return sb.toString();
    }
}
