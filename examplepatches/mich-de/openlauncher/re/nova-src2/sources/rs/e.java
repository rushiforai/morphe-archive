package rs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.link.ui.inline.a f86174t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86175u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.ui.inline.a f86176v;

    /* renamed from: w, reason: collision with root package name */
    public int f86177w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(com.stripe.android.link.ui.inline.a aVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86176v = aVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86175u = obj;
        this.f86177w |= Integer.MIN_VALUE;
        return com.stripe.android.link.ui.inline.a.f(this.f86176v, this);
    }
}
