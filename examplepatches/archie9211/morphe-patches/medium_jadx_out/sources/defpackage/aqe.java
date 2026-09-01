package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class aqe implements v41 {
    public final Method a;
    public final Method b;
    public final ArrayList c;
    public final ArrayList d;
    public final ArrayList e;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v16, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v17, types: [java.util.ArrayList] */
    public aqe(s55 s55Var, ph6 ph6Var, String str, List list) {
        ?? Q;
        ph6Var.getClass();
        str.getClass();
        Method methodP = ph6Var.p("constructor-impl", str);
        methodP.getClass();
        this.a = methodP;
        Method methodP2 = ph6Var.p("box-impl", muc.l0(str, "V").concat(e0b.b(ph6Var.e())));
        methodP2.getClass();
        this.b = methodP2;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (true) {
            List listQ = null;
            if (!it2.hasNext()) {
                break;
            }
            mn6 type = ((r39) it2.next()).getType();
            type.getClass();
            hec hecVarR = lk7.r(type);
            ArrayList arrayListX = kk7.x(hecVarR);
            if (arrayListX == null) {
                Class clsI = kk7.I(hecVarR);
                if (clsI != null) {
                    listQ = d46.Q(kk7.w(clsI, s55Var));
                }
            } else {
                listQ = arrayListX;
            }
            arrayList.add(listQ);
        }
        this.c = arrayList;
        ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
        int i = 0;
        for (Object obj : list) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            co1 co1VarA = ((r39) obj).getType().j0().a();
            co1VarA.getClass();
            y28 y28Var = (y28) co1VarA;
            List list2 = (List) this.c.get(i);
            if (list2 != null) {
                Q = new ArrayList(cu1.k0(list2, 10));
                Iterator it3 = list2.iterator();
                while (it3.hasNext()) {
                    Q.add(((Method) it3.next()).getReturnType());
                }
            } else {
                Class clsJ = bpe.j(y28Var);
                clsJ.getClass();
                Q = d46.Q(clsJ);
            }
            arrayList2.add(Q);
            i = i2;
        }
        this.d = arrayList2;
        ArrayList arrayList3 = new ArrayList();
        Iterator it4 = arrayList2.iterator();
        while (it4.hasNext()) {
            bu1.n0((Iterable) it4.next(), arrayList3);
        }
        this.e = arrayList3;
    }

    @Override // defpackage.v41
    public final List a() {
        return this.e;
    }

    @Override // defpackage.v41
    public final Member b() {
        return null;
    }

    @Override // defpackage.v41
    public final boolean c() {
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r6v2, types: [java.lang.Iterable] */
    /* JADX WARN: Type inference failed for: r6v3, types: [java.util.ArrayList] */
    @Override // defpackage.v41
    public final Object call(Object[] objArr) throws IllegalAccessException, InvocationTargetException {
        ?? Q;
        objArr.getClass();
        ArrayList arrayList = this.c;
        arrayList.getClass();
        int length = objArr.length;
        ArrayList<f09> arrayList2 = new ArrayList(Math.min(cu1.k0(arrayList, 10), length));
        int i = 0;
        for (Object obj : arrayList) {
            if (i >= length) {
                break;
            }
            arrayList2.add(new f09(objArr[i], obj));
            i++;
        }
        ArrayList arrayList3 = new ArrayList();
        for (f09 f09Var : arrayList2) {
            Object obj2 = f09Var.a;
            List list = (List) f09Var.b;
            if (list != null) {
                Q = new ArrayList(cu1.k0(list, 10));
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    Q.add(((Method) it2.next()).invoke(obj2, null));
                }
            } else {
                Q = d46.Q(obj2);
            }
            bu1.n0(Q, arrayList3);
        }
        Object[] array = arrayList3.toArray(new Object[0]);
        this.a.invoke(null, Arrays.copyOf(array, array.length));
        return this.b.invoke(null, Arrays.copyOf(array, array.length));
    }

    @Override // defpackage.v41
    public final Type getReturnType() {
        Class<?> returnType = this.b.getReturnType();
        returnType.getClass();
        return returnType;
    }
}
