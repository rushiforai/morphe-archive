package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class fr1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hr1 f3482a;

    /* renamed from: b, reason: collision with root package name */
    public x11 f3483b;

    /* renamed from: c, reason: collision with root package name */
    public String f3484c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3485d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ hr1 f3486e;

    /* renamed from: f, reason: collision with root package name */
    public int f3487f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fr1(hr1 hr1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3486e = hr1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3485d = obj;
        this.f3487f |= Integer.MIN_VALUE;
        return this.f3486e.a(null, null, this);
    }
}
