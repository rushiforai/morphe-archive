package ww;

import com.stripe.android.view.PaymentAuthWebViewActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class h0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f94780j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PaymentAuthWebViewActivity f94781k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h0(PaymentAuthWebViewActivity paymentAuthWebViewActivity, int i5) {
        super(0);
        this.f94780j = i5;
        this.f94781k = paymentAuthWebViewActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f94780j) {
            case 0:
                return this.f94781k.getViewModelStore();
            default:
                return this.f94781k.getDefaultViewModelCreationExtras();
        }
    }
}
