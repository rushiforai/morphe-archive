package ads_mobile_sdk;

import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes.dex */
public final class q43 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f8491a;

    /* renamed from: b, reason: collision with root package name */
    public final d f8492b;

    /* renamed from: c, reason: collision with root package name */
    public k43 f8493c;

    public q43(b.w4 dataStore) {
        Intrinsics.g(dataStore, "dataStore");
        this.f8491a = dataStore;
        this.f8492b = new d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v7, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(q43 q43Var, ContinuationImpl continuationImpl) {
        l43 l43Var;
        d dVar;
        k43 k43VarO;
        d dVar2;
        q43 q43Var2;
        k43 k43Var;
        d dVar3;
        if (continuationImpl instanceof l43) {
            l43Var = (l43) continuationImpl;
            int i5 = l43Var.f6075f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l43Var.f6075f = i5 - Integer.MIN_VALUE;
            } else {
                l43Var = new l43(q43Var, continuationImpl);
            }
        }
        Object objQ = l43Var.f6073d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l43Var.f6075f;
        try {
            if (i11 == 0) {
                ResultKt.b(objQ);
                dVar = q43Var.f8492b;
                l43Var.f6070a = q43Var;
                l43Var.f6071b = dVar;
                l43Var.f6075f = 1;
                if (dVar.e(l43Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    dVar3 = l43Var.f6072c;
                    k43Var = (k43) l43Var.f6071b;
                    q43Var2 = l43Var.f6070a;
                    ResultKt.b(objQ);
                    try {
                        q43Var2.f8493c = k43Var;
                        Unit unit = Unit.f71706a;
                        dVar3.g(null);
                        Intrinsics.d(k43Var);
                        return k43Var;
                    } catch (Throwable th2) {
                        dVar3.g(null);
                        throw th2;
                    }
                }
                q43Var = l43Var.f6070a;
                ResultKt.b(objQ);
                k43VarO = (k43) objQ;
                if (k43VarO == null) {
                    k43VarO = k43.o();
                }
                dVar2 = q43Var.f8492b;
                l43Var.f6070a = q43Var;
                l43Var.f6071b = k43VarO;
                l43Var.f6072c = dVar2;
                l43Var.f6075f = 3;
                if (dVar2.e(l43Var) != coroutineSingletons) {
                    q43Var2 = q43Var;
                    k43Var = k43VarO;
                    dVar3 = dVar2;
                    q43Var2.f8493c = k43Var;
                    Unit unit2 = Unit.f71706a;
                    dVar3.g(null);
                    Intrinsics.d(k43Var);
                    return k43Var;
                }
                return coroutineSingletons;
            }
            ?? r72 = (c80.a) l43Var.f6071b;
            q43 q43Var3 = l43Var.f6070a;
            ResultKt.b(objQ);
            dVar = r72;
            q43Var = q43Var3;
            k43 k43Var2 = q43Var.f8493c;
            if (k43Var2 != null) {
                return k43Var2;
            }
            w70.m data = ((t5.g) q43Var.f8491a.get()).getData();
            l43Var.f6070a = q43Var;
            l43Var.f6071b = null;
            l43Var.f6075f = 2;
            objQ = u1.q(data, l43Var);
            if (objQ != coroutineSingletons) {
                k43VarO = (k43) objQ;
                if (k43VarO == null) {
                }
                dVar2 = q43Var.f8492b;
                l43Var.f6070a = q43Var;
                l43Var.f6071b = k43VarO;
                l43Var.f6072c = dVar2;
                l43Var.f6075f = 3;
                if (dVar2.e(l43Var) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(q43 q43Var, ContinuationImpl continuationImpl) {
        m43 m43Var;
        if (continuationImpl instanceof m43) {
            m43Var = (m43) continuationImpl;
            int i5 = m43Var.f7009c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m43Var.f7009c = i5 - Integer.MIN_VALUE;
            } else {
                m43Var = new m43(q43Var, continuationImpl);
            }
        }
        Object objA = m43Var.f7007a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m43Var.f7009c;
        if (i11 == 0) {
            ResultKt.b(objA);
            m43Var.f7009c = 1;
            q43Var.getClass();
            objA = a(q43Var, m43Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        return new Integer(((k43) objA).q());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(q43 q43Var, Function1 function1, ContinuationImpl continuationImpl) {
        o43 o43Var;
        k43 k43Var;
        q43 q43Var2;
        d dVar;
        if (continuationImpl instanceof o43) {
            o43Var = (o43) continuationImpl;
            int i5 = o43Var.f7765f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o43Var.f7765f = i5 - Integer.MIN_VALUE;
            } else {
                o43Var = new o43(q43Var, continuationImpl);
            }
        }
        Object objA = o43Var.f7763d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o43Var.f7765f;
        int i12 = 1;
        Continuation continuation = null;
        try {
        } catch (Throwable th2) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Failed to update shared settings: " + th2, null);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) q43Var.f8491a.get();
            i1 i1Var = new i1(function1, continuation, i12);
            o43Var.f7760a = q43Var;
            o43Var.f7765f = 1;
            objA = gVar.a(i1Var, o43Var);
            if (objA == coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = o43Var.f7762c;
            k43Var = o43Var.f7761b;
            q43Var2 = o43Var.f7760a;
            ResultKt.b(objA);
            try {
                q43Var2.f8493c = k43Var;
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return Unit.f71706a;
            } catch (Throwable th3) {
                dVar.g(null);
                throw th3;
            }
        }
        q43Var = o43Var.f7760a;
        ResultKt.b(objA);
        k43Var = (k43) objA;
        d dVar2 = q43Var.f8492b;
        o43Var.f7760a = q43Var;
        o43Var.f7761b = k43Var;
        o43Var.f7762c = dVar2;
        o43Var.f7765f = 2;
        if (dVar2.e(o43Var) != coroutineSingletons) {
            q43Var2 = q43Var;
            dVar = dVar2;
            q43Var2.f8493c = k43Var;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
