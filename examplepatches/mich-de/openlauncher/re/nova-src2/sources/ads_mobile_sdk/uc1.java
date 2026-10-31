package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class uc1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wc1 f10306a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10307b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ wc1 f10308c;

    /* renamed from: d, reason: collision with root package name */
    public int f10309d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uc1(wc1 wc1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10308c = wc1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10307b = obj;
        this.f10309d |= Integer.MIN_VALUE;
        return wc1.a(this.f10308c, this);
    }
}
