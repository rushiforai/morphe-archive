package ads_mobile_sdk;

import b.x1;
import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes.dex */
public final class h70 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f4229a;

    /* renamed from: b, reason: collision with root package name */
    public final d f4230b;

    /* renamed from: c, reason: collision with root package name */
    public a70 f4231c;

    public h70(b.w4 dataStore) {
        Intrinsics.g(dataStore, "dataStore");
        this.f4229a = dataStore;
        this.f4230b = new d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v7, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(h70 h70Var, ContinuationImpl continuationImpl) {
        c70 c70Var;
        d dVar;
        a70 a70VarP;
        d dVar2;
        h70 h70Var2;
        a70 a70Var;
        d dVar3;
        if (continuationImpl instanceof c70) {
            c70Var = (c70) continuationImpl;
            int i5 = c70Var.f1701f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c70Var.f1701f = i5 - Integer.MIN_VALUE;
            } else {
                c70Var = new c70(h70Var, continuationImpl);
            }
        }
        Object objQ = c70Var.f1699d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c70Var.f1701f;
        try {
            if (i11 == 0) {
                ResultKt.b(objQ);
                dVar = h70Var.f4230b;
                c70Var.f1696a = h70Var;
                c70Var.f1697b = dVar;
                c70Var.f1701f = 1;
                if (dVar.e(c70Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    dVar3 = c70Var.f1698c;
                    a70Var = (a70) c70Var.f1697b;
                    h70Var2 = c70Var.f1696a;
                    ResultKt.b(objQ);
                    try {
                        h70Var2.f4231c = a70Var;
                        Unit unit = Unit.f71706a;
                        dVar3.g(null);
                        Intrinsics.d(a70Var);
                        return a70Var;
                    } catch (Throwable th2) {
                        dVar3.g(null);
                        throw th2;
                    }
                }
                h70Var = c70Var.f1696a;
                ResultKt.b(objQ);
                a70VarP = (a70) objQ;
                if (a70VarP == null) {
                    a70VarP = a70.p();
                }
                dVar2 = h70Var.f4230b;
                c70Var.f1696a = h70Var;
                c70Var.f1697b = a70VarP;
                c70Var.f1698c = dVar2;
                c70Var.f1701f = 3;
                if (dVar2.e(c70Var) != coroutineSingletons) {
                    h70Var2 = h70Var;
                    a70Var = a70VarP;
                    dVar3 = dVar2;
                    h70Var2.f4231c = a70Var;
                    Unit unit2 = Unit.f71706a;
                    dVar3.g(null);
                    Intrinsics.d(a70Var);
                    return a70Var;
                }
                return coroutineSingletons;
            }
            ?? r72 = (c80.a) c70Var.f1697b;
            h70 h70Var3 = c70Var.f1696a;
            ResultKt.b(objQ);
            dVar = r72;
            h70Var = h70Var3;
            a70 a70Var2 = h70Var.f4231c;
            if (a70Var2 != null) {
                return a70Var2;
            }
            w70.m data = ((t5.g) h70Var.f4229a.get()).getData();
            c70Var.f1696a = h70Var;
            c70Var.f1697b = null;
            c70Var.f1701f = 2;
            objQ = u1.q(data, c70Var);
            if (objQ != coroutineSingletons) {
                a70VarP = (a70) objQ;
                if (a70VarP == null) {
                }
                dVar2 = h70Var.f4230b;
                c70Var.f1696a = h70Var;
                c70Var.f1697b = a70VarP;
                c70Var.f1698c = dVar2;
                c70Var.f1701f = 3;
                if (dVar2.e(c70Var) != coroutineSingletons) {
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
    public final Object a(ContinuationImpl continuationImpl) {
        d70 d70Var;
        h70 h70Var;
        h70 h70Var2;
        d dVar;
        a70 a70Var;
        if (continuationImpl instanceof d70) {
            d70Var = (d70) continuationImpl;
            int i5 = d70Var.f2199f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d70Var.f2199f = i5 - Integer.MIN_VALUE;
            } else {
                d70Var = new d70(this, continuationImpl);
            }
        }
        Object objA = d70Var.f2197d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d70Var.f2199f;
        int i12 = 0;
        try {
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) this.f4229a.get();
            x1 x1Var = new x1(i12);
            d70Var.f2194a = this;
            d70Var.f2199f = 1;
            objA = gVar.a(x1Var, d70Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            h70Var = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                dVar = d70Var.f2196c;
                a70Var = d70Var.f2195b;
                h70Var2 = d70Var.f2194a;
                ResultKt.b(objA);
                try {
                    h70Var2.f4231c = a70Var;
                    Unit unit = Unit.f71706a;
                    dVar.g(null);
                    return Unit.f71706a;
                } catch (Throwable th2) {
                    dVar.g(null);
                    throw th2;
                }
            }
            h70Var = d70Var.f2194a;
            ResultKt.b(objA);
        }
        a70 a70Var2 = (a70) objA;
        d dVar2 = h70Var.f4230b;
        d70Var.f2194a = h70Var;
        d70Var.f2195b = a70Var2;
        d70Var.f2196c = dVar2;
        d70Var.f2199f = 2;
        if (dVar2.e(d70Var) != coroutineSingletons) {
            h70Var2 = h70Var;
            dVar = dVar2;
            a70Var = a70Var2;
            h70Var2.f4231c = a70Var;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(h70 h70Var, a70 a70Var, ContinuationImpl continuationImpl) {
        f70 f70Var;
        a70 a70Var2;
        h70 h70Var2;
        d dVar;
        if (continuationImpl instanceof f70) {
            f70Var = (f70) continuationImpl;
            int i5 = f70Var.f3227f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f70Var.f3227f = i5 - Integer.MIN_VALUE;
            } else {
                f70Var = new f70(h70Var, continuationImpl);
            }
        }
        Object objA = f70Var.f3225d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f70Var.f3227f;
        Continuation continuation = null;
        try {
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
        }
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) h70Var.f4229a.get();
            androidx.room.c cVar = new androidx.room.c(a70Var, continuation, 6);
            f70Var.f3222a = h70Var;
            f70Var.f3227f = 1;
            objA = gVar.a(cVar, f70Var);
            if (objA == coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = f70Var.f3224c;
            a70Var2 = f70Var.f3223b;
            h70Var2 = f70Var.f3222a;
            ResultKt.b(objA);
            try {
                h70Var2.f4231c = a70Var2;
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        h70Var = f70Var.f3222a;
        ResultKt.b(objA);
        a70Var2 = (a70) objA;
        d dVar2 = h70Var.f4230b;
        f70Var.f3222a = h70Var;
        f70Var.f3223b = a70Var2;
        f70Var.f3224c = dVar2;
        f70Var.f3227f = 2;
        if (dVar2.e(f70Var) != coroutineSingletons) {
            h70Var2 = h70Var;
            dVar = dVar2;
            h70Var2.f4231c = a70Var2;
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
