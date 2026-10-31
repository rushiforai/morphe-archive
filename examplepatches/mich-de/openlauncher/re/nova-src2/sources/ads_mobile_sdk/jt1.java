package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jt1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f5386a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f5387b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5388c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wt1 f5389d;

    /* renamed from: e, reason: collision with root package name */
    public int f5390e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jt1(wt1 wt1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5389d = wt1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5388c = obj;
        this.f5390e |= Integer.MIN_VALUE;
        return this.f5389d.a((z1) null, (com.google.gson.r) null, (eg2) null, this);
    }
}
