package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49561t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m f49562u;

    /* renamed from: v, reason: collision with root package name */
    public int f49563v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49562u = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49561t = obj;
        this.f49563v |= Integer.MIN_VALUE;
        Object objC = this.f49562u.c(null, null, null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
