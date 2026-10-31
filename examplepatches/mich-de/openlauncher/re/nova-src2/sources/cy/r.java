package cy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f48526t;

    /* renamed from: u, reason: collision with root package name */
    public int f48527u;

    public r(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48526t = obj;
        this.f48527u |= Integer.MIN_VALUE;
        return d0.r(this);
    }
}
