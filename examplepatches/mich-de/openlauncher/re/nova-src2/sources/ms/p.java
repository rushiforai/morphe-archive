package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76680t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76681u;

    /* renamed from: v, reason: collision with root package name */
    public int f76682v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76681u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76680t = obj;
        this.f76682v |= Integer.MIN_VALUE;
        Object objO = this.f76681u.o(null, null, null, null, null, null, null, null, null, null, this);
        return objO == CoroutineSingletons.f71806a ? objO : new Result(objO);
    }
}
