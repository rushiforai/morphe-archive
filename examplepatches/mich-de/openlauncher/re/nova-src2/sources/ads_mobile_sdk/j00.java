package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j00 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5071a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k00 f5072b;

    /* renamed from: c, reason: collision with root package name */
    public int f5073c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j00(k00 k00Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5072b = k00Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5071a = obj;
        this.f5073c |= Integer.MIN_VALUE;
        return this.f5072b.a((p5) null, this);
    }
}
