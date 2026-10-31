package cw;

import ads_mobile_sdk.go2;
import ads_mobile_sdk.wo2;
import e00.z4;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.functions.Function6;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* loaded from: classes4.dex */
public final class u0 implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48318a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f48319b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f48320c;

    public /* synthetic */ u0(int i5, Object obj, Object obj2) {
        this.f48318a = i5;
        this.f48319b = obj;
        this.f48320c = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x009a  */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(w70.n nVar, Continuation continuation) {
        w70.o0 o0Var;
        as.p pVar;
        switch (this.f48318a) {
            case 0:
                w70.m[] mVarArr = (w70.m[]) this.f48319b;
                Object objA = x70.b.a(continuation, new k0(mVarArr, 1), new bn.x0((Continuation) null, (w0) this.f48320c, 2), nVar, mVarArr);
                return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
            case 1:
                Object objCollect = ((w70.m) this.f48319b).collect(new go2(nVar, (wo2) this.f48320c), continuation);
                return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
            case 2:
                Object objCollect2 = ((w70.o1) this.f48319b).f93973a.collect(new as.p(4, nVar, (w70.o1) this.f48320c), continuation);
                return objCollect2 == CoroutineSingletons.f71806a ? objCollect2 : Unit.f71706a;
            case 3:
                Object objCollect3 = ((w70.m) this.f48319b).collect(new as.p(6, nVar, (fs.y) this.f48320c), continuation);
                return objCollect3 == CoroutineSingletons.f71806a ? objCollect3 : Unit.f71706a;
            case 4:
                w70.m[] mVarArr2 = (w70.m[]) this.f48319b;
                Object objA2 = x70.b.a(continuation, new k0(mVarArr2, 10), new bn.x0((Continuation) null, (fl.l) this.f48320c, 3), nVar, mVarArr2);
                return objA2 == CoroutineSingletons.f71806a ? objA2 : Unit.f71706a;
            case 5:
                w70.m[] mVarArr3 = (w70.m[]) this.f48319b;
                Object objA3 = x70.b.a(continuation, new k0(mVarArr3, 15), new bn.x0((Continuation) null, (Function5) this.f48320c, 5), nVar, mVarArr3);
                return objA3 == CoroutineSingletons.f71806a ? objA3 : Unit.f71706a;
            case 6:
                w70.m[] mVarArr4 = (w70.m[]) this.f48319b;
                Object objA4 = x70.b.a(continuation, new k0(mVarArr4, 16), new bn.x0((Continuation) null, (Function6) this.f48320c, 6), nVar, mVarArr4);
                return objA4 == CoroutineSingletons.f71806a ? objA4 : Unit.f71706a;
            case 7:
                Object objCollect4 = ((w70.m) this.f48319b).collect(new as.p(14, nVar, (Function1) this.f48320c), continuation);
                return objCollect4 == CoroutineSingletons.f71806a ? objCollect4 : Unit.f71706a;
            case 8:
                Object objCollect5 = ((w70.m) this.f48319b).collect(new as.p(15, nVar, (vs.o) this.f48320c), continuation);
                return objCollect5 == CoroutineSingletons.f71806a ? objCollect5 : Unit.f71706a;
            case 9:
                if (continuation instanceof w70.o0) {
                    o0Var = (w70.o0) continuation;
                    int i5 = o0Var.f93970u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        o0Var.f93970u = i5 - Integer.MIN_VALUE;
                    } else {
                        o0Var = new w70.o0(this, continuation);
                    }
                }
                Object obj = o0Var.f93969t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = o0Var.f93970u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    w70.z zVar = (w70.z) this.f48319b;
                    as.p pVar2 = new as.p(16, (z4) this.f48320c, nVar);
                    try {
                        o0Var.f93972w = pVar2;
                        o0Var.f93970u = 1;
                        if (zVar.collect(pVar2, o0Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } catch (AbortFlowException e3) {
                        e = e3;
                        pVar = pVar2;
                        if (e.f72062a == pVar) {
                        }
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    pVar = o0Var.f93972w;
                    try {
                        ResultKt.b(obj);
                    } catch (AbortFlowException e11) {
                        e = e11;
                        if (e.f72062a == pVar) {
                            throw e;
                        }
                        t70.m0.k(o0Var.getContext());
                        return Unit.f71706a;
                    }
                }
                return Unit.f71706a;
            case 10:
                Object objCollect6 = ((w70.m) this.f48319b).collect(new as.p(18, nVar, this.f48320c), continuation);
                return objCollect6 == CoroutineSingletons.f71806a ? objCollect6 : Unit.f71706a;
            default:
                Object objA5 = x70.b.a(continuation, w70.k1.f93950a, new bn.x0((Continuation) null, this.f48320c, 8), nVar, (w70.m[]) this.f48319b);
                return objA5 == CoroutineSingletons.f71806a ? objA5 : Unit.f71706a;
        }
    }
}
