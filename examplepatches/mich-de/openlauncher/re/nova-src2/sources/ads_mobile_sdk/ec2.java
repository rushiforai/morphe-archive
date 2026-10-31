package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ec2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fc2 f2845a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2846b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fc2 f2847c;

    /* renamed from: d, reason: collision with root package name */
    public int f2848d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ec2(fc2 fc2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2847c = fc2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2846b = obj;
        this.f2848d |= Integer.MIN_VALUE;
        return this.f2847c.q(this);
    }
}
