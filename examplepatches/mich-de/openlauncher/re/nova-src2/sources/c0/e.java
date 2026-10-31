package c0;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final i2 f18754a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f18755b;

    /* renamed from: c, reason: collision with root package name */
    public final n f18756c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f18757d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f18758e;

    /* renamed from: f, reason: collision with root package name */
    public final v0 f18759f;

    /* renamed from: g, reason: collision with root package name */
    public final l1 f18760g;

    /* renamed from: h, reason: collision with root package name */
    public final s f18761h;

    /* renamed from: i, reason: collision with root package name */
    public final s f18762i;

    /* renamed from: j, reason: collision with root package name */
    public final s f18763j;

    /* renamed from: k, reason: collision with root package name */
    public final s f18764k;

    public e(Object obj, i2 i2Var, Object obj2) {
        this.f18754a = i2Var;
        this.f18755b = obj2;
        n nVar = new n(i2Var, obj, null, 60);
        this.f18756c = nVar;
        this.f18757d = androidx.compose.runtime.d.k(Boolean.FALSE);
        this.f18758e = androidx.compose.runtime.d.k(obj);
        this.f18759f = new v0();
        this.f18760g = new l1(0.0f, 3, obj2);
        s sVar = nVar.f18879c;
        boolean z11 = sVar instanceof o;
        s sVar2 = z11 ? f.f18780e : sVar instanceof p ? f.f18781f : sVar instanceof q ? f.f18782g : f.f18783h;
        this.f18761h = sVar2;
        s sVar3 = z11 ? f.f18776a : sVar instanceof p ? f.f18777b : sVar instanceof q ? f.f18778c : f.f18779d;
        this.f18762i = sVar3;
        this.f18763j = sVar2;
        this.f18764k = sVar3;
    }

    public static final Object a(e eVar, Object obj) {
        i2 i2Var = eVar.f18754a;
        s sVar = eVar.f18764k;
        s sVar2 = eVar.f18763j;
        if (!Intrinsics.b(sVar2, eVar.f18761h) || !Intrinsics.b(sVar, eVar.f18762i)) {
            s sVar3 = (s) i2Var.f18832a.invoke(obj);
            int iB = sVar3.b();
            boolean z11 = false;
            for (int i5 = 0; i5 < iB; i5++) {
                if (sVar3.a(i5) < sVar2.a(i5) || sVar3.a(i5) > sVar.a(i5)) {
                    sVar3.e(kotlin.ranges.a.d0(sVar3.a(i5), sVar2.a(i5), sVar.a(i5)), i5);
                    z11 = true;
                }
            }
            if (z11) {
                return i2Var.f18833b.invoke(sVar3);
            }
        }
        return obj;
    }

    public static final void b(e eVar) {
        n nVar = eVar.f18756c;
        nVar.f18879c.d();
        nVar.f18880d = Long.MIN_VALUE;
        ((s2) eVar.f18757d).setValue(Boolean.FALSE);
    }

    public static Object d(e eVar, Object obj, m mVar, Function1 function1, Continuation continuation, int i5) {
        if ((i5 & 2) != 0) {
            mVar = eVar.f18760g;
        }
        m mVar2 = mVar;
        Object objInvoke = eVar.f18754a.f18833b.invoke(eVar.f18756c.f18879c);
        if ((i5 & 8) != 0) {
            function1 = null;
        }
        return eVar.c(obj, mVar2, objInvoke, function1, continuation);
    }

    public final Object c(Object obj, m mVar, Object obj2, Function1 function1, Continuation continuation) {
        Object objE = e();
        i2 i2Var = this.f18754a;
        return v0.a(this.f18759f, new b(this, obj2, new t1(mVar, i2Var, objE, obj, (s) i2Var.f18832a.invoke(obj2)), this.f18756c.f18880d, function1, null), continuation);
    }

    public final Object e() {
        return ((s2) this.f18756c.f18878b).getValue();
    }

    public final boolean f() {
        return ((Boolean) ((s2) this.f18757d).getValue()).booleanValue();
    }

    public final Object g(Object obj, Continuation continuation) {
        Object objA = v0.a(this.f18759f, new c(this, obj, null, 0), continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final Object h(SuspendLambda suspendLambda) {
        Object objA = v0.a(this.f18759f, new d(this, null, 0), suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public /* synthetic */ e(Object obj, i2 i2Var, Object obj2, int i5) {
        this(obj, i2Var, (i5 & 4) != 0 ? null : obj2);
    }
}
