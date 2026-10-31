package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ja1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5195a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c7 f5196b;

    /* renamed from: c, reason: collision with root package name */
    public int f5197c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ja1(c7 c7Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5196b = c7Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5195a = obj;
        this.f5197c |= Integer.MIN_VALUE;
        return this.f5196b.d(this);
    }
}
