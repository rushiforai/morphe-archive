package defpackage;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xs6 extends f1 {
    public final n0c l;
    public final e1b m;

    public xs6(n0c n0cVar, e1b e1bVar, int i, yv2 yv2Var) {
        super(i, new as6(n0cVar, e1bVar, false), yv2Var, ((k96) n0cVar.b).a, n98.e(e1bVar.a.getName()), pqe.INVARIANT, false);
        this.l = n0cVar;
        this.m = e1bVar;
    }

    @Override // defpackage.c3
    public final List y0(List list) {
        xs6 xs6Var;
        cd7 cd7Var;
        mn6 mn6Var;
        mn6 mn6VarO;
        n0c n0cVar = this.l;
        cd7 cd7Var2 = ((k96) n0cVar.b).k;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            mn6 mn6Var2 = (mn6) it2.next();
            p79 p79Var = p79.D;
            mn6Var2.getClass();
            if (nxd.c(mn6Var2, p79Var, null)) {
                xs6Var = this;
                cd7Var = cd7Var2;
                mn6Var = mn6Var2;
            } else {
                xs6Var = this;
                cd7Var = cd7Var2;
                mn6Var = mn6Var2;
                mn6VarO = cd7Var.o(new zdc((gx) xs6Var, false, n0cVar, dy.TYPE_PARAMETER_BOUNDS, false), mn6Var, ey3.a, null, false);
                if (mn6VarO == null) {
                }
                arrayList.add(mn6VarO);
                this = xs6Var;
                cd7Var2 = cd7Var;
            }
            mn6VarO = mn6Var;
            arrayList.add(mn6VarO);
            this = xs6Var;
            cd7Var2 = cd7Var;
        }
        return arrayList;
    }

    @Override // defpackage.c3
    public final List z0() {
        Type[] bounds = this.m.a.getBounds();
        bounds.getClass();
        ArrayList arrayList = new ArrayList(bounds.length);
        for (Type type : bounds) {
            arrayList.add(new s0b(type));
        }
        s0b s0bVar = (s0b) bu1.c1(arrayList);
        Collection collection = arrayList;
        if (g76.L(s0bVar != null ? s0bVar.a : null, Object.class)) {
            collection = ey3.a;
        }
        boolean zIsEmpty = collection.isEmpty();
        n0c n0cVar = this.l;
        if (zIsEmpty) {
            return d46.Q(pwd.K(((k96) n0cVar.b).h.e.e(), ((k96) n0cVar.b).h.e.o()));
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(collection, 10));
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((ku3) n0cVar.e).K((s0b) it2.next(), gx1.e0(lxd.COMMON, false, this, 3)));
        }
        return arrayList2;
    }
}
