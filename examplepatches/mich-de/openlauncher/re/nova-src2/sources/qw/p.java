package qw;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f84389t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ v f84390u;

    /* renamed from: v, reason: collision with root package name */
    public int f84391v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84390u = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84389t = obj;
        this.f84391v |= Integer.MIN_VALUE;
        Object objG = this.f84390u.g(null, 0, 0, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
