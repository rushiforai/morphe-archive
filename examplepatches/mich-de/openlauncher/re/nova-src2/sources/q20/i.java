package q20;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f83480t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83481u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f83482v;

    /* renamed from: w, reason: collision with root package name */
    public int f83483w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83482v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83481u = obj;
        this.f83483w |= Integer.MIN_VALUE;
        Object objP = this.f83482v.p(this);
        return objP == CoroutineSingletons.f71806a ? objP : new Result(objP);
    }
}
