package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import com.stripe.android.paymentsheet.paymentdatacollection.ach.BankFormScreenState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class e {
    public static final BankFormScreenState a(BankFormScreenState bankFormScreenState, BankFormScreenState.LinkedBankAccount linkedBankAccount) {
        Intrinsics.g(bankFormScreenState, "<this>");
        return BankFormScreenState.a(bankFormScreenState, false, linkedBankAccount, 3);
    }
}
