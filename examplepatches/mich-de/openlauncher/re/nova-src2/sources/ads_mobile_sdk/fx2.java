package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class fx2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public xu0 f3540a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f3541b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f3542c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3543d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ jx2 f3544e;

    /* renamed from: f, reason: collision with root package name */
    public int f3545f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fx2(jx2 jx2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3544e = jx2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3543d = obj;
        this.f3545f |= Integer.MIN_VALUE;
        return this.f3544e.a(null, null, null, this);
    }
}
