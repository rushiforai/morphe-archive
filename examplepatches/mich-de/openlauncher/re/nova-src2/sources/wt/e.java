package wt;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94674t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f f94675u;

    /* renamed from: v, reason: collision with root package name */
    public int f94676v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f94675u = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94674t = obj;
        this.f94676v |= Integer.MIN_VALUE;
        Object objJ = this.f94675u.j(null, this);
        return objJ == CoroutineSingletons.f71806a ? objJ : new Result(objJ);
    }
}
