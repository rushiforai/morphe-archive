package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class mk0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public tk0 f7244a;

    /* renamed from: b, reason: collision with root package name */
    public d f7245b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7246c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ tk0 f7247d;

    /* renamed from: e, reason: collision with root package name */
    public int f7248e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mk0(tk0 tk0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7247d = tk0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7246c = obj;
        this.f7248e |= Integer.MIN_VALUE;
        return this.f7247d.c(this);
    }
}
