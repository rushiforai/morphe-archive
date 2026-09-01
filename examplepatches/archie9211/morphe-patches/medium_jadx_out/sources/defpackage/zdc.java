package defpackage;

import android.content.Context;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zdc {
    public final boolean a;
    public final boolean b;
    public final Object c;
    public final Object d;
    public final Object e;

    public zdc(gx gxVar, boolean z, n0c n0cVar, dy dyVar, boolean z2) {
        n0cVar.getClass();
        dyVar.getClass();
        this.c = gxVar;
        this.a = z;
        this.d = n0cVar;
        this.e = dyVar;
        this.b = z2;
    }

    public static void a(Object obj, ArrayList arrayList, z zVar) {
        arrayList.add(obj);
        Iterable iterable = (Iterable) zVar.invoke(obj);
        if (iterable != null) {
            Iterator it2 = iterable.iterator();
            while (it2.hasNext()) {
                a(it2.next(), arrayList, zVar);
            }
        }
    }

    public static vl8 c(qn6 qn6Var) {
        hec hecVarM;
        hec hecVarM2;
        qn6Var.getClass();
        zm4 zm4VarJ = k40.J(qn6Var);
        if (zm4VarJ == null || (hecVarM = k40.D0(zm4VarJ)) == null) {
            hecVarM = k40.M(qn6Var);
            hecVarM.getClass();
        }
        if (k40.u0(hecVarM)) {
            return vl8.NULLABLE;
        }
        zm4 zm4VarJ2 = k40.J(qn6Var);
        if (zm4VarJ2 == null || (hecVarM2 = k40.U0(zm4VarJ2)) == null) {
            hecVarM2 = k40.M(qn6Var);
            hecVarM2.getClass();
        }
        if (k40.u0(hecVarM2)) {
            return null;
        }
        return vl8.NOT_NULL;
    }

    public wl8 b(swd swdVar) {
        List list;
        vl8 vl8Var;
        swdVar.getClass();
        if (!(swdVar instanceof xs6)) {
            return null;
        }
        List upperBounds = ((c3) swdVar).getUpperBounds();
        if (upperBounds.isEmpty()) {
            return null;
        }
        Iterator it2 = upperBounds.iterator();
        while (it2.hasNext()) {
            if (!k40.q0((qn6) it2.next())) {
                ArrayList arrayList = new ArrayList();
                for (Object obj : upperBounds) {
                    if (c((qn6) obj) != null) {
                        arrayList.add(obj);
                    }
                }
                vq6 vq6VarD0 = vx0.d0(yw6.NONE, new t2(upperBounds, this));
                if (!arrayList.isEmpty()) {
                    if (!arrayList.isEmpty()) {
                        Iterator it3 = arrayList.iterator();
                        if (it3.hasNext()) {
                            ((qn6) it3.next()).getClass();
                            list = upperBounds;
                        }
                    }
                    return new wl8(vl8.FORCE_FLEXIBILITY, false);
                }
                if (((List) vq6VarD0.getValue()).isEmpty()) {
                    return null;
                }
                List list2 = (List) vq6VarD0.getValue();
                if (list2 == null || !list2.isEmpty()) {
                    Iterator it4 = list2.iterator();
                    if (it4.hasNext()) {
                        ((qn6) it4.next()).getClass();
                        list = (List) vq6VarD0.getValue();
                    }
                }
                return new wl8(vl8.FORCE_FLEXIBILITY, true);
                if (list == null || !list.isEmpty()) {
                    Iterator it5 = list.iterator();
                    while (it5.hasNext()) {
                        if (!k40.w0((qn6) it5.next())) {
                            vl8Var = vl8.NOT_NULL;
                            break;
                        }
                    }
                    vl8Var = vl8.NULLABLE;
                } else {
                    vl8Var = vl8.NULLABLE;
                }
                return new wl8(vl8Var, list != upperBounds);
            }
        }
        return null;
    }

    public ArrayList d(qn6 qn6Var) {
        n0c n0cVar = (n0c) this.d;
        z96 z96Var = (z96) ((vq6) n0cVar.d).getValue();
        fy fyVar = ((k96) n0cVar.b).j;
        qn6Var.getClass();
        u2 u2Var = new u2(qn6Var, fyVar.b(z96Var, ((mn6) qn6Var).getAnnotations()), null);
        z zVar = new z(3, this);
        ArrayList arrayList = new ArrayList(1);
        a(u2Var, arrayList, zVar);
        return arrayList;
    }

    public zdc(Context context, String str, ad adVar, boolean z, boolean z2) {
        adVar.getClass();
        this.c = context;
        this.d = str;
        this.e = adVar;
        this.a = z;
        this.b = z2;
    }
}
