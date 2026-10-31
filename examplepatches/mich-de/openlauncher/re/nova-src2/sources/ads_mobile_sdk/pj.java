package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class pj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f8282a;

    /* renamed from: b, reason: collision with root package name */
    public d f8283b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8284c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wj f8285d;

    /* renamed from: e, reason: collision with root package name */
    public int f8286e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8285d = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8284c = obj;
        this.f8286e |= Integer.MIN_VALUE;
        return wj.c(this.f8285d, this);
    }
}
