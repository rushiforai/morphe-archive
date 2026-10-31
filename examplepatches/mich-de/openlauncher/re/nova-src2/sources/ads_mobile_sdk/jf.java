package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f5226a;

    /* renamed from: b, reason: collision with root package name */
    public ag f5227b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5228c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ag f5229d;

    /* renamed from: e, reason: collision with root package name */
    public int f5230e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5229d = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5228c = obj;
        this.f5230e |= Integer.MIN_VALUE;
        return this.f5229d.k(this);
    }
}
