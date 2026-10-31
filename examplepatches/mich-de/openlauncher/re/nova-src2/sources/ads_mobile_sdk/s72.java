package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class s72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public i82 f9450a;

    /* renamed from: b, reason: collision with root package name */
    public String f9451b;

    /* renamed from: c, reason: collision with root package name */
    public q31 f9452c;

    /* renamed from: d, reason: collision with root package name */
    public d f9453d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f9454e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f9455f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ i82 f9456g;

    /* renamed from: h, reason: collision with root package name */
    public int f9457h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s72(i82 i82Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9456g = i82Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9455f = obj;
        this.f9457h |= Integer.MIN_VALUE;
        return this.f9456g.a(null, false, null, this);
    }
}
