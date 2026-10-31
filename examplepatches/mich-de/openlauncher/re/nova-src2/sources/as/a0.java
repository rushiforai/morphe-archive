package as;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f15572t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.googlepaylauncher.r f15573u;

    /* renamed from: v, reason: collision with root package name */
    public int f15574v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(com.stripe.android.googlepaylauncher.r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15573u = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15572t = obj;
        this.f15574v |= Integer.MIN_VALUE;
        return this.f15573u.e(null, this);
    }
}
