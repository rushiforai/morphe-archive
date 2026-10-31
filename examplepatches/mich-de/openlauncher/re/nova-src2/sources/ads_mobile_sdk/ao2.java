package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ao2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1043a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ wo2 f1044b;

    /* renamed from: c, reason: collision with root package name */
    public int f1045c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ao2(wo2 wo2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1044b = wo2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1043a = obj;
        this.f1045c |= Integer.MIN_VALUE;
        return wo2.a(this.f1044b, this);
    }
}
