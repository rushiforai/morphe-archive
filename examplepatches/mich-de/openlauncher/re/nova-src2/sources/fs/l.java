package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55796t;

    /* renamed from: u, reason: collision with root package name */
    public String f55797u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55798v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ y f55799w;

    /* renamed from: x, reason: collision with root package name */
    public int f55800x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55799w = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55798v = obj;
        this.f55800x |= Integer.MIN_VALUE;
        Object objL = this.f55799w.l(null, null, this);
        return objL == CoroutineSingletons.f71806a ? objL : new Result(objL);
    }
}
