package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55791t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f55792u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55793v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ y f55794w;

    /* renamed from: x, reason: collision with root package name */
    public int f55795x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55794w = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55793v = obj;
        this.f55795x |= Integer.MIN_VALUE;
        Object objK = this.f55794w.k(null, null, false, null, this);
        return objK == CoroutineSingletons.f71806a ? objK : new Result(objK);
    }
}
