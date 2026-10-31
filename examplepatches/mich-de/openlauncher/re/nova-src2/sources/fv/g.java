package fv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56112t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f56113u;

    /* renamed from: v, reason: collision with root package name */
    public int f56114v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56113u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56112t = obj;
        this.f56114v |= Integer.MIN_VALUE;
        Object objE = this.f56113u.e(null, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
