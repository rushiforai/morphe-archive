package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tv6 implements ev7 {
    public final /* synthetic */ int b = 1;
    public final Object c;

    public tv6(x67 x67Var, m45 m45Var) {
        x67Var.getClass();
        this.c = new u67(x67Var, new y93(1, m45Var));
    }

    @Override // defpackage.ev7
    public Collection a(n98 n98Var, ng8 ng8Var) {
        switch (this.b) {
            case 1:
                n98Var.getClass();
                ng8Var.getClass();
                return tr7.w(j(n98Var, ng8Var), zkc.j);
            default:
                return j(n98Var, ng8Var);
        }
    }

    @Override // defpackage.ev7
    public final Set b() {
        return l().b();
    }

    @Override // defpackage.ev7
    public final Set c() {
        return l().c();
    }

    @Override // defpackage.ev7
    public final co1 d(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return l().d(n98Var, ng8Var);
    }

    @Override // defpackage.ev7
    public Collection e(p83 p83Var, x45 x45Var) {
        switch (this.b) {
            case 1:
                p83Var.getClass();
                Collection collectionI = i(p83Var, x45Var);
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                for (Object obj : collectionI) {
                    if (((yv2) obj) instanceof c41) {
                        arrayList.add(obj);
                    } else {
                        arrayList2.add(obj);
                    }
                }
                return bu1.Q0(arrayList2, tr7.w(arrayList, zkc.l));
            default:
                return i(p83Var, x45Var);
        }
    }

    @Override // defpackage.ev7
    public Collection f(n98 n98Var, ng8 ng8Var) {
        switch (this.b) {
            case 1:
                n98Var.getClass();
                ng8Var.getClass();
                return tr7.w(k(n98Var, ng8Var), zkc.k);
            default:
                return k(n98Var, ng8Var);
        }
    }

    @Override // defpackage.ev7
    public final Set g() {
        return l().g();
    }

    public final ev7 h() {
        if (!(l() instanceof tv6)) {
            return l();
        }
        ev7 ev7VarL = l();
        ev7VarL.getClass();
        return ((tv6) ev7VarL).h();
    }

    public final Collection i(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        return l().e(p83Var, x45Var);
    }

    public final Collection j(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return l().a(n98Var, ng8Var);
    }

    public final Collection k(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        return l().f(n98Var, ng8Var);
    }

    public final ev7 l() {
        int i = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return (ev7) ((u67) obj).invoke();
            default:
                return (ev7) obj;
        }
    }

    public tv6(ev7 ev7Var) {
        this.c = ev7Var;
    }
}
