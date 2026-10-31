package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class tj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f9940a;

    /* renamed from: b, reason: collision with root package name */
    public qi f9941b;

    /* renamed from: c, reason: collision with root package name */
    public com.google.gson.r f9942c;

    /* renamed from: d, reason: collision with root package name */
    public d f9943d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f9944e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ wj f9945f;

    /* renamed from: g, reason: collision with root package name */
    public int f9946g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9945f = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9944e = obj;
        this.f9946g |= Integer.MIN_VALUE;
        return this.f9945f.a((qi) null, (com.google.gson.r) null, this);
    }
}
