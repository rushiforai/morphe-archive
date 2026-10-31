package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class jl extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public kl f5290a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f5291b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f5292c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5293d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ kl f5294e;

    /* renamed from: f, reason: collision with root package name */
    public int f5295f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jl(kl klVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5294e = klVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5293d = obj;
        this.f5295f |= Integer.MIN_VALUE;
        return this.f5294e.a(false, this);
    }
}
