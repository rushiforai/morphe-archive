package ads_mobile_sdk;

import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ft1 {

    /* renamed from: a, reason: collision with root package name */
    public final d f3503a = new d();

    /* renamed from: b, reason: collision with root package name */
    public Object f3504b;

    public ft1(Object obj) {
        this.f3504b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        ct1 ct1Var;
        ft1 ft1Var;
        d dVar;
        if (continuationImpl instanceof ct1) {
            ct1Var = (ct1) continuationImpl;
            int i5 = ct1Var.f2016e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ct1Var.f2016e = i5 - Integer.MIN_VALUE;
            } else {
                ct1Var = new ct1(this, continuationImpl);
            }
        }
        Object obj = ct1Var.f2014c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ct1Var.f2016e;
        if (i11 == 0) {
            ResultKt.b(obj);
            ct1Var.f2012a = this;
            d dVar2 = this.f3503a;
            ct1Var.f2013b = dVar2;
            ct1Var.f2016e = 1;
            if (dVar2.e(ct1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            ft1Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = ct1Var.f2013b;
            ft1Var = ct1Var.f2012a;
            ResultKt.b(obj);
        }
        try {
            return ft1Var.f3504b;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x007c, code lost:
    
        if (((java.lang.Boolean) r2.invoke(r4)).booleanValue() != false) goto L28;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r8v0, types: [c0.d, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v16 */
    /* JADX WARN: Type inference failed for: r8v17 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(u uVar, c0.d dVar, ContinuationImpl continuationImpl) {
        dt1 dt1Var;
        Function1 function1;
        Object obj;
        Function1 function12;
        ft1 ft1Var;
        ft1 ft1Var2;
        Object obj2;
        if (continuationImpl instanceof dt1) {
            dt1Var = (dt1) continuationImpl;
            int i5 = dt1Var.f2628g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dt1Var.f2628g = i5 - Integer.MIN_VALUE;
            } else {
                dt1Var = new dt1(this, continuationImpl);
            }
        }
        Object objInvoke = dt1Var.f2626e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dt1Var.f2628g;
        try {
            if (i11 == 0) {
                ResultKt.b(objInvoke);
                dt1Var.f2622a = this;
                dt1Var.f2623b = uVar;
                dt1Var.f2624c = dVar;
                d dVar2 = this.f3503a;
                dt1Var.f2625d = dVar2;
                dt1Var.f2628g = 1;
                if (dVar2.e(dt1Var) != coroutineSingletons) {
                    function1 = dVar;
                    obj = dVar2;
                    function12 = uVar;
                    ft1Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ft1Var = (ft1) dt1Var.f2624c;
                Object obj3 = (c80.a) dt1Var.f2623b;
                ft1Var2 = dt1Var.f2622a;
                ResultKt.b(objInvoke);
                obj2 = obj3;
                ft1Var.f3504b = objInvoke;
                ft1Var = ft1Var2;
                dVar = obj2;
                Object obj4 = ft1Var.f3504b;
                Intrinsics.d(obj4);
                return obj4;
            }
            Object obj5 = dt1Var.f2625d;
            Function1 function13 = (Function1) dt1Var.f2624c;
            function12 = (Function1) dt1Var.f2623b;
            ft1 ft1Var3 = dt1Var.f2622a;
            ResultKt.b(objInvoke);
            function1 = function13;
            obj = obj5;
            ft1Var = ft1Var3;
            Object obj6 = ft1Var.f3504b;
            if (obj6 != null) {
                dVar = obj;
            }
            dt1Var.f2622a = ft1Var;
            dt1Var.f2623b = obj;
            dt1Var.f2624c = ft1Var;
            dt1Var.f2625d = null;
            dt1Var.f2628g = 2;
            objInvoke = function1.invoke(dt1Var);
            if (objInvoke != coroutineSingletons) {
                ft1Var2 = ft1Var;
                obj2 = obj;
                ft1Var.f3504b = objInvoke;
                ft1Var = ft1Var2;
                dVar = obj2;
                Object obj42 = ft1Var.f3504b;
                Intrinsics.d(obj42);
                return obj42;
            }
            return coroutineSingletons;
        } finally {
            ((d) dVar).g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Object obj, ContinuationImpl continuationImpl) {
        et1 et1Var;
        d dVar;
        ft1 ft1Var;
        if (continuationImpl instanceof et1) {
            et1Var = (et1) continuationImpl;
            int i5 = et1Var.f2999f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                et1Var.f2999f = i5 - Integer.MIN_VALUE;
            } else {
                et1Var = new et1(this, continuationImpl);
            }
        }
        Object obj2 = et1Var.f2997d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = et1Var.f2999f;
        if (i11 == 0) {
            ResultKt.b(obj2);
            et1Var.f2994a = this;
            et1Var.f2995b = obj;
            dVar = this.f3503a;
            et1Var.f2996c = dVar;
            et1Var.f2999f = 1;
            if (dVar.e(et1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            ft1Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = et1Var.f2996c;
            Object obj3 = et1Var.f2995b;
            ft1Var = et1Var.f2994a;
            ResultKt.b(obj2);
            dVar = dVar2;
            obj = obj3;
        }
        try {
            ft1Var.f3504b = obj;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
