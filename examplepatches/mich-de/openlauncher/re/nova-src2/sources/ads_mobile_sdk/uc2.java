package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uc2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vc2 f10310a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10311b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ vc2 f10312c;

    /* renamed from: d, reason: collision with root package name */
    public int f10313d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uc2(vc2 vc2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10312c = vc2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10311b = obj;
        this.f10313d |= Integer.MIN_VALUE;
        return this.f10312c.a(null, null, this);
    }
}
