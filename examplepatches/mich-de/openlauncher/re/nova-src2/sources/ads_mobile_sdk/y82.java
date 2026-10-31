package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y82 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public c92 f11962a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f11963b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c92 f11964c;

    /* renamed from: d, reason: collision with root package name */
    public int f11965d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y82(c92 c92Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11964c = c92Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11963b = obj;
        this.f11965d |= Integer.MIN_VALUE;
        return c92.a(this.f11964c, (ContinuationImpl) this);
    }
}
