package vt;

import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.StripeIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public u0 f93115t;

    /* renamed from: u, reason: collision with root package name */
    public StripeIntent f93116u;

    /* renamed from: v, reason: collision with root package name */
    public ConfirmPaymentIntentParams.Shipping f93117v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93118w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ u0 f93119x;

    /* renamed from: y, reason: collision with root package name */
    public int f93120y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s0(u0 u0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93119x = u0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93118w = obj;
        this.f93120y |= Integer.MIN_VALUE;
        return this.f93119x.a(null, null, null, this);
    }
}
