package defpackage;

import android.os.Bundle;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ga8 {
    public final xsa a;
    public final xpc b;
    public final xpc c;
    public boolean d;
    public final wua e;
    public final wua f;
    public final sc8 g;
    public final /* synthetic */ db8 h;

    public ga8(db8 db8Var, sc8 sc8Var) {
        sc8Var.getClass();
        this.h = db8Var;
        this.a = new xsa(23);
        xpc xpcVarJ = vv2.j(ey3.a);
        this.b = xpcVarJ;
        xpc xpcVarJ2 = vv2.j(ny3.a);
        this.c = xpcVarJ2;
        this.e = bo.A(xpcVarJ);
        this.f = bo.A(xpcVarJ2);
        this.g = sc8Var;
    }

    public final void a(ba8 ba8Var) {
        ba8Var.getClass();
        synchronized (this.a) {
            xpc xpcVar = this.b;
            xpcVar.m(null, bu1.R0((Collection) xpcVar.getValue(), ba8Var));
        }
    }

    public final ba8 b(va8 va8Var, Bundle bundle) {
        ka8 ka8Var = this.h.b;
        ka8Var.getClass();
        return zi5.e(ka8Var.a.c, va8Var, bundle, ka8Var.i(), ka8Var.o);
    }

    public final void c(ba8 ba8Var) {
        la8 la8Var;
        vue vueVar;
        ba8Var.getClass();
        ka8 ka8Var = this.h.b;
        xpc xpcVar = ka8Var.h;
        String str = ba8Var.f;
        LinkedHashMap linkedHashMap = ka8Var.w;
        boolean zL = g76.L(linkedHashMap.get(ba8Var), Boolean.TRUE);
        xpc xpcVar2 = this.c;
        xpcVar2.m(null, qo7.s((Set) xpcVar2.getValue(), ba8Var));
        linkedHashMap.remove(ba8Var);
        m70 m70Var = ka8Var.f;
        if (m70Var.contains(ba8Var)) {
            if (this.d) {
                return;
            }
            ka8Var.u();
            xpc xpcVar3 = ka8Var.g;
            ArrayList arrayList = new ArrayList(m70Var);
            xpcVar3.getClass();
            xpcVar3.m(null, arrayList);
            ArrayList arrayListQ = ka8Var.q();
            xpcVar.getClass();
            xpcVar.m(null, arrayListQ);
            return;
        }
        ka8Var.t(ba8Var);
        if (ba8Var.h.j.d.isAtLeast(vx6.CREATED)) {
            ba8Var.b(vx6.DESTROYED);
        }
        if (!m70Var.isEmpty()) {
            Iterator it2 = m70Var.iterator();
            while (it2.hasNext()) {
                if (((ba8) it2.next()).f.equals(str)) {
                    break;
                }
            }
            if (!zL) {
                vueVar.a();
            }
        } else if (!zL && (la8Var = ka8Var.o) != null && (vueVar = (vue) la8Var.b.remove(str)) != null) {
            vueVar.a();
        }
        ka8Var.u();
        ArrayList arrayListQ2 = ka8Var.q();
        xpcVar.getClass();
        xpcVar.m(null, arrayListQ2);
    }

    public final void d(ba8 ba8Var) {
        int iNextIndex;
        synchronized (this.a) {
            try {
                ArrayList arrayListN1 = bu1.n1((Collection) this.e.a.getValue());
                ListIterator listIterator = arrayListN1.listIterator(arrayListN1.size());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        iNextIndex = -1;
                        break;
                    } else if (((ba8) listIterator.previous()).f.equals(ba8Var.f)) {
                        iNextIndex = listIterator.nextIndex();
                        break;
                    }
                }
                arrayListN1.set(iNextIndex, ba8Var);
                this.b.m(null, arrayListN1);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void e(ba8 ba8Var, boolean z) {
        ba8Var.getClass();
        ka8 ka8Var = this.h.b;
        ps5 ps5Var = new ps5(this, ba8Var, z);
        ka8Var.getClass();
        sc8 sc8VarB = ka8Var.s.b(ba8Var.b.a);
        ka8Var.w.put(ba8Var, Boolean.valueOf(z));
        if (!sc8VarB.equals(this.g)) {
            Object obj = ka8Var.t.get(sc8VarB);
            obj.getClass();
            ((ga8) obj).e(ba8Var, z);
            return;
        }
        xx7 xx7Var = ka8Var.v;
        if (xx7Var != null) {
            xx7Var.invoke(ba8Var);
            ps5Var.invoke();
            return;
        }
        m70 m70Var = ka8Var.f;
        int iIndexOf = m70Var.indexOf(ba8Var);
        if (iIndexOf < 0) {
            Log.i("NavController", "Ignoring pop of " + ba8Var + " as it was not found on the current back stack");
            return;
        }
        int i = iIndexOf + 1;
        if (i != m70Var.c) {
            ka8Var.n(((ba8) m70Var.get(i)).b.b.c, true, false);
        }
        ka8.p(ka8Var, ba8Var);
        ps5Var.invoke();
        ka8Var.b.invoke();
        ka8Var.b();
    }

    public final void f(ba8 ba8Var, boolean z) {
        Object objPrevious;
        ba8Var.getClass();
        vpc vpcVar = this.e.a;
        xpc xpcVar = this.c;
        Iterable iterable = (Iterable) xpcVar.getValue();
        if (!(iterable instanceof Collection) || !((Collection) iterable).isEmpty()) {
            Iterator it2 = iterable.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                if (((ba8) it2.next()) == ba8Var) {
                    Iterable iterable2 = (Iterable) vpcVar.getValue();
                    if ((iterable2 instanceof Collection) && ((Collection) iterable2).isEmpty()) {
                        return;
                    }
                    Iterator it3 = iterable2.iterator();
                    while (it3.hasNext()) {
                        if (((ba8) it3.next()) == ba8Var) {
                        }
                    }
                    return;
                }
            }
        }
        xpcVar.m(null, qo7.w((Set) xpcVar.getValue(), ba8Var));
        List list = (List) vpcVar.getValue();
        ListIterator listIterator = list.listIterator(list.size());
        while (true) {
            if (!listIterator.hasPrevious()) {
                objPrevious = null;
                break;
            }
            objPrevious = listIterator.previous();
            ba8 ba8Var2 = (ba8) objPrevious;
            if (!g76.L(ba8Var2, ba8Var) && ((List) vpcVar.getValue()).lastIndexOf(ba8Var2) < ((List) vpcVar.getValue()).lastIndexOf(ba8Var)) {
                break;
            }
        }
        ba8 ba8Var3 = (ba8) objPrevious;
        if (ba8Var3 != null) {
            xpcVar.m(null, qo7.w((Set) xpcVar.getValue(), ba8Var3));
        }
        e(ba8Var, z);
    }

    public final void g(ba8 ba8Var) {
        ba8Var.getClass();
        xpc xpcVar = this.c;
        xpcVar.m(null, qo7.w((Set) xpcVar.getValue(), ba8Var));
        ka8 ka8Var = this.h.b;
        ka8Var.getClass();
        if (ka8Var.f.contains(ba8Var)) {
            ba8Var.b(vx6.STARTED);
        } else {
            ygf.f("Cannot transition entry that is not in the back stack");
        }
    }

    public final void h(ba8 ba8Var) {
        ba8Var.getClass();
        ka8 ka8Var = this.h.b;
        ka8Var.getClass();
        sc8 sc8VarB = ka8Var.s.b(ba8Var.b.a);
        if (!sc8VarB.equals(this.g)) {
            Object obj = ka8Var.t.get(sc8VarB);
            if (obj != null) {
                ((ga8) obj).h(ba8Var);
                return;
            } else {
                lg8.i(ka1.v(new StringBuilder("NavigatorBackStack for "), ba8Var.b.a, " should already be created"));
                return;
            }
        }
        x45 x45Var = ka8Var.u;
        if (x45Var != null) {
            x45Var.invoke(ba8Var);
            a(ba8Var);
        } else {
            Log.i("NavController", "Ignoring add of destination " + ba8Var.b + " outside of the call to navigate(). ");
        }
    }

    public final void i(ba8 ba8Var) {
        vpc vpcVar = this.e.a;
        ba8Var.getClass();
        xpc xpcVar = this.c;
        Iterable iterable = (Iterable) xpcVar.getValue();
        if (!(iterable instanceof Collection) || !((Collection) iterable).isEmpty()) {
            Iterator it2 = iterable.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                if (((ba8) it2.next()) == ba8Var) {
                    Iterable iterable2 = (Iterable) vpcVar.getValue();
                    if (!(iterable2 instanceof Collection) || !((Collection) iterable2).isEmpty()) {
                        Iterator it3 = iterable2.iterator();
                        while (it3.hasNext()) {
                            if (((ba8) it3.next()) == ba8Var) {
                                return;
                            }
                        }
                    }
                }
            }
        }
        ba8 ba8Var2 = (ba8) bu1.I0((List) vpcVar.getValue());
        if (ba8Var2 != null) {
            xpcVar.m(null, qo7.w((Set) xpcVar.getValue(), ba8Var2));
        }
        xpcVar.m(null, qo7.w((Set) xpcVar.getValue(), ba8Var));
        h(ba8Var);
    }
}
