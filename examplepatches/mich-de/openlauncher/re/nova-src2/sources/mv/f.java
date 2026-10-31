package mv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76833t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f76834u;

    /* renamed from: v, reason: collision with root package name */
    public int f76835v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76834u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76833t = obj;
        this.f76835v |= Integer.MIN_VALUE;
        Object objJ = this.f76834u.j(null, null, this);
        return objJ == CoroutineSingletons.f71806a ? objJ : new Result(objJ);
    }
}
