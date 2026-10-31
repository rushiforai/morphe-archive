package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f12039a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ zj2 f12040b;

    /* renamed from: c, reason: collision with root package name */
    public int f12041c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yj2(zj2 zj2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12040b = zj2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12039a = obj;
        this.f12041c |= Integer.MIN_VALUE;
        return this.f12040b.c(this);
    }
}
