package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hc1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4325a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4326b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4327c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ jc1 f4328d;

    /* renamed from: e, reason: collision with root package name */
    public int f4329e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hc1(jc1 jc1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4328d = jc1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4327c = obj;
        this.f4329e |= Integer.MIN_VALUE;
        return this.f4328d.a(this);
    }
}
