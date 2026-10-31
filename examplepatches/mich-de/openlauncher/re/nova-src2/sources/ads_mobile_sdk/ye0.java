package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ye0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rf0 f12008a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f12009b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f12010c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12011d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ rf0 f12012e;

    /* renamed from: f, reason: collision with root package name */
    public int f12013f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ye0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12012e = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12011d = obj;
        this.f12013f |= Integer.MIN_VALUE;
        return this.f12012e.d(this);
    }
}
