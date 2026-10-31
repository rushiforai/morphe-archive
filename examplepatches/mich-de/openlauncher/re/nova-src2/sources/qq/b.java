package qq;

import hv.g3;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g3 f84314t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f84315u;

    /* renamed from: v, reason: collision with root package name */
    public int f84316v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84315u = obj;
        this.f84316v |= Integer.MIN_VALUE;
        Object objB = c.b(null, 0L, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
