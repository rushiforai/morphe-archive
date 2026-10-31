package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class fn0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public gn0 f3437a;

    /* renamed from: b, reason: collision with root package name */
    public String f3438b;

    /* renamed from: c, reason: collision with root package name */
    public String f3439c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3440d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ gn0 f3441e;

    /* renamed from: f, reason: collision with root package name */
    public int f3442f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fn0(gn0 gn0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3441e = gn0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3440d = obj;
        this.f3442f |= Integer.MIN_VALUE;
        return this.f3441e.d(this);
    }
}
