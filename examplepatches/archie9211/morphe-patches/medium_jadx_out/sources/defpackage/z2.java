package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class z2 implements zvd {
    public int a;
    public final q67 b;

    public z2(x67 x67Var) {
        x67Var.getClass();
        this.b = new q67(x67Var, new v2(1, this), new z(5, this));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if ((obj instanceof zvd) && obj.hashCode() == hashCode()) {
            zvd zvdVar = (zvd) obj;
            if (zvdVar.getParameters().size() == getParameters().size()) {
                co1 co1VarA = a();
                co1 co1VarA2 = zvdVar.a();
                if (co1VarA2 == null || l24.f(co1VarA) || d93.n(co1VarA) || l24.f(co1VarA2) || d93.n(co1VarA2)) {
                    return false;
                }
                return j(co1VarA2);
            }
        }
        return false;
    }

    public abstract Collection f();

    public abstract mn6 g();

    public abstract uob h();

    public final int hashCode() {
        int i = this.a;
        if (i != 0) {
            return i;
        }
        co1 co1VarA = a();
        int iIdentityHashCode = (l24.f(co1VarA) || d93.n(co1VarA)) ? System.identityHashCode(this) : d93.g(co1VarA).a.hashCode();
        this.a = iIdentityHashCode;
        return iIdentityHashCode;
    }

    @Override // defpackage.zvd
    /* JADX INFO: renamed from: i, reason: merged with bridge method [inline-methods] */
    public final List b() {
        return ((y2) this.b.invoke()).b;
    }

    public abstract boolean j(co1 co1Var);

    public List k(List list) {
        return list;
    }
}
