package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76664t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76665u;

    /* renamed from: v, reason: collision with root package name */
    public int f76666v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76665u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76664t = obj;
        this.f76666v |= Integer.MIN_VALUE;
        Object objL = this.f76665u.l(null, null, null, null, null, this);
        return objL == CoroutineSingletons.f71806a ? objL : new Result(objL);
    }
}
