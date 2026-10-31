package com.stripe.android.paymentsheet.addresselement;

import com.stripe.android.paymentsheet.addresselement.AddressLauncher$AdditionalFieldsConfiguration;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class g {
    public static final kw.c a(AddressLauncher$AdditionalFieldsConfiguration.FieldConfiguration fieldConfiguration) {
        int i5 = fieldConfiguration == null ? -1 : f.f44725a[fieldConfiguration.ordinal()];
        if (i5 == -1) {
            return kw.c.f72331c;
        }
        if (i5 == 1) {
            return kw.c.f72330b;
        }
        if (i5 == 2) {
            return kw.c.f72331c;
        }
        if (i5 == 3) {
            return kw.c.f72332d;
        }
        throw new NoWhenBranchMatchedException();
    }
}
