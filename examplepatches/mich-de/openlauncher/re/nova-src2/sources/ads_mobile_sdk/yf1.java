package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yf1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public od1 f12021a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f12022b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ lm.e f12023c;

    /* renamed from: d, reason: collision with root package name */
    public int f12024d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yf1(lm.e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12023c = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12022b = obj;
        this.f12024d |= Integer.MIN_VALUE;
        return this.f12023c.g(null, this);
    }
}
