package f1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class x2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public long f54093t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f54094u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y2 f54095v;

    /* renamed from: w, reason: collision with root package name */
    public int f54096w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x2(y2 y2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f54095v = y2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f54094u = obj;
        this.f54096w |= Integer.MIN_VALUE;
        return this.f54095v.t(0L, this);
    }
}
