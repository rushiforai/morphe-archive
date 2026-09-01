package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rwb implements q51, xwe {
    public static final /* synthetic */ long f = m80.a.objectFieldOffset(rwb.class.getDeclaredField("state$volatile"));
    public final ib2 a;
    public Object c;
    private volatile /* synthetic */ Object state$volatile = sgg.l;
    public ArrayList b = new ArrayList(2);
    public int d = -1;
    public Object e = sgg.o;

    public rwb(ib2 ib2Var) {
        this.a = ib2Var;
    }

    @Override // defpackage.xwe
    public final void a(jwb jwbVar, int i) {
        this.c = jwbVar;
        this.d = i;
    }

    @Override // defpackage.q51
    public final void b(Throwable th) {
        rwb rwbVar;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = f;
            Object objectVolatile = unsafe.getObjectVolatile(this, j);
            if (objectVolatile == sgg.m) {
                return;
            }
            d1g d1gVar = sgg.n;
            while (true) {
                Unsafe unsafe2 = m80.a;
                rwbVar = this;
                if (unsafe2.compareAndSwapObject(rwbVar, f, objectVolatile, d1gVar)) {
                    ArrayList arrayList = rwbVar.b;
                    if (arrayList == null) {
                        return;
                    }
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        ((pwb) it2.next()).a();
                    }
                    rwbVar.e = sgg.o;
                    rwbVar.b = null;
                    return;
                }
                if (unsafe2.getObjectVolatile(rwbVar, j) != objectVolatile) {
                    break;
                } else {
                    this = rwbVar;
                }
            }
            this = rwbVar;
        }
    }

    public final Object c(p92 p92Var) {
        Unsafe unsafe = m80.a;
        long j = f;
        Object objectVolatile = unsafe.getObjectVolatile(this, j);
        objectVolatile.getClass();
        pwb pwbVar = (pwb) objectVolatile;
        Object obj = pwbVar.d;
        Object obj2 = this.e;
        ArrayList<pwb> arrayList = this.b;
        if (arrayList != null) {
            for (pwb pwbVar2 : arrayList) {
                if (pwbVar2 != pwbVar) {
                    pwbVar2.a();
                }
            }
            m80.a.putObjectVolatile(this, j, sgg.m);
            this.e = sgg.o;
            this.b = null;
        }
        Object objF = pwbVar.c.f(pwbVar.a, obj, obj2);
        ub2 ub2Var = pwbVar.e;
        return obj == sgg.p ? ((x45) ub2Var).invoke(p92Var) : ((b55) ub2Var).invoke(objF, p92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r16) throws kotlinx.coroutines.DispatchException {
        /*
            Method dump skipped, instruction units count: 224
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rwb.d(p92):java.lang.Object");
    }

    public final pwb e(Object obj) {
        Object next;
        ArrayList arrayList = this.b;
        if (arrayList == null) {
            return null;
        }
        Iterator it2 = arrayList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((pwb) next).a == obj) {
                break;
            }
        }
        pwb pwbVar = (pwb) next;
        if (pwbVar != null) {
            return pwbVar;
        }
        rd6.o("Clause with object ", obj, " is not found");
        return null;
    }

    public final void f(pwb pwbVar, boolean z) {
        Object obj = pwbVar.a;
        Unsafe unsafe = m80.a;
        long j = f;
        if (unsafe.getObjectVolatile(this, j) instanceof pwb) {
            return;
        }
        if (!z) {
            ArrayList arrayList = this.b;
            arrayList.getClass();
            if (!arrayList.isEmpty()) {
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    if (((pwb) it2.next()).a == obj) {
                        lg8.i(ka1.q("Cannot use select clauses on the same object: ", obj));
                        return;
                    }
                }
            }
        }
        pwbVar.b.f(obj, this, pwbVar.d);
        if (this.e != sgg.o) {
            m80.a.putObjectVolatile(this, j, pwbVar);
            return;
        }
        if (!z) {
            ArrayList arrayList2 = this.b;
            arrayList2.getClass();
            arrayList2.add(pwbVar);
        }
        pwbVar.g = this.c;
        pwbVar.h = this.d;
        this.c = null;
        this.d = -1;
    }

    public final int g(Object obj, Object obj2) {
        rwb rwbVar;
        Unsafe unsafe;
        Unsafe unsafe2;
        while (true) {
            Unsafe unsafe3 = m80.a;
            long j = f;
            Object objectVolatile = unsafe3.getObjectVolatile(this, j);
            if (objectVolatile instanceof w51) {
                pwb pwbVarE = this.e(obj);
                if (pwbVarE != null) {
                    c55 c55Var = pwbVarE.f;
                    c55 c55Var2 = c55Var != null ? (c55) c55Var.f(this, pwbVarE.d, obj2) : null;
                    while (true) {
                        Unsafe unsafe4 = m80.a;
                        rwbVar = this;
                        if (unsafe4.compareAndSwapObject(rwbVar, f, objectVolatile, pwbVarE)) {
                            w51 w51Var = (w51) objectVolatile;
                            rwbVar.e = obj2;
                            d1g d1gVarD = w51Var.d(c1e.a, c55Var2);
                            if (d1gVarD == null) {
                                rwbVar.e = sgg.o;
                                return 2;
                            }
                            w51Var.t(d1gVarD);
                            return 0;
                        }
                        if (unsafe4.getObjectVolatile(rwbVar, j) != objectVolatile) {
                            break;
                        }
                        this = rwbVar;
                    }
                } else {
                    continue;
                }
            } else {
                rwbVar = this;
                if (g76.L(objectVolatile, sgg.m) || (objectVolatile instanceof pwb)) {
                    return 3;
                }
                if (g76.L(objectVolatile, sgg.n)) {
                    return 2;
                }
                if (g76.L(objectVolatile, sgg.l)) {
                    List listQ = d46.Q(obj);
                    do {
                        unsafe2 = m80.a;
                        if (unsafe2.compareAndSwapObject(rwbVar, f, objectVolatile, listQ)) {
                            return 1;
                        }
                    } while (unsafe2.getObjectVolatile(rwbVar, j) == objectVolatile);
                } else {
                    if (!(objectVolatile instanceof List)) {
                        ik4.m("Unexpected state: ", objectVolatile);
                        return 0;
                    }
                    ArrayList arrayListR0 = bu1.R0((Collection) objectVolatile, obj);
                    do {
                        unsafe = m80.a;
                        if (unsafe.compareAndSwapObject(rwbVar, f, objectVolatile, arrayListR0)) {
                            return 1;
                        }
                    } while (unsafe.getObjectVolatile(rwbVar, j) == objectVolatile);
                }
            }
            this = rwbVar;
        }
    }
}
