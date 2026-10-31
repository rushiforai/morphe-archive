package ou;

import com.stripe.android.paymentsheet.PaymentOptionsActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class b0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f80796j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PaymentOptionsActivity f80797k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b0(PaymentOptionsActivity paymentOptionsActivity, int i5) {
        super(0);
        this.f80796j = i5;
        this.f80797k = paymentOptionsActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f80796j) {
            case 0:
                return this.f80797k.getViewModelStore();
            default:
                return this.f80797k.getDefaultViewModelCreationExtras();
        }
    }
}
