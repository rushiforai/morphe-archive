package nu;

import com.stripe.android.payments.paymentlauncher.PaymentLauncherConfirmationActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class c extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f78579j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PaymentLauncherConfirmationActivity f78580k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(PaymentLauncherConfirmationActivity paymentLauncherConfirmationActivity, int i5) {
        super(0);
        this.f78579j = i5;
        this.f78580k = paymentLauncherConfirmationActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f78579j) {
            case 0:
                return this.f78580k.getViewModelStore();
            default:
                return this.f78580k.getDefaultViewModelCreationExtras();
        }
    }
}
