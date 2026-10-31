package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f11945a;

    /* renamed from: b, reason: collision with root package name */
    public String f11946b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11947c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b71 f11948d;

    /* renamed from: e, reason: collision with root package name */
    public int f11949e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y61(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11948d = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11947c = obj;
        this.f11949e |= Integer.MIN_VALUE;
        return b71.b(this.f11948d, this);
    }
}
