package ads_mobile_sdk;

import b.i0;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class dk1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f2553a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dz1 f2554b;

    /* renamed from: c, reason: collision with root package name */
    public int f2555c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dk1(dz1 dz1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2554b = dz1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2553a = obj;
        this.f2555c |= Integer.MIN_VALUE;
        return this.f2554b.a((i0) null, (ContinuationImpl) this);
    }
}
