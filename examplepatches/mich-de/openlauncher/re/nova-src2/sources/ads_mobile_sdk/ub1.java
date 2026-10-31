package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ub1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vb1 f10280a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10281b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ vb1 f10282c;

    /* renamed from: d, reason: collision with root package name */
    public int f10283d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ub1(vb1 vb1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10282c = vb1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10281b = obj;
        this.f10283d |= Integer.MIN_VALUE;
        return vb1.a(this.f10282c, this);
    }
}
