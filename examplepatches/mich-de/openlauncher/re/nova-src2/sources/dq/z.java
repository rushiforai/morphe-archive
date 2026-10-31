package dq;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49378t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e0 f49379u;

    /* renamed from: v, reason: collision with root package name */
    public int f49380v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(e0 e0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49379u = e0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49378t = obj;
        this.f49380v |= Integer.MIN_VALUE;
        Object objA = this.f49379u.a(null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
