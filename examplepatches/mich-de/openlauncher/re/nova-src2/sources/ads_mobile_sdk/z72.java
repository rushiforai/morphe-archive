package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class z72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public i82 f12468a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f12469b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f12470c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ i82 f12471d;

    /* renamed from: e, reason: collision with root package name */
    public int f12472e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z72(i82 i82Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12471d = i82Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12470c = obj;
        this.f12472e |= Integer.MIN_VALUE;
        return i82.b(this.f12471d, this);
    }
}
