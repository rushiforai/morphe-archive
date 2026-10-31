package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class mi extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7221a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ni f7222b;

    /* renamed from: c, reason: collision with root package name */
    public int f7223c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mi(ni niVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7222b = niVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7221a = obj;
        this.f7223c |= Integer.MIN_VALUE;
        return this.f7222b.d(this);
    }
}
