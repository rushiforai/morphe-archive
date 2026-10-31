package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class fq0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3464a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ qq0 f3465b;

    /* renamed from: c, reason: collision with root package name */
    public int f3466c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fq0(qq0 qq0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3465b = qq0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3464a = obj;
        this.f3466c |= Integer.MIN_VALUE;
        return qq0.a(this.f3465b, this);
    }
}
