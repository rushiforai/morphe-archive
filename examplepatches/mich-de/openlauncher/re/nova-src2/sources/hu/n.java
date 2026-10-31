package hu;

import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class n {
    public static final ElementsSessionContext a(CollectBankAccountConfiguration collectBankAccountConfiguration) {
        if (collectBankAccountConfiguration instanceof CollectBankAccountConfiguration.InstantDebits) {
            return ((CollectBankAccountConfiguration.InstantDebits) collectBankAccountConfiguration).f44246b;
        }
        if (collectBankAccountConfiguration instanceof CollectBankAccountConfiguration.USBankAccountInternal) {
            return ((CollectBankAccountConfiguration.USBankAccountInternal) collectBankAccountConfiguration).f44251c;
        }
        if (collectBankAccountConfiguration instanceof CollectBankAccountConfiguration.USBankAccount) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }
}
