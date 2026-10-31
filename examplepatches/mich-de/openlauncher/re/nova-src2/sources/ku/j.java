package ku;

import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class j extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f72239j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Stripe3ds2TransactionActivity f72240k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(Stripe3ds2TransactionActivity stripe3ds2TransactionActivity, int i5) {
        super(0);
        this.f72239j = i5;
        this.f72240k = stripe3ds2TransactionActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f72239j) {
            case 0:
                return this.f72240k.getViewModelStore();
            default:
                return this.f72240k.getDefaultViewModelCreationExtras();
        }
    }
}
