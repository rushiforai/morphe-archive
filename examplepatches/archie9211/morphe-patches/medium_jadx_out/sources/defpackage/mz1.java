package defpackage;

import java.io.Serializable;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mz1 implements b55, c55, d55, e55, f55, g55, h55, i55, n45, o45, q45, r45, s45, t45, u45, v45, w45, y45, z45 {
    public final int a;
    public final boolean b;
    public Object c;
    public mwa d;
    public ArrayList e;

    public mz1(Object obj, boolean z, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
    }

    public final Object a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = i | (p65Var.f(this) ? pxf.h(2, 0) : pxf.h(1, 0));
        Object obj = this.c;
        obj.getClass();
        pwd.B(2, obj);
        Object objInvoke = ((b55) obj).invoke(p65Var, Integer.valueOf(iH));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lz1(2, this, mz1.class, "invoke", "invoke(Landroidx/compose/runtime/Composer;I)Ljava/lang/Object;", 8, 0);
        }
        return objInvoke;
    }

    public final Object d(Object obj, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = p65Var.f(this) ? pxf.h(2, 1) : pxf.h(1, 1);
        Object obj2 = this.c;
        obj2.getClass();
        pwd.B(3, obj2);
        Object objF = ((c55) obj2).f(obj, p65Var, Integer.valueOf(iH | i));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(this, obj, i, 5);
        }
        return objF;
    }

    @Override // defpackage.g55
    public final /* bridge */ /* synthetic */ Object e(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Serializable serializable) {
        return j(obj, obj2, obj3, obj4, obj5, (x12) obj6, ((Number) serializable).intValue());
    }

    @Override // defpackage.c55
    public final /* bridge */ /* synthetic */ Object f(Object obj, Object obj2, Object obj3) {
        return d(obj, (x12) obj2, ((Number) obj3).intValue());
    }

    public final Object g(Object obj, Object obj2, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = p65Var.f(this) ? pxf.h(2, 2) : pxf.h(1, 2);
        Object obj3 = this.c;
        obj3.getClass();
        pwd.B(4, obj3);
        Object objK = ((d55) obj3).k(obj, obj2, p65Var, Integer.valueOf(iH | i));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i, 10, this, obj, obj2);
        }
        return objK;
    }

    public final Object h(Object obj, Object obj2, Object obj3, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = p65Var.f(this) ? pxf.h(2, 3) : pxf.h(1, 3);
        Object obj4 = this.c;
        obj4.getClass();
        pwd.B(5, obj4);
        Object objS = ((e55) obj4).s(obj, obj2, obj3, p65Var, Integer.valueOf(iH | i));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i, 12, this, obj, obj2, obj3);
        }
        return objS;
    }

    public final Object i(Object obj, Object obj2, Object obj3, Object obj4, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = p65Var.f(this) ? pxf.h(2, 4) : pxf.h(1, 4);
        Object obj5 = this.c;
        obj5.getClass();
        pwd.B(6, obj5);
        Object objP = ((f55) obj5).p(obj, obj2, obj3, obj4, p65Var, Integer.valueOf(i | iH));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(this, obj, obj2, obj3, obj4, i, 5);
        }
        return objP;
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        return a((x12) obj, ((Number) obj2).intValue());
    }

    public final Object j(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = p65Var.f(this) ? pxf.h(2, 5) : pxf.h(1, 5);
        Object obj6 = this.c;
        obj6.getClass();
        pwd.B(7, obj6);
        Object objE = ((g55) obj6).e(obj, obj2, obj3, obj4, obj5, p65Var, Integer.valueOf(i | iH));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(this, obj, obj2, obj3, obj4, obj5, i, 1);
        }
        return objE;
    }

    @Override // defpackage.d55
    public final /* bridge */ /* synthetic */ Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        return g(obj, obj2, (x12) obj3, ((Number) obj4).intValue());
    }

    public final Object l(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(this.a);
        n(p65Var);
        int iH = p65Var.f(this) ? pxf.h(2, 6) : pxf.h(1, 6);
        Object obj7 = this.c;
        obj7.getClass();
        pwd.B(8, obj7);
        Object objQ = ((h55) obj7).q(obj, obj2, obj3, obj4, obj5, obj6, p65Var, Integer.valueOf(i | iH));
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(this, obj, obj2, obj3, obj4, obj5, obj6, i, 0);
        }
        return objQ;
    }

    public final void n(x12 x12Var) {
        mwa mwaVarY;
        if (!this.b || (mwaVarY = ((p65) x12Var).y()) == null) {
            return;
        }
        mwaVarY.b |= 1;
        if (pxf.F(this.d, mwaVarY)) {
            this.d = mwaVarY;
            return;
        }
        ArrayList arrayList = this.e;
        if (arrayList == null) {
            ArrayList arrayList2 = new ArrayList();
            this.e = arrayList2;
            arrayList2.add(mwaVarY);
            return;
        }
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (pxf.F((mwa) arrayList.get(i), mwaVarY)) {
                arrayList.set(i, mwaVarY);
                return;
            }
        }
        arrayList.add(mwaVarY);
    }

    @Override // defpackage.f55
    public final /* bridge */ /* synthetic */ Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        return i(obj, obj2, obj3, obj4, (x12) obj5, ((Number) obj6).intValue());
    }

    @Override // defpackage.h55
    public final /* bridge */ /* synthetic */ Object q(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Serializable serializable) {
        return l(obj, obj2, obj3, obj4, obj5, obj6, (x12) obj7, ((Number) serializable).intValue());
    }

    @Override // defpackage.e55
    public final /* bridge */ /* synthetic */ Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        return h(obj, obj2, obj3, (x12) obj4, ((Number) obj5).intValue());
    }
}
