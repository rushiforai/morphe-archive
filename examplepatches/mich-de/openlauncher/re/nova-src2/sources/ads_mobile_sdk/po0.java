package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class po0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ro0 f8341a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8342b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ro0 f8343c;

    /* renamed from: d, reason: collision with root package name */
    public int f8344d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public po0(ro0 ro0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8343c = ro0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8342b = obj;
        this.f8344d |= Integer.MIN_VALUE;
        return this.f8343c.b(this);
    }
}
