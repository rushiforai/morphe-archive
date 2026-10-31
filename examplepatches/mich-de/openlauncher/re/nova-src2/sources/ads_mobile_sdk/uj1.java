package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zj1 f10364a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f10365b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ zj1 f10366c;

    /* renamed from: d, reason: collision with root package name */
    public int f10367d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10366c = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10365b = obj;
        this.f10367d |= Integer.MIN_VALUE;
        return zj1.a(this.f10366c, (String) null, this);
    }
}
