package ou;

import android.content.Intent;
import com.stripe.android.paymentsheet.PaymentOptionContract;
import com.stripe.android.paymentsheet.PaymentOptionsActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class y implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81006a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PaymentOptionsActivity f81007b;

    public /* synthetic */ y(PaymentOptionsActivity paymentOptionsActivity, int i5) {
        this.f81006a = i5;
        this.f81007b = paymentOptionsActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f81006a;
        PaymentOptionsActivity paymentOptionsActivity = this.f81007b;
        switch (i5) {
            case 0:
                int i11 = PaymentOptionsActivity.f44436r;
                PaymentOptionContract.Args args = (PaymentOptionContract.Args) paymentOptionsActivity.f44438q.getValue();
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
            case 1:
                return paymentOptionsActivity.o;
            default:
                int i12 = PaymentOptionsActivity.f44436r;
                Intent intent = paymentOptionsActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                return (PaymentOptionContract.Args) intent.getParcelableExtra("extra_activity_args");
        }
    }
}
