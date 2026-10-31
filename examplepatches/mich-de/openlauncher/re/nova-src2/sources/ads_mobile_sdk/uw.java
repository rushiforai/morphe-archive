package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class uw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f10499a;

    /* renamed from: b, reason: collision with root package name */
    public String f10500b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10501c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ vw f10502d;

    /* renamed from: e, reason: collision with root package name */
    public int f10503e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10502d = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10501c = obj;
        this.f10503e |= Integer.MIN_VALUE;
        return this.f10502d.b((String) null, this);
    }
}
