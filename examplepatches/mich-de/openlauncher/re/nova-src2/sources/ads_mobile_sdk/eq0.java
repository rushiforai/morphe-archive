package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class eq0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f2939a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ qq0 f2940b;

    /* renamed from: c, reason: collision with root package name */
    public int f2941c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public eq0(qq0 qq0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2940b = qq0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2939a = obj;
        this.f2941c |= Integer.MIN_VALUE;
        return this.f2940b.a(this);
    }
}
