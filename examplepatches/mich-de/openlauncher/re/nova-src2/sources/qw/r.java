package qw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f84397t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ v f84398u;

    /* renamed from: v, reason: collision with root package name */
    public int f84399v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84398u = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84397t = obj;
        this.f84399v |= Integer.MIN_VALUE;
        Object objH = this.f84398u.h(null, this);
        return objH == CoroutineSingletons.f71806a ? objH : new Result(objH);
    }
}
