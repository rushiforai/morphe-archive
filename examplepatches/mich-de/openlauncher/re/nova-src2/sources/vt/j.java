package vt;

import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k f93060t;

    /* renamed from: u, reason: collision with root package name */
    public StripeIntent f93061u;

    /* renamed from: v, reason: collision with root package name */
    public PaymentMethodConfirmationOption.Saved f93062v;

    /* renamed from: w, reason: collision with root package name */
    public ConfirmPaymentIntentParams.Shipping f93063w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f93064x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ k f93065y;

    /* renamed from: z, reason: collision with root package name */
    public int f93066z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93065y = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93064x = obj;
        this.f93066z |= Integer.MIN_VALUE;
        return this.f93065y.b(null, null, null, this);
    }
}
