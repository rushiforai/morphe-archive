package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class n00 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7386a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k00 f7387b;

    /* renamed from: c, reason: collision with root package name */
    public int f7388c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n00(k00 k00Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7387b = k00Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7386a = obj;
        this.f7388c |= Integer.MIN_VALUE;
        return this.f7387b.a((p5) null, this);
    }
}
