package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ne extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f7536a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7537b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ oe f7538c;

    /* renamed from: d, reason: collision with root package name */
    public int f7539d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ne(oe oeVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7538c = oeVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7537b = obj;
        this.f7539d |= Integer.MIN_VALUE;
        return this.f7538c.d(this);
    }
}
