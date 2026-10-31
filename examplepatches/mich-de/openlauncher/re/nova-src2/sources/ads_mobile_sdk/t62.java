package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class t62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w62 f9795a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f9796b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ w62 f9797c;

    /* renamed from: d, reason: collision with root package name */
    public int f9798d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9797c = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9796b = obj;
        this.f9798d |= Integer.MIN_VALUE;
        return w62.e(this.f9797c, this);
    }
}
