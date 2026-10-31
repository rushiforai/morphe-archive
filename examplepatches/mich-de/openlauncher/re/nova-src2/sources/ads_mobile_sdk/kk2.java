package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class kk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5756a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ lk2 f5757b;

    /* renamed from: c, reason: collision with root package name */
    public int f5758c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kk2(lk2 lk2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5757b = lk2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5756a = obj;
        this.f5758c |= Integer.MIN_VALUE;
        return this.f5757b.c(this);
    }
}
