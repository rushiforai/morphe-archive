package vt;

import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public PaymentMethodConfirmationOption f93067t;

    /* renamed from: u, reason: collision with root package name */
    public ConfirmationHandler$Args f93068u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f93069v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ k0 f93070w;

    /* renamed from: x, reason: collision with root package name */
    public int f93071x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0(k0 k0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93070w = k0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93069v = obj;
        this.f93071x |= Integer.MIN_VALUE;
        return this.f93070w.d(null, null, this);
    }
}
