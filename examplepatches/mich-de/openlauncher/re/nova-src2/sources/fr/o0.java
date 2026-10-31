package fr;

import com.stripe.android.core.networking.SendAnalyticsRequestV2Worker;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public SendAnalyticsRequestV2Worker f55673t;

    /* renamed from: u, reason: collision with root package name */
    public SendAnalyticsRequestV2Worker f55674u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55675v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ SendAnalyticsRequestV2Worker f55676w;

    /* renamed from: x, reason: collision with root package name */
    public int f55677x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0(SendAnalyticsRequestV2Worker sendAnalyticsRequestV2Worker, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55676w = sendAnalyticsRequestV2Worker;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55675v = obj;
        this.f55677x |= Integer.MIN_VALUE;
        return this.f55676w.doWork(this);
    }
}
