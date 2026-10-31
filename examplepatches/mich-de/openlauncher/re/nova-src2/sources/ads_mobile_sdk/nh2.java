package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class nh2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7561a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ oh2 f7562b;

    /* renamed from: c, reason: collision with root package name */
    public int f7563c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nh2(oh2 oh2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7562b = oh2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7561a = obj;
        this.f7563c |= Integer.MIN_VALUE;
        return this.f7562b.a((p5) null, this);
    }
}
