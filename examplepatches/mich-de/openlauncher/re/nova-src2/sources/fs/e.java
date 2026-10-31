package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55757t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55758u;

    /* renamed from: v, reason: collision with root package name */
    public int f55759v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55758u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55757t = obj;
        this.f55759v |= Integer.MIN_VALUE;
        Object objE = this.f55758u.e(null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
