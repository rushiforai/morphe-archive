package ads_mobile_sdk;

import b.o2;
import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.q0;
import t70.x1;

/* loaded from: classes2.dex */
public final class e23 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f2720a;

    /* renamed from: b, reason: collision with root package name */
    public final b.w4 f2721b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f2722c;

    /* renamed from: d, reason: collision with root package name */
    public final d f2723d;

    /* renamed from: e, reason: collision with root package name */
    public x1 f2724e;

    public e23(t70.j0 backgroundScope, b.w4 dataStore, o2 clock) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(dataStore, "dataStore");
        Intrinsics.g(clock, "clock");
        this.f2720a = backgroundScope;
        this.f2721b = dataStore;
        this.f2722c = clock;
        this.f2723d = new d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r4v2, types: [t70.p0] */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(e23 e23Var, ContinuationImpl continuationImpl) {
        a23 a23Var;
        d dVar;
        Continuation continuation;
        if (continuationImpl instanceof a23) {
            a23Var = (a23) continuationImpl;
            int i5 = a23Var.f819e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a23Var.f819e = i5 - Integer.MIN_VALUE;
            } else {
                a23Var = new a23(e23Var, continuationImpl);
            }
        }
        Object obj = a23Var.f817c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a23Var.f819e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = e23Var.f2723d;
                a23Var.f815a = e23Var;
                a23Var.f816b = dVar;
                a23Var.f819e = 1;
                if (dVar.e(a23Var) != coroutineSingletons) {
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            d dVar2 = a23Var.f816b;
            e23 e23Var2 = a23Var.f815a;
            ResultKt.b(obj);
            dVar = dVar2;
            e23Var = e23Var2;
            x1 x1Var = e23Var.f2724e;
            ?? r42 = x1Var;
            if (x1Var == null) {
                q0 q0VarE = m0.e(e23Var.f2720a, null, new a60.d(e23Var, continuation, 1), 3);
                e23Var.f2724e = q0VarE;
                r42 = q0VarE;
            }
            dVar.g(null);
            a23Var.f815a = null;
            a23Var.f816b = null;
            a23Var.f819e = 2;
            Object objL = r42.l(a23Var);
            return objL == coroutineSingletons ? coroutineSingletons : objL;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
        continuation = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(e23 e23Var, String str, ContinuationImpl continuationImpl) {
        c23 c23Var;
        y13 y13Var;
        e23 e23Var2;
        d dVar;
        if (continuationImpl instanceof c23) {
            c23Var = (c23) continuationImpl;
            int i5 = c23Var.f1645f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c23Var.f1645f = i5 - Integer.MIN_VALUE;
            } else {
                c23Var = new c23(e23Var, continuationImpl);
            }
        }
        Object objA = c23Var.f1643d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c23Var.f1645f;
        try {
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) e23Var.f2721b.get();
            b10.k kVar = new b10.k(e23Var, str, (Continuation) null);
            c23Var.f1640a = e23Var;
            c23Var.f1645f = 1;
            objA = gVar.a(kVar, c23Var);
            if (objA == coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = c23Var.f1642c;
            y13Var = c23Var.f1641b;
            e23Var2 = c23Var.f1640a;
            ResultKt.b(objA);
            try {
                e23Var2.f2724e = m0.a(y13Var);
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        e23Var = c23Var.f1640a;
        ResultKt.b(objA);
        y13Var = (y13) objA;
        d dVar2 = e23Var.f2723d;
        c23Var.f1640a = e23Var;
        c23Var.f1641b = y13Var;
        c23Var.f1642c = dVar2;
        c23Var.f1645f = 2;
        if (dVar2.e(c23Var) != coroutineSingletons) {
            e23Var2 = e23Var;
            dVar = dVar2;
            e23Var2.f2724e = m0.a(y13Var);
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
