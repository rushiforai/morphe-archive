package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class xf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f11716a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f11717b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ag f11718c;

    /* renamed from: d, reason: collision with root package name */
    public int f11719d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11718c = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11717b = obj;
        this.f11719d |= Integer.MIN_VALUE;
        return ag.c(this.f11718c, this);
    }
}
