package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ve2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public xe2 f10762a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10763b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ xe2 f10764c;

    /* renamed from: d, reason: collision with root package name */
    public int f10765d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ve2(xe2 xe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10764c = xe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10763b = obj;
        this.f10765d |= Integer.MIN_VALUE;
        return this.f10764c.a(null, this);
    }
}
