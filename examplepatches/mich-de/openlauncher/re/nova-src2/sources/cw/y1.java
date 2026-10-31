package cw;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* loaded from: classes4.dex */
public final class y1 implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48387a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.m f48388b;

    public /* synthetic */ y1(w70.m mVar, int i5) {
        this.f48387a = i5;
        this.f48388b = mVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0077  */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(w70.n nVar, Continuation continuation) {
        w70.l0 l0Var;
        AbortFlowException e3;
        Object obj;
        switch (this.f48387a) {
            case 0:
                Object objCollect = this.f48388b.collect(new x1(nVar, 0), continuation);
                return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
            case 1:
                Object objCollect2 = this.f48388b.collect(new x1(nVar, 1), continuation);
                return objCollect2 == CoroutineSingletons.f71806a ? objCollect2 : Unit.f71706a;
            case 2:
                Object objCollect3 = this.f48388b.collect(new x1(nVar, 4), continuation);
                return objCollect3 == CoroutineSingletons.f71806a ? objCollect3 : Unit.f71706a;
            case 3:
                Object objCollect4 = this.f48388b.collect(new x1(nVar, 5), continuation);
                return objCollect4 == CoroutineSingletons.f71806a ? objCollect4 : Unit.f71706a;
            case 4:
                Object objCollect5 = this.f48388b.collect(new x1(nVar, 14), continuation);
                return objCollect5 == CoroutineSingletons.f71806a ? objCollect5 : Unit.f71706a;
            case 5:
                Object objCollect6 = this.f48388b.collect(new x1(nVar, 15), continuation);
                return objCollect6 == CoroutineSingletons.f71806a ? objCollect6 : Unit.f71706a;
            case 6:
                Object objCollect7 = this.f48388b.collect(new x1(nVar, 18), continuation);
                return objCollect7 == CoroutineSingletons.f71806a ? objCollect7 : Unit.f71706a;
            case 7:
                Object objCollect8 = this.f48388b.collect(new x1(nVar, 19), continuation);
                return objCollect8 == CoroutineSingletons.f71806a ? objCollect8 : Unit.f71706a;
            case 8:
                Object objCollect9 = this.f48388b.collect(new x1(nVar, 20), continuation);
                return objCollect9 == CoroutineSingletons.f71806a ? objCollect9 : Unit.f71706a;
            case 9:
                if (continuation instanceof w70.l0) {
                    l0Var = (w70.l0) continuation;
                    int i5 = l0Var.f93954u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        l0Var.f93954u = i5 - Integer.MIN_VALUE;
                    } else {
                        l0Var = new w70.l0(this, continuation);
                    }
                }
                Object obj2 = l0Var.f93953t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = l0Var.f93954u;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    Object obj3 = new Object();
                    Ref.IntRef intRef = new Ref.IntRef();
                    try {
                        w70.m mVar = this.f48388b;
                        w70.n0 n0Var = new w70.n0(intRef, nVar, obj3);
                        l0Var.f93956w = obj3;
                        l0Var.f93954u = 1;
                        if (mVar.collect(n0Var, l0Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } catch (AbortFlowException e11) {
                        e3 = e11;
                        obj = obj3;
                        if (e3.f72062a != obj) {
                            throw e3;
                        }
                        return Unit.f71706a;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    obj = l0Var.f93956w;
                    try {
                        ResultKt.b(obj2);
                    } catch (AbortFlowException e12) {
                        e3 = e12;
                        if (e3.f72062a != obj) {
                        }
                        return Unit.f71706a;
                    }
                }
                return Unit.f71706a;
            default:
                Object objCollect10 = this.f48388b.collect(new x1(nVar, 23), continuation);
                return objCollect10 == CoroutineSingletons.f71806a ? objCollect10 : Unit.f71706a;
        }
    }
}
