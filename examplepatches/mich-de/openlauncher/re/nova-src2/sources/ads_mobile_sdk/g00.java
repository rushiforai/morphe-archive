package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class g00 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3599a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dz1 f3600b;

    /* renamed from: c, reason: collision with root package name */
    public int f3601c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g00(dz1 dz1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3600b = dz1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3599a = obj;
        this.f3601c |= Integer.MIN_VALUE;
        return this.f3600b.a((p5) null, (ContinuationImpl) this);
    }
}
