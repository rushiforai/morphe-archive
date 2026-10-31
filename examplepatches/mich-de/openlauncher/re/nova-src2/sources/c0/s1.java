package c0;

import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import p1.s2;

/* loaded from: classes.dex */
public abstract class s1 {
    public static final Object a(float f11, float f12, float f13, m mVar, Function2 function2, SuspendLambda suspendLambda) {
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        i2 i2Var = f.f18784i;
        Float f14 = new Float(f11);
        Float f15 = new Float(f12);
        Float f16 = new Float(f13);
        Function1 function1 = i2Var.f18832a;
        s sVarC = (s) function1.invoke(f16);
        if (sVarC == null) {
            sVarC = ((s) function1.invoke(f14)).c();
        }
        s sVar = sVarC;
        Object objB = b(new n(i2Var, f14, sVar, 56), new t1(mVar, i2Var, f14, f15, sVar), Long.MIN_VALUE, new q1(function2, 0), suspendLambda);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (objB != coroutineSingletons) {
            objB = Unit.f71706a;
        }
        return objB == coroutineSingletons ? objB : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:65:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0176  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(n nVar, i iVar, long j11, final Function1 function1, ContinuationImpl continuationImpl) {
        r1 r1Var;
        final Ref.ObjectRef objectRef;
        final n nVar2;
        n nVar3;
        final float fH;
        Function1 function12;
        Ref.ObjectRef objectRef2;
        Object objS;
        Function1 function13;
        l lVar;
        l lVar2;
        Object objS2;
        final i iVar2 = iVar;
        if (continuationImpl instanceof r1) {
            r1Var = (r1) continuationImpl;
            int i5 = r1Var.f18945y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r1Var.f18945y = i5 - Integer.MIN_VALUE;
            } else {
                r1Var = new r1(continuationImpl);
            }
        }
        r1 r1Var2 = r1Var;
        Object obj = r1Var2.f18944x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r1Var2.f18945y;
        if (i11 == 0) {
            ResultKt.b(obj);
            final Object objF = iVar2.f(0L);
            final s sVarB = iVar2.b(0L);
            objectRef = new Ref.ObjectRef();
            if (j11 == Long.MIN_VALUE) {
                try {
                    fH = h(r1Var2.getContext());
                    nVar2 = nVar;
                } catch (CancellationException e3) {
                    e = e3;
                    nVar2 = nVar;
                }
                try {
                    function12 = new Function1() { // from class: c0.o1
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj2) {
                            long jLongValue = ((Long) obj2).longValue();
                            i iVar3 = iVar2;
                            i2 i2VarE = iVar3.e();
                            Object objG = iVar3.g();
                            n nVar4 = nVar2;
                            l lVar3 = new l(objF, i2VarE, sVarB, jLongValue, objG, jLongValue, new as.c(nVar4, 9));
                            s1.g(lVar3, jLongValue, fH, iVar3, nVar4, function1);
                            objectRef.f71863a = lVar3;
                            return Unit.f71706a;
                        }
                    };
                    objectRef2 = objectRef;
                } catch (CancellationException e11) {
                    e = e11;
                    nVar3 = nVar2;
                    lVar = (l) objectRef.f71863a;
                    if (lVar != null) {
                        ((s2) lVar.f18865i).setValue(Boolean.FALSE);
                    }
                    lVar2 = (l) objectRef.f71863a;
                    if (lVar2 != null && lVar2.f18863g == nVar3.f18880d) {
                        nVar3.f18882f = false;
                    }
                    throw e;
                }
                try {
                    r1Var2.f18940t = nVar2;
                    r1Var2.f18941u = iVar2;
                    r1Var2.f18942v = function1;
                    r1Var2.f18943w = objectRef2;
                    r1Var2.f18945y = 1;
                    if (iVar2.a()) {
                        objS = h0.a(function12, r1Var2);
                    } else {
                        objS = p1.b1.a(r1Var2.getContext()).s(new b00.w0(function12, 1), r1Var2);
                    }
                    if (objS != coroutineSingletons) {
                        function13 = function1;
                        nVar3 = nVar2;
                        objectRef = objectRef2;
                    }
                    return coroutineSingletons;
                } catch (CancellationException e12) {
                    e = e12;
                    nVar3 = nVar2;
                    objectRef = objectRef2;
                    lVar = (l) objectRef.f71863a;
                    if (lVar != null) {
                    }
                    lVar2 = (l) objectRef.f71863a;
                    if (lVar2 != null) {
                    }
                    throw e;
                }
            }
            objectRef2 = objectRef;
            try {
                l lVar3 = new l(objF, iVar2.e(), sVarB, j11, iVar2.g(), j11, new a7.f(nVar, 3));
                g(lVar3, j11, h(r1Var2.getContext()), iVar2, nVar, function1);
                objectRef2.f71863a = lVar3;
                nVar3 = nVar;
                iVar2 = iVar;
                function13 = function1;
                objectRef = objectRef2;
            } catch (CancellationException e13) {
                e = e13;
                nVar3 = nVar;
                objectRef = objectRef2;
                lVar = (l) objectRef.f71863a;
                if (lVar != null) {
                }
                lVar2 = (l) objectRef.f71863a;
                if (lVar2 != null) {
                }
                throw e;
            }
        } else {
            if (i11 != 1 && i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = r1Var2.f18943w;
            function13 = r1Var2.f18942v;
            iVar2 = r1Var2.f18941u;
            nVar3 = r1Var2.f18940t;
            try {
                ResultKt.b(obj);
            } catch (CancellationException e14) {
                e = e14;
                lVar = (l) objectRef.f71863a;
                if (lVar != null) {
                }
                lVar2 = (l) objectRef.f71863a;
                if (lVar2 != null) {
                    nVar3.f18882f = false;
                }
                throw e;
            }
        }
        do {
            Object obj2 = objectRef.f71863a;
            Intrinsics.d(obj2);
            if (!((Boolean) ((s2) ((l) obj2).f18865i).getValue()).booleanValue()) {
                return Unit.f71706a;
            }
            final float fH2 = h(r1Var2.getContext());
            final Ref.ObjectRef objectRef3 = objectRef;
            final Function1 function14 = function13;
            final i iVar3 = iVar2;
            final n nVar4 = nVar3;
            try {
                Function1 function15 = new Function1() { // from class: c0.p1
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj3) {
                        long jLongValue = ((Long) obj3).longValue();
                        Object obj4 = objectRef3.f71863a;
                        Intrinsics.d(obj4);
                        s1.g((l) obj4, jLongValue, fH2, iVar3, nVar4, function14);
                        return Unit.f71706a;
                    }
                };
                objectRef = objectRef3;
                iVar2 = iVar3;
                nVar3 = nVar4;
                function13 = function14;
                r1Var2.f18940t = nVar3;
                r1Var2.f18941u = iVar2;
                r1Var2.f18942v = function13;
                r1Var2.f18943w = objectRef;
                r1Var2.f18945y = 2;
                if (iVar2.a()) {
                    objS2 = h0.a(function15, r1Var2);
                } else {
                    objS2 = p1.b1.a(r1Var2.getContext()).s(new b00.w0(function15, 1), r1Var2);
                }
            } catch (CancellationException e15) {
                e = e15;
                objectRef = objectRef3;
                nVar3 = nVar4;
                lVar = (l) objectRef.f71863a;
                if (lVar != null) {
                }
                lVar2 = (l) objectRef.f71863a;
                if (lVar2 != null) {
                }
                throw e;
            }
        } while (objS2 != coroutineSingletons);
        return coroutineSingletons;
    }

    public static /* synthetic */ Object c(float f11, float f12, m mVar, Function2 function2, SuspendLambda suspendLambda, int i5) {
        if ((i5 & 8) != 0) {
            mVar = f.h(0.0f, 0.0f, null, 7);
        }
        return a(f11, f12, 0.0f, mVar, function2, suspendLambda);
    }

    public static final Object d(n nVar, y yVar, boolean z11, Function1 function1, ContinuationImpl continuationImpl) {
        Object objB = b(nVar, new x(yVar, nVar.f18877a, ((s2) nVar.f18878b).getValue(), nVar.f18879c), z11 ? nVar.f18880d : Long.MIN_VALUE, function1, continuationImpl);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    public static final Object e(n nVar, Float f11, m mVar, boolean z11, Function1 function1, ContinuationImpl continuationImpl) {
        Object objB = b(nVar, new t1(mVar, nVar.f18877a, ((s2) nVar.f18878b).getValue(), f11, nVar.f18879c), z11 ? nVar.f18880d : Long.MIN_VALUE, function1, continuationImpl);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    public static /* synthetic */ Object f(n nVar, Float f11, m mVar, boolean z11, Function1 function1, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 2) != 0) {
            mVar = f.h(0.0f, 0.0f, null, 7);
        }
        m mVar2 = mVar;
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        boolean z12 = z11;
        if ((i5 & 8) != 0) {
            function1 = new a00.a(11);
        }
        return e(nVar, f11, mVar2, z12, function1, continuationImpl);
    }

    public static final void g(l lVar, long j11, float f11, i iVar, n nVar, Function1 function1) {
        long jD = f11 == 0.0f ? iVar.d() : (long) ((j11 - lVar.f18859c) / f11);
        lVar.f18863g = j11;
        ((s2) lVar.f18861e).setValue(iVar.f(jD));
        lVar.f18862f = iVar.b(jD);
        if (iVar.c(jD)) {
            lVar.f18864h = lVar.f18863g;
            ((s2) lVar.f18865i).setValue(Boolean.FALSE);
        }
        i(lVar, nVar);
        function1.invoke(lVar);
    }

    public static final float h(CoroutineContext coroutineContext) {
        b2.v vVar = (b2.v) coroutineContext.get(b2.u.f17025a);
        float fP = vVar != null ? vVar.p() : 1.0f;
        if (fP >= 0.0f) {
            return fP;
        }
        w0.b("negative scale factor");
        return fP;
    }

    public static final void i(l lVar, n nVar) {
        ((s2) nVar.f18878b).setValue(((s2) lVar.f18861e).getValue());
        s sVar = nVar.f18879c;
        s sVar2 = lVar.f18862f;
        int iB = sVar.b();
        for (int i5 = 0; i5 < iB; i5++) {
            sVar.e(sVar2.a(i5), i5);
        }
        nVar.f18881e = lVar.f18864h;
        nVar.f18880d = lVar.f18863g;
        nVar.f18882f = ((Boolean) ((s2) lVar.f18865i).getValue()).booleanValue();
    }
}
