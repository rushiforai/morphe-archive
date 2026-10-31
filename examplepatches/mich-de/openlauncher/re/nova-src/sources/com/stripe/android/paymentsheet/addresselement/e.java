package com.stripe.android.paymentsheet.addresselement;

import com.stripe.android.paymentsheet.addresselement.AddressLauncherResult;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public abstract class e {
    public static void a(pu.k0 k0Var) {
        AddressLauncherResult.Canceled canceled = new AddressLauncherResult.Canceled(true);
        Function1 function1 = k0Var.f83055b;
        if (function1 != null) {
            function1.invoke(canceled);
        }
    }
}
