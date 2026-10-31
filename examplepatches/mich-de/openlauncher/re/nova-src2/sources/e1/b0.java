package e1;

import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public abstract class b0 {
    /* JADX WARN: Removed duplicated region for block: B:17:0x0042 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0040 -> B:18:0x0043). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(v2.b bVar, BaseContinuationImpl baseContinuationImpl) {
        w wVar;
        int size;
        int i5;
        if (baseContinuationImpl instanceof w) {
            wVar = (w) baseContinuationImpl;
            int i11 = wVar.f51404v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                wVar.f51404v = i11 - Integer.MIN_VALUE;
            } else {
                wVar = new w(baseContinuationImpl);
            }
        }
        Object objF = wVar.f51403u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = wVar.f51404v;
        if (i12 == 0) {
            ResultKt.b(objF);
            v2.n nVar = v2.n.f91981b;
            wVar.f51402t = bVar;
            wVar.f51404v = 1;
            v2.j0 j0Var = (v2.j0) bVar;
            objF = j0Var.f(nVar, wVar);
            bVar = j0Var;
            if (objF == coroutineSingletons) {
            }
            v2.m mVar = (v2.m) objF;
            List list = mVar.f91975a;
            size = list.size();
            i5 = 0;
            while (i5 < size) {
            }
            return mVar;
        }
        if (i12 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        v2.b bVar2 = wVar.f51402t;
        ResultKt.b(objF);
        bVar = bVar2;
        v2.m mVar2 = (v2.m) objF;
        List list2 = mVar2.f91975a;
        size = list2.size();
        i5 = 0;
        while (i5 < size) {
            if (v2.g0.b((v2.t) list2.get(i5))) {
                i5++;
            } else {
                v2.n nVar2 = v2.n.f91981b;
                wVar.f51402t = bVar;
                wVar.f51404v = 1;
                v2.j0 j0Var2 = (v2.j0) bVar;
                objF = j0Var2.f(nVar2, wVar);
                bVar = j0Var2;
                if (objF == coroutineSingletons) {
                    return coroutineSingletons;
                }
                v2.m mVar22 = (v2.m) objF;
                List list22 = mVar22.f91975a;
                size = list22.size();
                i5 = 0;
                while (i5 < size) {
                }
            }
        }
        return mVar22;
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(v2.b bVar, w0 w0Var, c00.d dVar, v2.m mVar, BaseContinuationImpl baseContinuationImpl) {
        x xVar;
        a5.i iVar;
        boolean z11;
        Ref.BooleanRef booleanRef;
        Object objC;
        t0.y0 y0Var;
        int size;
        v2.b bVar2 = bVar;
        w0 w0Var2 = w0Var;
        a5.i iVar2 = t.f51384d;
        if (baseContinuationImpl instanceof x) {
            xVar = (x) baseContinuationImpl;
            int i5 = xVar.f51412x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f51412x = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(baseContinuationImpl);
            }
        }
        x xVar2 = xVar;
        Object obj = xVar2.f51411w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar2.f51412x;
        int i12 = 0;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar.y(mVar);
            v2.t tVar = (v2.t) mVar.f91975a.get(0);
            int iO = dVar.o();
            if (iO != 1) {
                iVar = iO != 2 ? t.f51386f : t.f51385e;
            } else {
                iVar = iVar2;
            }
            long jE = tVar.e();
            int iO2 = dVar.o();
            a1 a1Var = (a1) w0Var2.f51407c;
            if (!a1Var.l() || a1Var.o().f85471a.f75880b.length() == 0 || (y0Var = a1Var.f51232d) == null || y0Var.d() == null) {
                z11 = false;
            } else {
                g2.s sVar = a1Var.f51239k;
                if (sVar != null) {
                    g2.s.c(sVar);
                }
                a1Var.n = jE;
                a1Var.f51245s = -1;
                z11 = true;
                a1Var.j(true);
                long jB = w0Var2.b(a1Var.o(), a1Var.n, true, iVar);
                if (iO2 >= 2) {
                    w0Var2.f51405a = true;
                    w0Var2.f51406b = new m3.o0(jB);
                }
            }
            if (z11) {
                booleanRef = new Ref.BooleanRef();
                booleanRef.f71859a = !iVar.equals(iVar2);
                long jD = tVar.d();
                b10.q qVar = new b10.q(12, w0Var2, iVar, booleanRef);
                xVar2.f51408t = bVar2;
                xVar2.f51409u = w0Var2;
                xVar2.f51410v = booleanRef;
                xVar2.f51412x = 2;
                objC = g0.x.c(bVar2, jD, qVar, xVar2);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
                if (((Boolean) objC).booleanValue()) {
                    List list = ((v2.j0) bVar2).f91952f.f91969e.f91975a;
                    size = list.size();
                    while (i12 < size) {
                    }
                }
                w0Var2.a();
            }
        } else if (i11 == 1) {
            w0 w0Var3 = xVar2.f51409u;
            v2.b bVar3 = xVar2.f51408t;
            ResultKt.b(obj);
            if (((Boolean) obj).booleanValue()) {
                List list2 = ((v2.j0) bVar3).f91952f.f91969e.f91975a;
                int size2 = list2.size();
                while (i12 < size2) {
                    v2.t tVar2 = (v2.t) list2.get(i12);
                    if (v2.g0.c(tVar2)) {
                        tVar2.a();
                    }
                    i12++;
                }
            }
            w0Var3.a();
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.BooleanRef booleanRef2 = xVar2.f51410v;
            w0Var2 = xVar2.f51409u;
            v2.b bVar4 = xVar2.f51408t;
            ResultKt.b(obj);
            booleanRef = booleanRef2;
            bVar2 = bVar4;
            objC = obj;
            if (((Boolean) objC).booleanValue() && booleanRef.f71859a) {
                List list3 = ((v2.j0) bVar2).f91952f.f91969e.f91975a;
                size = list3.size();
                while (i12 < size) {
                    v2.t tVar3 = (v2.t) list3.get(i12);
                    if (v2.g0.c(tVar3)) {
                        tVar3.a();
                    }
                    i12++;
                }
            }
            w0Var2.a();
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00b1, code lost:
    
        if (r14 == r1) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(v2.b bVar, t0.g1 g1Var, v2.m mVar, BaseContinuationImpl baseContinuationImpl) {
        z zVar;
        v2.t tVar;
        if (baseContinuationImpl instanceof z) {
            zVar = (z) baseContinuationImpl;
            int i5 = zVar.f51424x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zVar.f51424x = i5 - Integer.MIN_VALUE;
            } else {
                zVar = new z(baseContinuationImpl);
            }
        }
        Object objB = zVar.f51423w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zVar.f51424x;
        boolean z11 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(objB);
                tVar = (v2.t) b70.g.W0(mVar.f91975a);
                long jD = tVar.d();
                zVar.f51420t = bVar;
                zVar.f51421u = g1Var;
                zVar.f51422v = tVar;
                zVar.f51424x = 1;
                objB = g0.x.b(bVar, jD, zVar);
                if (objB == coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                g1Var = zVar.f51421u;
                bVar = zVar.f51420t;
                ResultKt.b(objB);
                if (((Boolean) objB).booleanValue()) {
                    List list = ((v2.j0) bVar).f91952f.f91969e.f91975a;
                    int size = list.size();
                    for (int i12 = 0; i12 < size; i12++) {
                        v2.t tVar2 = (v2.t) list.get(i12);
                        if (v2.g0.c(tVar2)) {
                            tVar2.a();
                        }
                    }
                    g1Var.onStop();
                } else {
                    g1Var.onCancel();
                }
                return Unit.f71706a;
            }
            v2.t tVar3 = zVar.f51422v;
            g1Var = zVar.f51421u;
            v2.b bVar2 = zVar.f51420t;
            ResultKt.b(objB);
            tVar = tVar3;
            bVar = bVar2;
            v2.t tVar4 = (v2.t) objB;
            if (tVar4 != null) {
                if (h2.b.c(h2.b.f(tVar.e(), tVar4.e())) >= g0.x.e(((v2.j0) bVar).f91952f.E(), tVar.j())) {
                    z11 = false;
                }
                if (z11) {
                    g1Var.b(tVar4.e());
                    long jD2 = tVar4.d();
                    v vVar = new v(g1Var, 0);
                    zVar.f51420t = bVar;
                    zVar.f51421u = g1Var;
                    zVar.f51422v = null;
                    zVar.f51424x = 2;
                    objB = g0.x.c(bVar, jD2, vVar, zVar);
                }
            }
            return Unit.f71706a;
        } catch (CancellationException e3) {
            g1Var.onCancel();
            throw e3;
        }
    }

    public static final boolean d(v2.m mVar) {
        List list = mVar.f91975a;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (!v2.g0.f(((v2.t) list.get(i5)).j(), 2)) {
                return false;
            }
        }
        return true;
    }
}
