package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y70 extends ContinuationImpl {

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f11951b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e80 f11952c;

    /* renamed from: d, reason: collision with root package name */
    public int f11953d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y70(e80 e80Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11952c = e80Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11951b = obj;
        this.f11953d |= Integer.MIN_VALUE;
        return e80.a(this.f11952c, this);
    }
}
