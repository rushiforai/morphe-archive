package w70;

import ads_mobile_sdk.ps1;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.so2;
import ads_mobile_sdk.xo2;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.yo2;
import b.fb;
import b.pd;
import b.zb;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* loaded from: classes.dex */
public final class v0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94047a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f94048b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f94049c;

    public /* synthetic */ v0(int i5, Object obj, Object obj2) {
        this.f94047a = i5;
        this.f94048b = obj;
        this.f94049c = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b9  */
    /* JADX WARN: Type inference failed for: r4v2, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) throws Throwable {
        u0 u0Var;
        v0 v0Var;
        ps1 ps1Var;
        Object objY;
        switch (this.f94047a) {
            case 0:
                if (continuation instanceof u0) {
                    u0Var = (u0) continuation;
                    int i5 = u0Var.f94038v;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        u0Var.f94038v = i5 - Integer.MIN_VALUE;
                    } else {
                        u0Var = new u0(this, continuation);
                    }
                }
                Object objInvoke = u0Var.f94037u;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = u0Var.f94038v;
                if (i11 == 0) {
                    ResultKt.b(objInvoke);
                    Function2 function2 = (Function2) this.f94048b;
                    u0Var.f94036t = this;
                    u0Var.f94040x = obj;
                    u0Var.f94038v = 1;
                    objInvoke = function2.invoke(obj, u0Var);
                    if (objInvoke == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    v0Var = this;
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    obj = u0Var.f94040x;
                    v0Var = u0Var.f94036t;
                    ResultKt.b(objInvoke);
                }
                if (!((Boolean) objInvoke).booleanValue()) {
                    return Unit.f71706a;
                }
                ((Ref.ObjectRef) v0Var.f94049c).f71863a = obj;
                throw new AbortFlowException(v0Var);
            case 1:
                if (continuation instanceof ps1) {
                    ps1Var = (ps1) continuation;
                    int i12 = ps1Var.f8373b;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        ps1Var.f8373b = i12 - Integer.MIN_VALUE;
                    } else {
                        ps1Var = new ps1(this, continuation);
                    }
                }
                Object obj2 = ps1Var.f8372a;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = ps1Var.f8373b;
                if (i13 == 0) {
                    ResultKt.b(obj2);
                    n nVar = (n) this.f94048b;
                    b.a1 xu0Var = (b.a1) obj;
                    if (xu0Var instanceof xu0) {
                        xu0Var = new xu0(((zb) this.f94049c).f16043c.invoke(((xu0) xu0Var).f11834b));
                    } else if (!(xu0Var instanceof pu0)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    ps1Var.f8373b = 1;
                    if (nVar.emit(xu0Var, ps1Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            default:
                fb fbVar = (fb) this.f94049c;
                CoroutineContext coroutineContext = (CoroutineContext) this.f94048b;
                pd pdVar = (pd) obj;
                Continuation continuation2 = null;
                if (!(pdVar instanceof yo2)) {
                    return ((pdVar instanceof xo2) && (objY = t70.m0.y(coroutineContext, new so2(fbVar, pdVar, continuation2, 2), continuation)) == CoroutineSingletons.f71806a) ? objY : Unit.f71706a;
                }
                Object objY2 = t70.m0.y(coroutineContext, new so2(fbVar, pdVar, continuation2, 0), continuation);
                return objY2 == CoroutineSingletons.f71806a ? objY2 : Unit.f71706a;
        }
    }
}
