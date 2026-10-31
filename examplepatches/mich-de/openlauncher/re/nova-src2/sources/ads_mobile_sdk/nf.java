package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class nf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f7545a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7546b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ag f7547c;

    /* renamed from: d, reason: collision with root package name */
    public int f7548d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7547c = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7546b = obj;
        this.f7548d |= Integer.MIN_VALUE;
        return ag.a(this.f7547c, this);
    }
}
