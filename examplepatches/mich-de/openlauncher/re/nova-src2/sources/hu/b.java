package hu;

import com.stripe.android.payments.bankaccount.ui.CollectBankAccountActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class b extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f60064j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ CollectBankAccountActivity f60065k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(CollectBankAccountActivity collectBankAccountActivity, int i5) {
        super(0);
        this.f60064j = i5;
        this.f60065k = collectBankAccountActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f60064j) {
            case 0:
                return this.f60065k.getViewModelStore();
            default:
                return this.f60065k.getDefaultViewModelCreationExtras();
        }
    }
}
