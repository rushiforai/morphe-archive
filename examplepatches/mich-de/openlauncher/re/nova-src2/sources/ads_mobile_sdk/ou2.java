package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class ou2 implements b.c7 {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f8016a;

    @Override // b.c7
    public final Object a(Continuation continuation) {
        lu2 lu2Var = this.f8016a;
        if (lu2Var == null) {
            return Unit.f71706a;
        }
        Object objA = lu2Var.a(continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.c7
    public final void a$1() {
        this.f8016a = null;
    }

    @Override // b.c7
    public final Object b(boolean z11, Continuation continuation) {
        Object objB;
        lu2 lu2Var = this.f8016a;
        return (lu2Var == null || (objB = lu2Var.b(z11, continuation)) != CoroutineSingletons.f71806a) ? Unit.f71706a : objB;
    }

    @Override // b.c7
    public final Object a(boolean z11, Continuation continuation) {
        lu2 lu2Var = this.f8016a;
        if (lu2Var == null) {
            return Unit.f71706a;
        }
        Object objA = lu2Var.a(z11, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
