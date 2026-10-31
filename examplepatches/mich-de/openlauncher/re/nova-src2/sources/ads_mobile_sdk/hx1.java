package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class hx1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f4579a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ jx1 f4580b;

    /* renamed from: c, reason: collision with root package name */
    public int f4581c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hx1(jx1 jx1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4580b = jx1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4579a = obj;
        this.f4581c |= Integer.MIN_VALUE;
        return this.f4580b.a((com.google.gson.r) null, (eg2) null, this);
    }
}
