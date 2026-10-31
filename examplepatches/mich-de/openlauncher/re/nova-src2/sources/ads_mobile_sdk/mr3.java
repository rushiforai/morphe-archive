package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class mr3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bs3 f7319a;

    /* renamed from: b, reason: collision with root package name */
    public d f7320b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7321c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ bs3 f7322d;

    /* renamed from: e, reason: collision with root package name */
    public int f7323e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mr3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7322d = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7321c = obj;
        this.f7323e |= Integer.MIN_VALUE;
        return bs3.d(this.f7322d, this);
    }
}
