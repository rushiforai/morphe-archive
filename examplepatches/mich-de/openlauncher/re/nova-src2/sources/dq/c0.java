package dq;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49298t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e0 f49299u;

    /* renamed from: v, reason: collision with root package name */
    public int f49300v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(e0 e0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49299u = e0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49298t = obj;
        this.f49300v |= Integer.MIN_VALUE;
        Object objD = this.f49299u.d(null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
