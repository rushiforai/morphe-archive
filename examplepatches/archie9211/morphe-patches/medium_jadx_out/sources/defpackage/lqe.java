package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class lqe extends oqe implements r39 {
    public final int g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final mn6 k;
    public final lqe l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lqe(c41 c41Var, lqe lqeVar, int i, ly lyVar, n98 n98Var, mn6 mn6Var, boolean z, boolean z2, boolean z3, mn6 mn6Var2, jkc jkcVar) {
        super(c41Var, lyVar, n98Var, mn6Var, jkcVar);
        c41Var.getClass();
        lyVar.getClass();
        n98Var.getClass();
        mn6Var.getClass();
        jkcVar.getClass();
        this.g = i;
        this.h = z;
        this.i = z2;
        this.j = z3;
        this.k = mn6Var2;
        this.l = lqeVar == null ? this : lqeVar;
    }

    @Override // defpackage.bw2, defpackage.yv2
    /* JADX INFO: renamed from: A0, reason: merged with bridge method [inline-methods] */
    public final c41 h() {
        yv2 yv2VarH = super.h();
        yv2VarH.getClass();
        return (c41) yv2VarH;
    }

    @Override // defpackage.bw2
    /* JADX INFO: renamed from: B0, reason: merged with bridge method [inline-methods] */
    public final lqe x0() {
        lqe lqeVar = this.l;
        return lqeVar == this ? this : lqeVar.x0();
    }

    @Override // defpackage.nqe
    public final f52 E() {
        return null;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.n(this, obj);
    }

    @Override // defpackage.nqe
    public final boolean O() {
        return false;
    }

    @Override // defpackage.s0d
    public final aw2 f(ixd ixdVar) {
        ixdVar.getClass();
        if (ixdVar.a.e()) {
            return this;
        }
        rd6.b();
        return null;
    }

    @Override // defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = h93.f;
        g93Var.getClass();
        return g93Var;
    }

    @Override // defpackage.c41
    public final Collection i() {
        Collection collectionI = h().i();
        collectionI.getClass();
        Collection collection = collectionI;
        ArrayList arrayList = new ArrayList(cu1.k0(collection, 10));
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            arrayList.add((lqe) ((c41) it2.next()).I().get(this.g));
        }
        return arrayList;
    }

    public lqe y0(v55 v55Var, n98 n98Var, int i) {
        ly annotations = getAnnotations();
        annotations.getClass();
        mn6 type = getType();
        type.getClass();
        return new lqe(v55Var, null, i, annotations, n98Var, type, z0(), this.i, this.j, this.k, jkc.g0);
    }

    public final boolean z0() {
        return this.h && ((f41) h()).j().isReal();
    }
}
