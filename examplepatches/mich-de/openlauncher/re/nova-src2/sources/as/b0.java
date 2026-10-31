package as;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.googlepaylauncher.r f15576t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f15577u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.googlepaylauncher.r f15578v;

    /* renamed from: w, reason: collision with root package name */
    public int f15579w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(com.stripe.android.googlepaylauncher.r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15578v = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15577u = obj;
        this.f15579w |= Integer.MIN_VALUE;
        return this.f15578v.f(this);
    }
}
