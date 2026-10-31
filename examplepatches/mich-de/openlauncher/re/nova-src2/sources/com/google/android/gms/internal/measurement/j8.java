package com.google.android.gms.internal.measurement;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
public final class j8 implements cl.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32681a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f32682b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f32683c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f32684d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f32685e;

    public /* synthetic */ j8(Object obj, ListenableFuture listenableFuture, be beVar, Executor executor, int i5) {
        this.f32681a = i5;
        this.f32683c = obj;
        this.f32682b = listenableFuture;
        this.f32684d = beVar;
        this.f32685e = executor;
    }

    public f6 a(f6 f6Var) {
        return ((l6) this.f32683c).e(this, f6Var);
    }

    public f6 b(j8 j8Var, xa... xaVarArr) {
        f6 f6VarG = f6.Qo;
        for (xa xaVar : xaVarArr) {
            f6VarG = h.g(xaVar);
            gh.o((j8) this.f32684d);
            if ((f6VarG instanceof g6) || (f6VarG instanceof e6)) {
                f6VarG = ((l6) this.f32683c).e(j8Var, f6VarG);
            }
        }
        return f6VarG;
    }

    public f6 c(s1 s1Var) {
        f6 f6VarE = f6.Qo;
        Iterator itH = s1Var.h();
        while (itH.hasNext()) {
            f6VarE = ((l6) this.f32683c).e(this, s1Var.k(((Integer) itH.next()).intValue()));
            if (f6VarE instanceof x2) {
                break;
            }
        }
        return f6VarE;
    }

    @Override // cl.c0
    public ListenableFuture call() {
        int i5 = this.f32681a;
        Object obj = this.f32682b;
        cl.m0 m0Var = cl.m0.f20038a;
        int i11 = 4;
        Object obj2 = this.f32685e;
        Object obj3 = this.f32684d;
        Object obj4 = this.f32683c;
        switch (i5) {
            case 2:
                final vf vfVar = (vf) obj4;
                final int i12 = 0;
                final cl.u uVarF = cl.w0.f((ListenableFuture) obj, new sf(vfVar, i12), m0Var);
                final cl.u uVarF2 = cl.w0.f(uVarF, (be) obj3, (Executor) obj2);
                cl.d0 d0Var = new cl.d0() { // from class: com.google.android.gms.internal.measurement.uf
                    @Override // cl.d0
                    public final ListenableFuture apply(Object obj5) {
                        switch (i12) {
                            case 0:
                                vf vfVar2 = (vf) vfVar;
                                cl.u uVar = (cl.u) uVarF;
                                cl.u uVar2 = (cl.u) uVarF2;
                                if (cl.w0.a(uVar).equals(cl.w0.a(uVar2))) {
                                    return cl.w0.b(obj5);
                                }
                                be beVar = new be(2, vfVar2, uVar2);
                                int i13 = bh.f32414a;
                                cl.u uVarF3 = cl.w0.f(uVar2, new be(4, jg.a(), beVar), (cl.l1) vfVar2.f33152e);
                                synchronized (vfVar2.f33156i) {
                                }
                                return uVarF3;
                            default:
                                qf qfVar = (qf) vfVar;
                                return qfVar.f33009c.d((be) uVarF, (Executor) uVarF2);
                        }
                    }
                };
                int i13 = bh.f32414a;
                return cl.w0.f(uVarF2, new be(i11, jg.a(), d0Var), m0Var);
            default:
                final qf qfVar = (qf) obj4;
                final be beVar = (be) obj3;
                final Executor executor = (Executor) obj2;
                final int i14 = 1;
                cl.d0 d0Var2 = new cl.d0() { // from class: com.google.android.gms.internal.measurement.uf
                    @Override // cl.d0
                    public final ListenableFuture apply(Object obj5) {
                        switch (i14) {
                            case 0:
                                vf vfVar2 = (vf) qfVar;
                                cl.u uVar = (cl.u) beVar;
                                cl.u uVar2 = (cl.u) executor;
                                if (cl.w0.a(uVar).equals(cl.w0.a(uVar2))) {
                                    return cl.w0.b(obj5);
                                }
                                be beVar2 = new be(2, vfVar2, uVar2);
                                int i132 = bh.f32414a;
                                cl.u uVarF3 = cl.w0.f(uVar2, new be(4, jg.a(), beVar2), (cl.l1) vfVar2.f33152e);
                                synchronized (vfVar2.f33156i) {
                                }
                                return uVarF3;
                            default:
                                qf qfVar2 = (qf) qfVar;
                                return qfVar2.f33009c.d((be) beVar, (Executor) executor);
                        }
                    }
                };
                int i15 = bh.f32414a;
                return cl.w0.f((cl.s) obj, new be(i11, jg.a(), d0Var2), m0Var);
        }
    }

    public j8 d() {
        return new j8(this, (l6) this.f32683c);
    }

    public boolean e(String str) {
        if (((HashMap) this.f32684d).containsKey(str)) {
            return true;
        }
        j8 j8Var = (j8) this.f32682b;
        if (j8Var != null) {
            return j8Var.e(str);
        }
        return false;
    }

    public void f(String str, f6 f6Var) {
        j8 j8Var;
        HashMap map = (HashMap) this.f32684d;
        if (!map.containsKey(str) && (j8Var = (j8) this.f32682b) != null && j8Var.e(str)) {
            j8Var.f(str, f6Var);
        } else {
            if (((HashMap) this.f32685e).containsKey(str)) {
                return;
            }
            if (f6Var == null) {
                map.remove(str);
            } else {
                map.put(str, f6Var);
            }
        }
    }

    public void g(String str, f6 f6Var) {
        HashMap map = (HashMap) this.f32684d;
        if (((HashMap) this.f32685e).containsKey(str)) {
            return;
        }
        if (f6Var == null) {
            map.remove(str);
        } else {
            map.put(str, f6Var);
        }
    }

    public f6 h(String str) {
        HashMap map = (HashMap) this.f32684d;
        if (map.containsKey(str)) {
            return (f6) map.get(str);
        }
        j8 j8Var = (j8) this.f32682b;
        if (j8Var != null) {
            return j8Var.h(str);
        }
        throw new IllegalArgumentException(b.c0.E(str, " is not defined"));
    }

    public j8() {
        this.f32681a = 0;
        l6 l6Var = new l6(0);
        this.f32683c = l6Var;
        j8 j8Var = new j8(null, l6Var);
        this.f32684d = j8Var;
        this.f32682b = j8Var.d();
        d2 d2Var = new d2(4);
        this.f32685e = d2Var;
        j8Var.f("require", new lg(d2Var));
        ((HashMap) d2Var.f32451b).put("internal.platform", y7.f33252b);
        j8Var.f("runtime.counter", new s3(Double.valueOf(0.0d)));
    }

    public j8(j8 j8Var, l6 l6Var) {
        this.f32681a = 1;
        this.f32684d = new HashMap();
        this.f32685e = new HashMap();
        this.f32682b = j8Var;
        this.f32683c = l6Var;
    }
}
