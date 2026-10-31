package vt;

import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.StripeIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k f93054t;

    /* renamed from: u, reason: collision with root package name */
    public StripeIntent f93055u;

    /* renamed from: v, reason: collision with root package name */
    public ConfirmPaymentIntentParams.Shipping f93056v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93057w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ k f93058x;

    /* renamed from: y, reason: collision with root package name */
    public int f93059y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93058x = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93057w = obj;
        this.f93059y |= Integer.MIN_VALUE;
        return this.f93058x.a(null, null, null, this);
    }
}
