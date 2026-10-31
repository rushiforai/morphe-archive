package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r91 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public s91 f8982a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8983b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s91 f8984c;

    /* renamed from: d, reason: collision with root package name */
    public int f8985d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r91(s91 s91Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8984c = s91Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8983b = obj;
        this.f8985d |= Integer.MIN_VALUE;
        return this.f8984c.g(this);
    }
}
