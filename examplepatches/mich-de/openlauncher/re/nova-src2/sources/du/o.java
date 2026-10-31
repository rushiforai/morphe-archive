package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49573t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f49574u;

    /* renamed from: v, reason: collision with root package name */
    public int f49575v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49574u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49573t = obj;
        this.f49575v |= Integer.MIN_VALUE;
        Object objF = this.f49574u.f(null, null, this);
        return objF == CoroutineSingletons.f71806a ? objF : new Result(objF);
    }
}
