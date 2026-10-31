package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hk0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public tk0 f4418a;

    /* renamed from: b, reason: collision with root package name */
    public re1 f4419b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4420c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ tk0 f4421d;

    /* renamed from: e, reason: collision with root package name */
    public int f4422e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hk0(tk0 tk0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4421d = tk0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4420c = obj;
        this.f4422e |= Integer.MIN_VALUE;
        return this.f4421d.b(null, this);
    }
}
