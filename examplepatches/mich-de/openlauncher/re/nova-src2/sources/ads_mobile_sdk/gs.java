package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gs extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f4044a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ hs f4045b;

    /* renamed from: c, reason: collision with root package name */
    public int f4046c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gs(hs hsVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4045b = hsVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4044a = obj;
        this.f4046c |= Integer.MIN_VALUE;
        return hs.b(this.f4045b, this);
    }
}
