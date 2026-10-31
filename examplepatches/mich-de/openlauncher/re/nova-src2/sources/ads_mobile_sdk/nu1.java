package ads_mobile_sdk;

import b.p2;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class nu1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7677a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ su1 f7678b;

    /* renamed from: c, reason: collision with root package name */
    public int f7679c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nu1(su1 su1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7678b = su1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7677a = obj;
        this.f7679c |= Integer.MIN_VALUE;
        return this.f7678b.a((p2) null, (z1) null, this);
    }
}
