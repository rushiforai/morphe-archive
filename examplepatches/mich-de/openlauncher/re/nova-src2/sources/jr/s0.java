package jr;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t0 f69734t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f69735u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ t0 f69736v;

    /* renamed from: w, reason: collision with root package name */
    public int f69737w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s0(t0 t0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f69736v = t0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f69735u = obj;
        this.f69737w |= Integer.MIN_VALUE;
        Object objB = this.f69736v.b(this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
