package androidx.compose.runtime;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import b0.b0;
import c3.a4;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import p1.e1;
import p1.g1;
import p1.i0;
import p1.m2;
import p1.n;
import p1.o;
import p1.o0;
import p1.o2;
import p1.q2;
import p1.s;
import p1.t;
import p1.t2;
import p1.u2;
import p1.v2;
import w70.g2;
import w70.m;
import w70.p1;
import x7.u;

/* loaded from: classes.dex */
public abstract class d {
    public static final e1 a(m mVar, Object obj, CoroutineContext coroutineContext, o oVar, int i5, int i11) {
        if ((i11 & 2) != 0) {
            coroutineContext = EmptyCoroutineContext.f71803a;
        }
        t tVar = (t) oVar;
        boolean zH = tVar.h(coroutineContext) | tVar.h(mVar);
        Object objP = tVar.P();
        Continuation continuation = null;
        g1 g1Var = n.f81514a;
        if (zH || objP == g1Var) {
            objP = new b0(coroutineContext, mVar, continuation, 23);
            tVar.m0(objP);
        }
        Function2 function2 = (Function2) objP;
        Object objP2 = tVar.P();
        if (objP2 == g1Var) {
            objP2 = k(obj);
            tVar.m0(objP2);
        }
        e1 e1Var = (e1) objP2;
        boolean zH2 = tVar.h(function2);
        Object objP3 = tVar.P();
        if (zH2 || objP3 == g1Var) {
            objP3 = new v2(function2, e1Var, continuation, 1);
            tVar.m0(objP3);
        }
        o0.e(mVar, coroutineContext, (Function2) objP3, tVar);
        return e1Var;
    }

    public static final e1 b(g2 g2Var, o oVar, int i5) {
        return a(g2Var, g2Var.getValue(), EmptyCoroutineContext.f71803a, oVar, (i5 & 14) | ((i5 << 3) & 896), 0);
    }

    public static final r1.e c() {
        u uVar = u2.f81599b;
        r1.e eVar = (r1.e) uVar.h();
        if (eVar != null) {
            return eVar;
        }
        r1.e eVar2 = new r1.e(new s[0]);
        uVar.u(eVar2);
        return eVar2;
    }

    public static final i0 d(Function0 function0) {
        u uVar = u2.f81598a;
        return new i0(function0, null);
    }

    public static final i0 e(Function0 function0, t2 t2Var) {
        u uVar = u2.f81598a;
        return new i0(function0, t2Var);
    }

    public static final m2 f(float f11) {
        return new ParcelableSnapshotMutableFloatState(f11);
    }

    public static final o2 g(int i5) {
        return new ParcelableSnapshotMutableIntState(i5);
    }

    public static final q2 h(long j11) {
        return new ParcelableSnapshotMutableLongState(j11);
    }

    public static final SnapshotStateList i(Object... objArr) {
        SnapshotStateList snapshotStateList = new SnapshotStateList();
        snapshotStateList.addAll(kotlin.collections.c.b1(objArr));
        return snapshotStateList;
    }

    public static final e1 j(Object obj, t2 t2Var) {
        return new ParcelableSnapshotMutableState(obj, t2Var);
    }

    public static e1 k(Object obj) {
        return new ParcelableSnapshotMutableState(obj, g1.f81425e);
    }

    public static final e1 l(Object obj, Function2 function2, o oVar) {
        t tVar = (t) oVar;
        Object objP = tVar.P();
        g1 g1Var = n.f81514a;
        if (objP == g1Var) {
            objP = k(obj);
            tVar.m0(objP);
        }
        e1 e1Var = (e1) objP;
        Unit unit = Unit.f71706a;
        boolean zH = tVar.h(function2);
        Object objP2 = tVar.P();
        if (zH || objP2 == g1Var) {
            objP2 = new v2(function2, e1Var, null, 0);
            tVar.m0(objP2);
        }
        o0.f(unit, (Function2) objP2, tVar);
        return e1Var;
    }

    public static final e1 m(Object obj, o oVar) {
        t tVar = (t) oVar;
        Object objP = tVar.P();
        if (objP == n.f81514a) {
            objP = k(obj);
            tVar.m0(objP);
        }
        e1 e1Var = (e1) objP;
        e1Var.setValue(obj);
        return e1Var;
    }

    public static final p1 n(Function0 function0) {
        return new p1(new a4(function0, null));
    }
}
