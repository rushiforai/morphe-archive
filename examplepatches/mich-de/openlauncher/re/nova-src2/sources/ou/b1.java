package ou;

import android.content.Intent;
import com.stripe.android.paymentsheet.PaymentSheetActivity;
import com.stripe.android.paymentsheet.PaymentSheetContract;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class b1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80798a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PaymentSheetActivity f80799b;

    public /* synthetic */ b1(PaymentSheetActivity paymentSheetActivity, int i5) {
        this.f80798a = i5;
        this.f80799b = paymentSheetActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f80798a;
        PaymentSheetActivity paymentSheetActivity = this.f80799b;
        switch (i5) {
            case 0:
                int i11 = PaymentSheetActivity.f44660r;
                PaymentSheetContract.Args args = (PaymentSheetContract.Args) paymentSheetActivity.f44662q.getValue();
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
            case 1:
                return paymentSheetActivity.o;
            default:
                int i12 = PaymentSheetActivity.f44660r;
                Intent intent = paymentSheetActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                return (PaymentSheetContract.Args) intent.getParcelableExtra("com.stripe.android.paymentsheet.PaymentSheetContract.extra_args");
        }
    }
}
