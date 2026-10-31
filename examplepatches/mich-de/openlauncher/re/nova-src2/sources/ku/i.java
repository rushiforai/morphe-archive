package ku;

import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentContainerView;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionActivity;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72237a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Stripe3ds2TransactionActivity f72238b;

    public /* synthetic */ i(Stripe3ds2TransactionActivity stripe3ds2TransactionActivity, int i5) {
        this.f72237a = i5;
        this.f72238b = stripe3ds2TransactionActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f72237a;
        Stripe3ds2TransactionActivity stripe3ds2TransactionActivity = this.f72238b;
        switch (i5) {
            case 0:
                return stripe3ds2TransactionActivity.f44310q;
            case 1:
                int i11 = Stripe3ds2TransactionActivity.f44308r;
                View viewInflate = stripe3ds2TransactionActivity.getLayoutInflater().inflate(2131624385, (ViewGroup) null, false);
                if (viewInflate != null) {
                    return new pr.a((FragmentContainerView) viewInflate);
                }
                throw new NullPointerException("rootView");
            default:
                int i12 = Stripe3ds2TransactionActivity.f44308r;
                Stripe3ds2TransactionContract.Args args = stripe3ds2TransactionActivity.f44309p;
                if (args != null) {
                    return args;
                }
                Intrinsics.m("args");
                throw null;
        }
    }
}
