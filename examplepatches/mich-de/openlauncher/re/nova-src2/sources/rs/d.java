package rs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.link.ui.inline.a f86169t;

    /* renamed from: u, reason: collision with root package name */
    public String f86170u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f86171v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.ui.inline.a f86172w;

    /* renamed from: x, reason: collision with root package name */
    public int f86173x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(com.stripe.android.link.ui.inline.a aVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86172w = aVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86171v = obj;
        this.f86173x |= Integer.MIN_VALUE;
        return com.stripe.android.link.ui.inline.a.e(this.f86172w, null, this);
    }
}
