package nu;

import android.content.Intent;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherConfirmationActivity;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherContract;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78577a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PaymentLauncherConfirmationActivity f78578b;

    public /* synthetic */ b(PaymentLauncherConfirmationActivity paymentLauncherConfirmationActivity, int i5) {
        this.f78577a = i5;
        this.f78578b = paymentLauncherConfirmationActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f78577a;
        PaymentLauncherConfirmationActivity paymentLauncherConfirmationActivity = this.f78578b;
        switch (i5) {
            case 0:
                int i11 = PaymentLauncherConfirmationActivity.f44351r;
                Intent intent = paymentLauncherConfirmationActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                return (PaymentLauncherContract.Args) intent.getParcelableExtra("extra_args");
            case 1:
                int i12 = PaymentLauncherConfirmationActivity.f44351r;
                PaymentLauncherContract.Args args = (PaymentLauncherContract.Args) paymentLauncherConfirmationActivity.o.getValue();
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
            default:
                return paymentLauncherConfirmationActivity.f44352p;
        }
    }
}
