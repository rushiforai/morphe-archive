package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ma3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public g83 f7065a;

    /* renamed from: b, reason: collision with root package name */
    public ti.p f7066b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7067c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ti.r f7068d;

    /* renamed from: e, reason: collision with root package name */
    public int f7069e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ma3(ti.r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7068d = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7067c = obj;
        this.f7069e |= Integer.MIN_VALUE;
        return this.f7068d.a(null, null, this);
    }
}
