package jr;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.customersheet.d f69652t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f69653u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.customersheet.d f69654v;

    /* renamed from: w, reason: collision with root package name */
    public int f69655w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(com.stripe.android.customersheet.d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f69654v = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f69653u = obj;
        this.f69655w |= Integer.MIN_VALUE;
        return com.stripe.android.customersheet.d.e(this.f69654v, this);
    }
}
