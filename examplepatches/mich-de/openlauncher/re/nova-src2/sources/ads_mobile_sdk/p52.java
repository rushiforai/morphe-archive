package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class p52 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f8100a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x52 f8101b;

    /* renamed from: c, reason: collision with root package name */
    public int f8102c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p52(x52 x52Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8101b = x52Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8100a = obj;
        this.f8102c |= Integer.MIN_VALUE;
        return x52.a(this.f8101b, this);
    }
}
