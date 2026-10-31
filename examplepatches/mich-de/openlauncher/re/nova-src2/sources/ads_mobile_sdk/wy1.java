package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class wy1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public tx0 f11515a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f11516b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ xy1 f11517c;

    /* renamed from: d, reason: collision with root package name */
    public int f11518d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wy1(xy1 xy1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11517c = xy1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11516b = obj;
        this.f11518d |= Integer.MIN_VALUE;
        return xy1.a(this.f11517c, null, this);
    }
}
