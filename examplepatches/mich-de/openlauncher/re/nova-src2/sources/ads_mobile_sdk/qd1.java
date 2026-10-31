package ads_mobile_sdk;

import b.fb;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import ni.v;

/* loaded from: classes.dex */
public final class qd1 extends fb {

    /* renamed from: a, reason: collision with root package name */
    public final ni.g f8594a;

    /* renamed from: b, reason: collision with root package name */
    public final mx.e f8595b;

    public qd1(ni.g gVar, mx.e eVar) {
        this.f8594a = gVar;
        this.f8595b = eVar;
    }

    @Override // b.fb
    public final void a() {
    }

    @Override // b.fb
    public final void a(v vVar) {
        this.f8594a.onAdFailedToLoad(vVar);
    }

    @Override // b.fb
    public final /* bridge */ /* synthetic */ Object a(b.ja jaVar, SuspendLambda suspendLambda) {
        return a((od1) jaVar, (ContinuationImpl) suspendLambda);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(od1 od1Var, ContinuationImpl continuationImpl) {
        pd1 pd1Var;
        ni.g gVar;
        if (continuationImpl instanceof pd1) {
            pd1Var = (pd1) continuationImpl;
            int i5 = pd1Var.f8227d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pd1Var.f8227d = i5 - Integer.MIN_VALUE;
            } else {
                pd1Var = new pd1(this, continuationImpl);
            }
        }
        Object obj = pd1Var.f8225b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pd1Var.f8227d;
        if (i11 == 0) {
            ResultKt.b(obj);
            ni.g gVar2 = this.f8594a;
            pd1Var.f8224a = gVar2;
            pd1Var.f8227d = 1;
            Object objInvoke = this.f8595b.invoke(od1Var, pd1Var);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
            obj = objInvoke;
            gVar = gVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            gVar = pd1Var.f8224a;
            ResultKt.b(obj);
        }
        gVar.onAdLoaded(obj);
        return Unit.f71706a;
    }
}
