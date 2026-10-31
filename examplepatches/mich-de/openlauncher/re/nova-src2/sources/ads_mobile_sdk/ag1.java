package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ag1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ui.k f981a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f982b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ bg1 f983c;

    /* renamed from: d, reason: collision with root package name */
    public int f984d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ag1(bg1 bg1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f983c = bg1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f982b = obj;
        this.f984d |= Integer.MIN_VALUE;
        return this.f983c.a((b.b7) null, this);
    }
}
