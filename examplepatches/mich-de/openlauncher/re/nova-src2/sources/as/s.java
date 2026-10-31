package as;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f15632t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.googlepaylauncher.j f15633u;

    /* renamed from: v, reason: collision with root package name */
    public int f15634v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(com.stripe.android.googlepaylauncher.j jVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15633u = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15632t = obj;
        this.f15634v |= Integer.MIN_VALUE;
        return this.f15633u.h(0, null, this);
    }
}
