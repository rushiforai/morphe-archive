package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class av1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1141a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ iv1 f1142b;

    /* renamed from: c, reason: collision with root package name */
    public int f1143c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av1(iv1 iv1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1142b = iv1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1141a = obj;
        this.f1143c |= Integer.MIN_VALUE;
        return this.f1142b.k(this);
    }
}
