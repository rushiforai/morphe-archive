package hu;

import android.content.Intent;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import com.stripe.android.payments.bankaccount.ui.CollectBankAccountActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60062a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CollectBankAccountActivity f60063b;

    public /* synthetic */ a(CollectBankAccountActivity collectBankAccountActivity, int i5) {
        this.f60062a = i5;
        this.f60063b = collectBankAccountActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f60062a;
        CollectBankAccountActivity collectBankAccountActivity = this.f60063b;
        switch (i5) {
            case 0:
                int i11 = CollectBankAccountActivity.f44305r;
                Intent intent = collectBankAccountActivity.getIntent();
                Intrinsics.f(intent, "getIntent(...)");
                return (CollectBankAccountContract.Args) intent.getParcelableExtra("com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.extra_args");
            case 1:
                int i12 = CollectBankAccountActivity.f44305r;
                return new g(new a(collectBankAccountActivity, 2));
            default:
                int i13 = CollectBankAccountActivity.f44305r;
                CollectBankAccountContract.Args args = (CollectBankAccountContract.Args) collectBankAccountActivity.o.getValue();
                if (args != null) {
                    return args;
                }
                throw new IllegalArgumentException("Required value was null.");
        }
    }
}
