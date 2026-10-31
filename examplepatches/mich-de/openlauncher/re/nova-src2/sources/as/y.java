package as;

import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncherActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class y extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f15652j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ GooglePayPaymentMethodLauncherActivity f15653k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y(GooglePayPaymentMethodLauncherActivity googlePayPaymentMethodLauncherActivity, int i5) {
        super(0);
        this.f15652j = i5;
        this.f15653k = googlePayPaymentMethodLauncherActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f15652j) {
            case 0:
                return this.f15653k.getViewModelStore();
            default:
                return this.f15653k.getDefaultViewModelCreationExtras();
        }
    }
}
