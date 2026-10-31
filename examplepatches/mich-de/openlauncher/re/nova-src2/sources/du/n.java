package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49570t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f49571u;

    /* renamed from: v, reason: collision with root package name */
    public int f49572v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49571u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49570t = obj;
        this.f49572v |= Integer.MIN_VALUE;
        Object objC = this.f49571u.c(null, null, null, this);
        return objC == CoroutineSingletons.f71806a ? objC : new Result(objC);
    }
}
