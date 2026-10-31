package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dx2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jx2 f2674a;

    /* renamed from: b, reason: collision with root package name */
    public String f2675b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2676c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ jx2 f2677d;

    /* renamed from: e, reason: collision with root package name */
    public int f2678e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dx2(jx2 jx2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2677d = jx2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2676c = obj;
        this.f2678e |= Integer.MIN_VALUE;
        return this.f2677d.a(null, null, this);
    }
}
