package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class mw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f7343a;

    /* renamed from: b, reason: collision with root package name */
    public ri.a f7344b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7345c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ vw f7346d;

    /* renamed from: e, reason: collision with root package name */
    public int f7347e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7346d = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7345c = obj;
        this.f7347e |= Integer.MIN_VALUE;
        return this.f7346d.b((ri.a) null, this);
    }
}
