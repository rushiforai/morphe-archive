package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iw2 f4103a;

    /* renamed from: b, reason: collision with root package name */
    public String f4104b;

    /* renamed from: c, reason: collision with root package name */
    public d f4105c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4106d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ iw2 f4107e;

    /* renamed from: f, reason: collision with root package name */
    public int f4108f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gw2(iw2 iw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4107e = iw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4106d = obj;
        this.f4108f |= Integer.MIN_VALUE;
        return iw2.e(this.f4107e, null, null, this);
    }
}
