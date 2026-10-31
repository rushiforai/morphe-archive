package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class we2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public xe2 f11243a;

    /* renamed from: b, reason: collision with root package name */
    public bm1 f11244b;

    /* renamed from: c, reason: collision with root package name */
    public z23 f11245c;

    /* renamed from: d, reason: collision with root package name */
    public d33 f11246d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f11247e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ xe2 f11248f;

    /* renamed from: g, reason: collision with root package name */
    public int f11249g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public we2(xe2 xe2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11248f = xe2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11247e = obj;
        this.f11249g |= Integer.MIN_VALUE;
        return this.f11248f.a(this);
    }
}
