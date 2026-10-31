package es;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.link.l f52968t;

    /* renamed from: u, reason: collision with root package name */
    public Object f52969u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f52970v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f52971w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f52972x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.l f52973y;

    /* renamed from: z, reason: collision with root package name */
    public int f52974z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(com.stripe.android.link.l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52973y = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52972x = obj;
        this.f52974z |= Integer.MIN_VALUE;
        return this.f52973y.l(false, null, false, this);
    }
}
