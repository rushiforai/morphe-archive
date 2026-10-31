package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class kh extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5734a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ lh f5735b;

    /* renamed from: c, reason: collision with root package name */
    public int f5736c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kh(lh lhVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5735b = lhVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5734a = obj;
        this.f5736c |= Integer.MIN_VALUE;
        return this.f5735b.a(null, null, null, false, null, null, null, this);
    }
}
