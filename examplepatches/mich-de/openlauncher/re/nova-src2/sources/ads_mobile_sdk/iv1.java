package ads_mobile_sdk;

import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes.dex */
public final class iv1 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final b.w4 f4954c;

    /* renamed from: d, reason: collision with root package name */
    public final d f4955d;

    /* renamed from: e, reason: collision with root package name */
    public zu1 f4956e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iv1(b.w4 dataStore) {
        super(wv0.CUI_NAME_SDKINIT_INIT_NATIVE_AD_SETTINGS, false);
        Intrinsics.g(dataStore, "dataStore");
        this.f4954c = dataStore;
        this.f4955d = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, ContinuationImpl continuationImpl, boolean z11) {
        gv1 gv1Var;
        iv1 iv1Var;
        zu1 zu1Var;
        iv1 iv1Var2;
        d dVar;
        if (continuationImpl instanceof gv1) {
            gv1Var = (gv1) continuationImpl;
            int i5 = gv1Var.f4096f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gv1Var.f4096f = i5 - Integer.MIN_VALUE;
            } else {
                gv1Var = new gv1(this, continuationImpl);
            }
        }
        Object objA = gv1Var.f4094d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gv1Var.f4096f;
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) this.f4954c.get();
            hv1 hv1Var = new hv1(str, z11, null);
            gv1Var.f4091a = this;
            gv1Var.f4096f = 1;
            objA = gVar.a(hv1Var, gv1Var);
            if (objA != coroutineSingletons) {
                iv1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = gv1Var.f4093c;
            zu1Var = gv1Var.f4092b;
            iv1Var2 = gv1Var.f4091a;
            ResultKt.b(objA);
            try {
                iv1Var2.f4956e = zu1Var;
                return Unit.f71706a;
            } finally {
                dVar.g(null);
            }
        }
        iv1Var = gv1Var.f4091a;
        ResultKt.b(objA);
        zu1Var = (zu1) objA;
        d dVar2 = iv1Var.f4955d;
        gv1Var.f4091a = iv1Var;
        gv1Var.f4092b = zu1Var;
        gv1Var.f4093c = dVar2;
        gv1Var.f4096f = 2;
        if (dVar2.e(gv1Var) != coroutineSingletons) {
            iv1Var2 = iv1Var;
            dVar = dVar2;
            iv1Var2.f4956e = zu1Var;
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, ContinuationImpl continuationImpl) {
        cv1 cv1Var;
        if (continuationImpl instanceof cv1) {
            cv1Var = (cv1) continuationImpl;
            int i5 = cv1Var.f2038d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cv1Var.f2038d = i5 - Integer.MIN_VALUE;
            } else {
                cv1Var = new cv1(this, continuationImpl);
            }
        }
        Object objR = cv1Var.f2036b;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = cv1Var.f2038d;
        if (i11 == 0) {
            ResultKt.b(objR);
            cv1Var.f2035a = str;
            cv1Var.f2038d = 1;
            objR = r(cv1Var);
            if (objR == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = cv1Var.f2035a;
            ResultKt.b(objR);
        }
        return ((zu1) objR).o().get(str);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(long j11, ContinuationImpl continuationImpl) {
        ev1 ev1Var;
        iv1 iv1Var;
        zu1 zu1Var;
        iv1 iv1Var2;
        d dVar;
        if (continuationImpl instanceof ev1) {
            ev1Var = (ev1) continuationImpl;
            int i5 = ev1Var.f3013f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ev1Var.f3013f = i5 - Integer.MIN_VALUE;
            } else {
                ev1Var = new ev1(this, continuationImpl);
            }
        }
        Object objA = ev1Var.f3011d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ev1Var.f3013f;
        if (i11 == 0) {
            ResultKt.b(objA);
            t5.g gVar = (t5.g) this.f4954c.get();
            fv1 fv1Var = new fv1(j11, null);
            ev1Var.f3008a = this;
            ev1Var.f3013f = 1;
            objA = gVar.a(fv1Var, ev1Var);
            if (objA != coroutineSingletons) {
                iv1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = ev1Var.f3010c;
            zu1Var = ev1Var.f3009b;
            iv1Var2 = ev1Var.f3008a;
            ResultKt.b(objA);
            try {
                iv1Var2.f4956e = zu1Var;
                return Unit.f71706a;
            } finally {
                dVar.g(null);
            }
        }
        iv1Var = ev1Var.f3008a;
        ResultKt.b(objA);
        zu1Var = (zu1) objA;
        d dVar2 = iv1Var.f4955d;
        ev1Var.f3008a = iv1Var;
        ev1Var.f3009b = zu1Var;
        ev1Var.f3010c = dVar2;
        ev1Var.f3013f = 2;
        if (dVar2.e(ev1Var) != coroutineSingletons) {
            iv1Var2 = iv1Var;
            dVar = dVar2;
            iv1Var2.f4956e = zu1Var;
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0080 A[Catch: all -> 0x0035, TryCatch #0 {all -> 0x0035, blocks: (B:13:0x0031, B:28:0x007c, B:30:0x0080, B:31:0x0089), top: B:38:0x0031 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v14, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r2v8, types: [c80.a] */
    @Override // ads_mobile_sdk.c61
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(Continuation continuation) throws Throwable {
        dv1 dv1Var;
        d dVar;
        iv1 iv1Var;
        ?? r02;
        iv1 iv1Var2;
        zu1 zu1VarQ;
        if (continuation instanceof dv1) {
            dv1Var = (dv1) continuation;
            int i5 = dv1Var.f2640e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dv1Var.f2640e = i5 - Integer.MIN_VALUE;
            } else {
                dv1Var = new dv1(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = dv1Var.f2638c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dv1Var.f2640e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dv1Var.f2636a = this;
                dVar = this.f4955d;
                dv1Var.f2637b = dVar;
                dv1Var.f2640e = 1;
                if (dVar.e(dv1Var) != coroutineSingletons) {
                    iv1Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                iv1Var2 = (iv1) dv1Var.f2637b;
                r02 = (c80.a) dv1Var.f2636a;
                try {
                    ResultKt.b(obj);
                    r02 = r02;
                    zu1VarQ = (zu1) obj;
                    if (zu1VarQ == null) {
                        zu1VarQ = zu1.q();
                        Intrinsics.f(zu1VarQ, "getDefaultInstance(...)");
                    }
                    iv1Var2.f4956e = zu1VarQ;
                    Unit unit = Unit.f71706a;
                    ((d) r02).g(null);
                    return new xu0(unit);
                } catch (Throwable th2) {
                    d dVar2 = r02;
                    th = th2;
                    dVar = dVar2;
                    dVar.g(null);
                    throw th;
                }
            }
            ?? r22 = (c80.a) dv1Var.f2637b;
            iv1Var = (iv1) dv1Var.f2636a;
            ResultKt.b(obj);
            dVar = r22;
            w70.m data = ((t5.g) iv1Var.f4954c.get()).getData();
            dv1Var.f2636a = dVar;
            dv1Var.f2637b = iv1Var;
            dv1Var.f2640e = 2;
            Object objQ = u1.q(data, dv1Var);
            if (objQ != coroutineSingletons) {
                r02 = dVar;
                obj = objQ;
                iv1Var2 = iv1Var;
                zu1VarQ = (zu1) obj;
                if (zu1VarQ == null) {
                }
                iv1Var2.f4956e = zu1VarQ;
                Unit unit2 = Unit.f71706a;
                ((d) r02).g(null);
                return new xu0(unit2);
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            dVar.g(null);
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Continuation continuation) {
        av1 av1Var;
        if (continuation instanceof av1) {
            av1Var = (av1) continuation;
            int i5 = av1Var.f1143c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                av1Var.f1143c = i5 - Integer.MIN_VALUE;
            } else {
                av1Var = new av1(this, (ContinuationImpl) continuation);
            }
        }
        Object objR = av1Var.f1141a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = av1Var.f1143c;
        if (i11 == 0) {
            ResultKt.b(objR);
            av1Var.f1143c = 1;
            objR = r(av1Var);
            if (objR == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objR);
        }
        return new Long(((zu1) objR).p());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object r(ContinuationImpl continuationImpl) {
        bv1 bv1Var;
        iv1 iv1Var;
        d dVar;
        if (continuationImpl instanceof bv1) {
            bv1Var = (bv1) continuationImpl;
            int i5 = bv1Var.f1579e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bv1Var.f1579e = i5 - Integer.MIN_VALUE;
            } else {
                bv1Var = new bv1(this, continuationImpl);
            }
        }
        Object obj = bv1Var.f1577c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bv1Var.f1579e;
        if (i11 == 0) {
            ResultKt.b(obj);
            bv1Var.f1575a = this;
            d dVar2 = this.f4955d;
            bv1Var.f1576b = dVar2;
            bv1Var.f1579e = 1;
            if (dVar2.e(bv1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            iv1Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = bv1Var.f1576b;
            iv1Var = bv1Var.f1575a;
            ResultKt.b(obj);
        }
        try {
            zu1 zu1Var = iv1Var.f4956e;
            if (zu1Var != null) {
                return zu1Var;
            }
            Intrinsics.m("nativeAdSettings");
            throw null;
        } finally {
            dVar.g(null);
        }
    }
}
