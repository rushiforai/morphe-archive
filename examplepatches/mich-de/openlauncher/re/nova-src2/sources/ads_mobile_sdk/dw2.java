package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class dw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iw2 f2659a;

    /* renamed from: b, reason: collision with root package name */
    public String f2660b;

    /* renamed from: c, reason: collision with root package name */
    public d f2661c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2662d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ iw2 f2663e;

    /* renamed from: f, reason: collision with root package name */
    public int f2664f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dw2(iw2 iw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2663e = iw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2662d = obj;
        this.f2664f |= Integer.MIN_VALUE;
        return iw2.b(this.f2663e, null, null, this);
    }
}
