package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ck3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dk3 f1928a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f1929b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ dk3 f1930c;

    /* renamed from: d, reason: collision with root package name */
    public int f1931d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ck3(dk3 dk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1930c = dk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1929b = obj;
        this.f1931d |= Integer.MIN_VALUE;
        return this.f1930c.k(this);
    }
}
