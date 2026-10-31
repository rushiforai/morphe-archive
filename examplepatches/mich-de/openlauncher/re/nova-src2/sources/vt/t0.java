package vt;

import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.StripeIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f93127t;

    /* renamed from: u, reason: collision with root package name */
    public StripeIntent f93128u;

    /* renamed from: v, reason: collision with root package name */
    public ConfirmPaymentIntentParams.Shipping f93129v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93130w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ u0 f93131x;

    /* renamed from: y, reason: collision with root package name */
    public int f93132y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t0(u0 u0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93131x = u0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93130w = obj;
        this.f93132y |= Integer.MIN_VALUE;
        return this.f93131x.c(null, null, null, this);
    }
}
