package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76628t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76629u;

    /* renamed from: v, reason: collision with root package name */
    public int f76630v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76629u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76628t = obj;
        this.f76630v |= Integer.MIN_VALUE;
        Object objD = this.f76629u.d(null, null, null, null, null, null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
