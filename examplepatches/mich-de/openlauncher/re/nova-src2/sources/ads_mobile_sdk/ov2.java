package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ov2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8017a;

    /* renamed from: b, reason: collision with root package name */
    public Object f8018b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8019c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ qv2 f8020d;

    /* renamed from: e, reason: collision with root package name */
    public int f8021e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ov2(qv2 qv2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8020d = qv2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8019c = obj;
        this.f8021e |= Integer.MIN_VALUE;
        return this.f8020d.a(null, this);
    }
}
