package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class og2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rg2 f7925a;

    /* renamed from: b, reason: collision with root package name */
    public d f7926b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7927c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ rg2 f7928d;

    /* renamed from: e, reason: collision with root package name */
    public int f7929e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public og2(rg2 rg2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7928d = rg2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7927c = obj;
        this.f7929e |= Integer.MIN_VALUE;
        return rg2.a(this.f7928d, this);
    }
}
