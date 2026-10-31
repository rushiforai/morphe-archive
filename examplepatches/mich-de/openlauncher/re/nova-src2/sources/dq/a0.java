package dq;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49291t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e0 f49292u;

    /* renamed from: v, reason: collision with root package name */
    public int f49293v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(e0 e0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49292u = e0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49291t = obj;
        this.f49293v |= Integer.MIN_VALUE;
        Object objB = this.f49292u.b(null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
