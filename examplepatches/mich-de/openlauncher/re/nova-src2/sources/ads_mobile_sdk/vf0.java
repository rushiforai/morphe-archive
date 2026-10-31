package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class vf0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wf0 f10769a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10770b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ wf0 f10771c;

    /* renamed from: d, reason: collision with root package name */
    public int f10772d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vf0(wf0 wf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10771c = wf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10770b = obj;
        this.f10772d |= Integer.MIN_VALUE;
        return wf0.a(this.f10771c, this);
    }
}
