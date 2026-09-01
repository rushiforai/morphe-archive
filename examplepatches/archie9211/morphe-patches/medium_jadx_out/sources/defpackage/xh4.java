package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xh4 implements ly {
    public final ly a;
    public final cy9 b;

    public xh4(ly lyVar, cy9 cy9Var) {
        this.a = lyVar;
        this.b = cy9Var;
    }

    @Override // defpackage.ly
    public final boolean g(y05 y05Var) {
        y05Var.getClass();
        if (((Boolean) this.b.invoke(y05Var)).booleanValue()) {
            return this.a.g(y05Var);
        }
        return false;
    }

    @Override // defpackage.ly
    public final yx i(y05 y05Var) {
        y05Var.getClass();
        if (((Boolean) this.b.invoke(y05Var)).booleanValue()) {
            return this.a.i(y05Var);
        }
        return null;
    }

    @Override // defpackage.ly
    public final boolean isEmpty() {
        ly lyVar = this.a;
        if ((lyVar instanceof Collection) && ((Collection) lyVar).isEmpty()) {
            return false;
        }
        Iterator it2 = lyVar.iterator();
        while (it2.hasNext()) {
            y05 y05VarE = ((yx) it2.next()).e();
            if (y05VarE != null && ((Boolean) this.b.invoke(y05VarE)).booleanValue()) {
                return true;
            }
        }
        return false;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        ArrayList arrayList = new ArrayList();
        for (Object obj : this.a) {
            y05 y05VarE = ((yx) obj).e();
            if (y05VarE != null && ((Boolean) this.b.invoke(y05VarE)).booleanValue()) {
                arrayList.add(obj);
            }
        }
        return arrayList.iterator();
    }
}
