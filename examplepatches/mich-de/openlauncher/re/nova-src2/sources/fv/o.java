package fv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56131t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ r f56132u;

    /* renamed from: v, reason: collision with root package name */
    public int f56133v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56132u = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56131t = obj;
        this.f56133v |= Integer.MIN_VALUE;
        Object objA = this.f56132u.a(null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
