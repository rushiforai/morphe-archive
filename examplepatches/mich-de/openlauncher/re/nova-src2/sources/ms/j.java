package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76658t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76659u;

    /* renamed from: v, reason: collision with root package name */
    public int f76660v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76659u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76658t = obj;
        this.f76660v |= Integer.MIN_VALUE;
        Object objJ = this.f76659u.j(null, this);
        return objJ == CoroutineSingletons.f71806a ? objJ : new Result(objJ);
    }
}
