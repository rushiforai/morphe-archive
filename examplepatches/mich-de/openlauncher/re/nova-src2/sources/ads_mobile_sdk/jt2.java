package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5391a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ kt2 f5392b;

    /* renamed from: c, reason: collision with root package name */
    public int f5393c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jt2(kt2 kt2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5392b = kt2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5391a = obj;
        this.f5393c |= Integer.MIN_VALUE;
        return this.f5392b.a(false, (Continuation) this);
    }
}
