package x70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class y implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final v70.a0 f95275a;

    public y(v70.x xVar) {
        this.f95275a = xVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        Object objT = this.f95275a.t(obj, continuation);
        return objT == CoroutineSingletons.f71806a ? objT : Unit.f71706a;
    }
}
