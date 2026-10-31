package ads_mobile_sdk;

import b.c3;
import c80.d;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public abstract class tk0 implements c3 {

    /* renamed from: a, reason: collision with root package name */
    public final d f9972a = new d();

    /* renamed from: c, reason: collision with root package name */
    public re1 f9973c;

    @Override // b.c3
    public final Object a(String str, String str2, ContinuationImpl continuationImpl) {
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        return a(new b00.q(str, str2, uuidRandomUUID, (Continuation) null, 3), continuationImpl);
    }

    public abstract Object a(String str, Continuation continuation);

    /* JADX WARN: Code restructure failed: missing block: B:19:0x004d, code lost:
    
        if (r7.c(r0) == r1) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x005c, code lost:
    
        if (r2.a(r6, r0) == r1) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x005e, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(re1 re1Var, ContinuationImpl continuationImpl) {
        hk0 hk0Var;
        tk0 tk0Var;
        if (continuationImpl instanceof hk0) {
            hk0Var = (hk0) continuationImpl;
            int i5 = hk0Var.f4422e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hk0Var.f4422e = i5 - Integer.MIN_VALUE;
            } else {
                hk0Var = new hk0(this, continuationImpl);
            }
        }
        Object obj = hk0Var.f4420c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hk0Var.f4422e;
        if (i11 == 0) {
            ResultKt.b(obj);
            re1 re1Var2 = this.f9973c;
            this.f9973c = re1Var;
            if (re1Var2 != null) {
                hk0Var.f4418a = this;
                hk0Var.f4419b = re1Var;
                hk0Var.f4422e = 1;
            }
            tk0Var = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            re1Var = hk0Var.f4419b;
            tk0Var = hk0Var.f4418a;
            ResultKt.b(obj);
        }
        hk0Var.f4418a = null;
        hk0Var.f4419b = null;
        hk0Var.f4422e = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(re1 re1Var, ContinuationImpl continuationImpl) throws Throwable {
        ik0 ik0Var;
        d dVar;
        tk0 tk0Var;
        Throwable th2;
        c80.a aVar;
        if (continuationImpl instanceof ik0) {
            ik0Var = (ik0) continuationImpl;
            int i5 = ik0Var.f4817f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ik0Var.f4817f = i5 - Integer.MIN_VALUE;
            } else {
                ik0Var = new ik0(this, continuationImpl);
            }
        }
        Object obj = ik0Var.f4815d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ik0Var.f4817f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                ik0Var.f4812a = this;
                ik0Var.f4813b = re1Var;
                dVar = this.f9972a;
                ik0Var.f4814c = dVar;
                ik0Var.f4817f = 1;
                if (dVar.e(ik0Var) != coroutineSingletons) {
                    tk0Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = (c80.a) ik0Var.f4812a;
                try {
                    ResultKt.b(obj);
                    Unit unit = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((d) aVar).g(null);
                    throw th2;
                }
            }
            d dVar2 = ik0Var.f4814c;
            re1 re1Var2 = ik0Var.f4813b;
            tk0Var = (tk0) ik0Var.f4812a;
            ResultKt.b(obj);
            dVar = dVar2;
            re1Var = re1Var2;
            ik0Var.f4812a = dVar;
            ik0Var.f4813b = null;
            ik0Var.f4814c = null;
            ik0Var.f4817f = 2;
            if (tk0Var.b(re1Var, ik0Var) != coroutineSingletons) {
                aVar = dVar;
                Unit unit2 = Unit.f71706a;
                ((d) aVar).g(null);
                return unit2;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            d dVar3 = dVar;
            th2 = th4;
            aVar = dVar3;
            ((d) aVar).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) throws Throwable {
        nk0 nk0Var;
        if (continuationImpl instanceof nk0) {
            nk0Var = (nk0) continuationImpl;
            int i5 = nk0Var.f7625c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nk0Var.f7625c = i5 - Integer.MIN_VALUE;
            } else {
                nk0Var = new nk0(this, continuationImpl);
            }
        }
        Object objB = nk0Var.f7623a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = nk0Var.f7625c;
        if (i11 == 0) {
            ResultKt.b(objB);
            nk0Var.f7625c = 1;
            objB = b(nk0Var);
            if (objB == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
        }
        return Unit.f71706a;
    }

    @Override // b.c3
    public final Object a(com.google.gson.r rVar, Continuation continuation) throws Throwable {
        Object objA = a(new b00.e(rVar, (Continuation) null, 10), continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00a1 A[Catch: all -> 0x00b7, PHI: r11 r12
      0x00a1: PHI (r11v10 ??) = (r11v22 ??), (r11v23 ??) binds: [B:40:0x009e, B:21:0x004d] A[DONT_GENERATE, DONT_INLINE]
      0x00a1: PHI (r12v13 java.lang.Object) = (r12v12 java.lang.Object), (r12v1 java.lang.Object) binds: [B:40:0x009e, B:21:0x004d] A[DONT_GENERATE, DONT_INLINE], TRY_LEAVE, TryCatch #0 {all -> 0x00b7, blocks: (B:21:0x004d, B:42:0x00a1, B:24:0x0057, B:39:0x0094), top: B:56:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v10, types: [ads_mobile_sdk.re1] */
    /* JADX WARN: Type inference failed for: r11v22 */
    /* JADX WARN: Type inference failed for: r11v23 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b00.q qVar, ContinuationImpl continuationImpl) throws Throwable {
        ok0 ok0Var;
        Function2 function2;
        Function2 function22;
        re1 re1Var;
        if (continuationImpl instanceof ok0) {
            ok0Var = (ok0) continuationImpl;
            int i5 = ok0Var.f7957e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ok0Var.f7957e = i5 - Integer.MIN_VALUE;
            } else {
                ok0Var = new ok0(this, continuationImpl);
            }
        }
        Object objB = ok0Var.f7955c;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = ok0Var.f7957e;
        Continuation continuation = null;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        if (i11 == 0) {
            ResultKt.b(objB);
            ok0Var.f7953a = qVar;
            ok0Var.f7957e = 1;
            objB = b(ok0Var);
            function2 = qVar;
            if (objB != obj) {
            }
        }
        if (i11 != 1) {
            if (i11 == 2) {
                re1 re1Var2 = ok0Var.f7954b;
                Function2 function23 = (Function2) ok0Var.f7953a;
                ResultKt.b(objB);
                function22 = function23;
                re1Var = re1Var2;
                ok0Var.f7953a = re1Var;
                ok0Var.f7954b = null;
                ok0Var.f7957e = 3;
                objB = function22.invoke(re1Var, ok0Var);
                qVar = re1Var;
                if (objB == obj) {
                    b.a1 a1Var = (b.a1) objB;
                    t70.c2 c2Var = t70.c2.f88780b;
                    pe1 pe1Var = new pe1(qVar, continuation, 1);
                    ok0Var.f7953a = a1Var;
                    ok0Var.f7957e = 4;
                    if (m0.y(c2Var, pe1Var, ok0Var) != obj) {
                    }
                }
            }
            if (i11 != 3) {
                if (i11 == 4) {
                    b.a1 a1Var2 = (b.a1) ok0Var.f7953a;
                    ResultKt.b(objB);
                    return a1Var2;
                }
                if (i11 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Throwable th3 = (Throwable) ok0Var.f7953a;
                ResultKt.b(objB);
                throw th3;
            }
            re1 re1Var3 = (re1) ok0Var.f7953a;
            ResultKt.b(objB);
            qVar = re1Var3;
            b.a1 a1Var3 = (b.a1) objB;
            t70.c2 c2Var2 = t70.c2.f88780b;
            pe1 pe1Var2 = new pe1(qVar, continuation, 1);
            ok0Var.f7953a = a1Var3;
            ok0Var.f7957e = 4;
            return m0.y(c2Var2, pe1Var2, ok0Var) != obj ? obj : a1Var3;
        }
        Function2 function24 = (Function2) ok0Var.f7953a;
        ResultKt.b(objB);
        function2 = function24;
        b.a1 a1Var4 = (b.a1) objB;
        if (a1Var4 instanceof pu0) {
            return (pu0) a1Var4;
        }
        Intrinsics.e(a1Var4, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        re1 re1Var4 = (re1) ((xu0) a1Var4).f11834b;
        try {
            ok0Var.f7953a = function2;
            ok0Var.f7954b = re1Var4;
            ok0Var.f7957e = 2;
            if (re1Var4.d(ok0Var) != obj) {
                function22 = function2;
                re1Var = re1Var4;
                ok0Var.f7953a = re1Var;
                ok0Var.f7954b = null;
                ok0Var.f7957e = 3;
                objB = function22.invoke(re1Var, ok0Var);
                qVar = re1Var;
                if (objB == obj) {
                }
            }
        } catch (Throwable th4) {
            th = th4;
            qVar = re1Var4;
            t70.c2 c2Var3 = t70.c2.f88780b;
            pe1 pe1Var3 = new pe1(qVar, continuation, 1);
            ok0Var.f7953a = th;
            ok0Var.f7954b = null;
            ok0Var.f7957e = 5;
            if (m0.y(c2Var3, pe1Var3, ok0Var) != obj) {
                throw th;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a0 A[Catch: all -> 0x00c9, TryCatch #2 {all -> 0x00c9, blocks: (B:21:0x004a, B:44:0x009a, B:46:0x00a0, B:47:0x00a3), top: B:64:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a3 A[Catch: all -> 0x00c9, TRY_LEAVE, TryCatch #2 {all -> 0x00c9, blocks: (B:21:0x004a, B:44:0x009a, B:46:0x00a0, B:47:0x00a3), top: B:64:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v13, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) throws Throwable {
        lk0 lk0Var;
        d dVar;
        tk0 tk0Var;
        c80.a aVar;
        Throwable th2;
        c80.a aVar2;
        tk0 tk0Var2;
        tx0 tx0Var;
        AtomicBoolean atomicBoolean;
        re1 re1Var;
        b.a1 a1Var;
        Object xu0Var;
        if (continuationImpl instanceof lk0) {
            lk0Var = (lk0) continuationImpl;
            int i5 = lk0Var.f6265e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lk0Var.f6265e = i5 - Integer.MIN_VALUE;
            } else {
                lk0Var = new lk0(this, continuationImpl);
            }
        }
        Object obj = lk0Var.f6263c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lk0Var.f6265e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                lk0Var.f6261a = this;
                dVar = this.f9972a;
                lk0Var.f6262b = dVar;
                lk0Var.f6265e = 1;
                if (dVar.e(lk0Var) != coroutineSingletons) {
                    tk0Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    re1Var = (re1) lk0Var.f6262b;
                    aVar = (c80.a) lk0Var.f6261a;
                    try {
                        ResultKt.b(obj);
                        xu0Var = new xu0(re1Var);
                        aVar2 = aVar;
                        ((d) aVar2).g(null);
                        return xu0Var;
                    } catch (Throwable th3) {
                        th2 = th3;
                        aVar2 = aVar;
                        ((d) aVar2).g(null);
                        throw th2;
                    }
                }
                aVar2 = (c80.a) lk0Var.f6262b;
                tk0Var2 = (tk0) lk0Var.f6261a;
                try {
                    ResultKt.b(obj);
                    a1Var = (b.a1) obj;
                    if (a1Var instanceof pu0) {
                        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                        re1 re1Var2 = (re1) ((xu0) a1Var).f11834b;
                        lk0Var.f6261a = aVar2;
                        lk0Var.f6262b = re1Var2;
                        lk0Var.f6265e = 3;
                        if (tk0Var2.b(re1Var2, lk0Var) != coroutineSingletons) {
                            re1Var = re1Var2;
                            aVar = aVar2;
                            xu0Var = new xu0(re1Var);
                            aVar2 = aVar;
                            ((d) aVar2).g(null);
                            return xu0Var;
                        }
                        return coroutineSingletons;
                    }
                    xu0Var = (pu0) a1Var;
                    ((d) aVar2).g(null);
                    return xu0Var;
                } catch (Throwable th4) {
                    th2 = th4;
                    ((d) aVar2).g(null);
                    throw th2;
                }
            }
            ?? r22 = (c80.a) lk0Var.f6262b;
            tk0Var = (tk0) lk0Var.f6261a;
            ResultKt.b(obj);
            dVar = r22;
            re1 re1Var3 = tk0Var.f9973c;
            if (re1Var3 != null && (tx0Var = re1Var3.f9121a) != null && (atomicBoolean = tx0Var.f10131k) != null && !atomicBoolean.get()) {
                aVar = dVar;
                re1Var = re1Var3;
                xu0Var = new xu0(re1Var);
                aVar2 = aVar;
                ((d) aVar2).g(null);
                return xu0Var;
            }
            lk0Var.f6261a = tk0Var;
            lk0Var.f6262b = dVar;
            lk0Var.f6265e = 2;
            Object objA = tk0Var.a((String) null, lk0Var);
            if (objA != coroutineSingletons) {
                aVar2 = dVar;
                obj = objA;
                tk0Var2 = tk0Var;
                a1Var = (b.a1) obj;
                if (a1Var instanceof pu0) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th5) {
            aVar = dVar;
            th2 = th5;
            aVar2 = aVar;
            ((d) aVar2).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        mk0 mk0Var;
        tk0 tk0Var;
        d dVar;
        tx0 tx0Var;
        AtomicBoolean atomicBoolean;
        if (continuationImpl instanceof mk0) {
            mk0Var = (mk0) continuationImpl;
            int i5 = mk0Var.f7248e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mk0Var.f7248e = i5 - Integer.MIN_VALUE;
            } else {
                mk0Var = new mk0(this, continuationImpl);
            }
        }
        Object obj = mk0Var.f7246c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mk0Var.f7248e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            mk0Var.f7244a = this;
            d dVar2 = this.f9972a;
            mk0Var.f7245b = dVar2;
            mk0Var.f7248e = 1;
            if (dVar2.e(mk0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            tk0Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = mk0Var.f7245b;
            tk0Var = mk0Var.f7244a;
            ResultKt.b(obj);
        }
        try {
            re1 re1Var = tk0Var.f9973c;
            if (re1Var == null || (tx0Var = re1Var.f9121a) == null || (atomicBoolean = tx0Var.f10131k) == null || atomicBoolean.get()) {
                z11 = false;
            }
            Boolean boolValueOf = Boolean.valueOf(z11);
            dVar.g(null);
            return boolValueOf;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x00af, code lost:
    
        if (t70.m0.y(r12, r2, r0) != r1) goto L44;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x009e A[PHI: r11
      0x009e: PHI (r11v10 ads_mobile_sdk.re1) = (r11v9 ads_mobile_sdk.re1), (r11v17 ads_mobile_sdk.re1) binds: [B:39:0x009b, B:20:0x004a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r10v0, types: [ads_mobile_sdk.tk0] */
    /* JADX WARN: Type inference failed for: r11v14, types: [kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r12v9, types: [ads_mobile_sdk.re1] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b00.e eVar, Continuation continuation) throws Throwable {
        qk0 qk0Var;
        b00.e eVar2;
        Function2 function2;
        re1 re1Var;
        if (continuation instanceof qk0) {
            qk0Var = (qk0) continuation;
            int i5 = qk0Var.f8713e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qk0Var.f8713e = i5 - Integer.MIN_VALUE;
            } else {
                qk0Var = new qk0(this, continuation);
            }
        }
        Object objB = qk0Var.f8711c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qk0Var.f8713e;
        Continuation continuation2 = null;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        if (i11 == 0) {
            ResultKt.b(objB);
            qk0Var.f8709a = eVar;
            qk0Var.f8713e = 1;
            objB = b(qk0Var);
            eVar2 = eVar;
            if (objB != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ?? r11 = (Function2) qk0Var.f8709a;
            ResultKt.b(objB);
            eVar2 = r11;
        } else {
            if (i11 == 2) {
                re1Var = qk0Var.f8710b;
                function2 = (Function2) qk0Var.f8709a;
                ResultKt.b(objB);
                qk0Var.f8709a = re1Var;
                qk0Var.f8710b = null;
                qk0Var.f8713e = 3;
                if (function2.invoke(re1Var, qk0Var) != coroutineSingletons) {
                    t70.c2 c2Var = t70.c2.f88780b;
                    a60.d dVar = new a60.d(re1Var, continuation2, 15);
                    qk0Var.f8709a = null;
                    qk0Var.f8713e = 4;
                }
                return coroutineSingletons;
            }
            if (i11 != 3) {
                if (i11 == 4) {
                    ResultKt.b(objB);
                    return Unit.f71706a;
                }
                if (i11 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Throwable th3 = (Throwable) qk0Var.f8709a;
                ResultKt.b(objB);
                throw th3;
            }
            re1Var = (re1) qk0Var.f8709a;
            ResultKt.b(objB);
            t70.c2 c2Var2 = t70.c2.f88780b;
            a60.d dVar2 = new a60.d(re1Var, continuation2, 15);
            qk0Var.f8709a = null;
            qk0Var.f8713e = 4;
        }
        b.a1 a1Var = (b.a1) objB;
        if (a1Var instanceof pu0) {
            return Unit.f71706a;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        ?? r12 = (re1) ((xu0) a1Var).f11834b;
        try {
            qk0Var.f8709a = eVar2;
            qk0Var.f8710b = r12;
            qk0Var.f8713e = 2;
            if (r12.d(qk0Var) != coroutineSingletons) {
                function2 = eVar2;
                re1Var = r12;
                qk0Var.f8709a = re1Var;
                qk0Var.f8710b = null;
                qk0Var.f8713e = 3;
                if (function2.invoke(re1Var, qk0Var) != coroutineSingletons) {
                }
            }
        } catch (Throwable th4) {
            th = th4;
            eVar = r12;
            t70.c2 c2Var3 = t70.c2.f88780b;
            a60.d dVar3 = new a60.d(eVar, continuation2, 15);
            qk0Var.f8709a = th;
            qk0Var.f8710b = null;
            qk0Var.f8713e = 5;
            if (m0.y(c2Var3, dVar3, qk0Var) != coroutineSingletons) {
                throw th;
            }
            return coroutineSingletons;
        }
        return coroutineSingletons;
    }

    public Object a(re1 re1Var, Continuation continuation) {
        return Unit.f71706a;
    }
}
