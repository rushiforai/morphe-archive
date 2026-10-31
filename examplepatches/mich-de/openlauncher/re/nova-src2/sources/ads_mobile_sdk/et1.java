package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class et1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ft1 f2994a;

    /* renamed from: b, reason: collision with root package name */
    public Object f2995b;

    /* renamed from: c, reason: collision with root package name */
    public d f2996c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2997d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ft1 f2998e;

    /* renamed from: f, reason: collision with root package name */
    public int f2999f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public et1(ft1 ft1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2998e = ft1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2997d = obj;
        this.f2999f |= Integer.MIN_VALUE;
        return this.f2998e.a(null, this);
    }
}
