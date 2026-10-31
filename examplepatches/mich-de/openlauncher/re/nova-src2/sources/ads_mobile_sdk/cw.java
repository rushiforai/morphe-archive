package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f2050a;

    /* renamed from: b, reason: collision with root package name */
    public ri.a f2051b;

    /* renamed from: c, reason: collision with root package name */
    public x11 f2052c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2053d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ vw f2054e;

    /* renamed from: f, reason: collision with root package name */
    public int f2055f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2054e = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2053d = obj;
        this.f2055f |= Integer.MIN_VALUE;
        return this.f2054e.a((ri.a) null, this);
    }
}
