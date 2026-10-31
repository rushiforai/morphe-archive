package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55751t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55752u;

    /* renamed from: v, reason: collision with root package name */
    public int f55753v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55752u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55751t = obj;
        this.f55753v |= Integer.MIN_VALUE;
        Object objD = this.f55752u.d(this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
