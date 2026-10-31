package mx;

import com.android.launcher3.util.ComponentKey;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class x0 implements uy.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ uy.d0 f77272a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ v70.x f77273b;

    public x0(uy.d0 d0Var, v70.x xVar) {
        this.f77272a = d0Var;
        this.f77273b = xVar;
    }

    @Override // uy.c0
    public final boolean D(uy.q qVar, ga.j jVar) {
        return false;
    }

    @Override // uy.c0
    public final void o() {
        ArrayList arrayListJ = this.f77272a.j(false);
        ArrayList arrayList = new ArrayList();
        Iterator it = arrayListJ.iterator();
        while (it.hasNext()) {
            uy.s sVar = (uy.s) it.next();
            uy.q qVar = sVar instanceof uy.q ? (uy.q) sVar : null;
            if (qVar != null) {
                arrayList.add(qVar);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (((uy.q) next).e()) {
                arrayList2.add(next);
            }
        }
        ((v70.w) this.f77273b).j(arrayList2);
    }

    @Override // uy.c0
    public final void q(uy.q qVar, ComponentKey componentKey) {
    }
}
