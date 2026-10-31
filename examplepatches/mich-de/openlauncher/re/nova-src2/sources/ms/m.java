package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76667t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76668u;

    /* renamed from: v, reason: collision with root package name */
    public int f76669v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76668u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76667t = obj;
        this.f76669v |= Integer.MIN_VALUE;
        Object objM = this.f76668u.m(null, null, this);
        return objM == CoroutineSingletons.f71806a ? objM : new Result(objM);
    }
}
