package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1235a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d3 f1236b;

    /* renamed from: c, reason: collision with root package name */
    public int f1237c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b3(d3 d3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1236b = d3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1235a = obj;
        this.f1237c |= Integer.MIN_VALUE;
        return d3.a(this.f1236b, (ContinuationImpl) this);
    }
}
