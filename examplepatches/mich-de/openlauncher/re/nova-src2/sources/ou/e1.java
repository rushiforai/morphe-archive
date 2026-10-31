package ou;

import com.stripe.android.paymentsheet.PaymentSheetActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class e1 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f80850j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PaymentSheetActivity f80851k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e1(PaymentSheetActivity paymentSheetActivity, int i5) {
        super(0);
        this.f80850j = i5;
        this.f80851k = paymentSheetActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f80850j) {
            case 0:
                return this.f80851k.getViewModelStore();
            default:
                return this.f80851k.getDefaultViewModelCreationExtras();
        }
    }
}
