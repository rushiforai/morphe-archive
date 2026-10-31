package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j02 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5077a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k02 f5078b;

    /* renamed from: c, reason: collision with root package name */
    public int f5079c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j02(k02 k02Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5078b = k02Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5077a = obj;
        this.f5079c |= Integer.MIN_VALUE;
        return this.f5078b.a((b.u7) null, this);
    }
}
