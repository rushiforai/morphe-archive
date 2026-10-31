package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f12035a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f12036b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ zj1 f12037c;

    /* renamed from: d, reason: collision with root package name */
    public int f12038d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12037c = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12036b = obj;
        this.f12038d |= Integer.MIN_VALUE;
        return zj1.b(this.f12037c, null, this);
    }
}
