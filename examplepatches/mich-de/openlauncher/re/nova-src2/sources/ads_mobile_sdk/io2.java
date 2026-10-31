package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class io2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wo2 f4897a;

    /* renamed from: b, reason: collision with root package name */
    public Throwable f4898b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4899c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wo2 f4900d;

    /* renamed from: e, reason: collision with root package name */
    public int f4901e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public io2(wo2 wo2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4900d = wo2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4899c = obj;
        this.f4901e |= Integer.MIN_VALUE;
        return this.f4900d.a(this);
    }
}
