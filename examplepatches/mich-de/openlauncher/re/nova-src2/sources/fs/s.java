package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55826t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55827u;

    /* renamed from: v, reason: collision with root package name */
    public int f55828v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55827u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55826t = obj;
        this.f55828v |= Integer.MIN_VALUE;
        Object objT = this.f55827u.t(null, this);
        return objT == CoroutineSingletons.f71806a ? objT : new Result(objT);
    }
}
