package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55781t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55782u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f55783v;

    /* renamed from: w, reason: collision with root package name */
    public int f55784w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55783v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55782u = obj;
        this.f55784w |= Integer.MIN_VALUE;
        Object objI = this.f55783v.i(this);
        return objI == CoroutineSingletons.f71806a ? objI : new Result(objI);
    }
}
