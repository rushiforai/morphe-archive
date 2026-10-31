package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76661t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76662u;

    /* renamed from: v, reason: collision with root package name */
    public int f76663v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76662u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76661t = obj;
        this.f76663v |= Integer.MIN_VALUE;
        Object objK = this.f76662u.k(null, null, this);
        return objK == CoroutineSingletons.f71806a ? objK : new Result(objK);
    }
}
