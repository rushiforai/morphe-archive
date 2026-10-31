package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class q00 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f8436a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ oh2 f8437b;

    /* renamed from: c, reason: collision with root package name */
    public int f8438c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q00(oh2 oh2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8437b = oh2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8436a = obj;
        this.f8438c |= Integer.MIN_VALUE;
        return this.f8437b.a((p5) null, this);
    }
}
