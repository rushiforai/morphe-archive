package com.stripe.android.model;

import com.stripe.android.model.StripeIntent;

/* loaded from: classes4.dex */
public final class j6 {
    public static StripeIntent.Status a(String str) {
        Object next;
        i70.a aVar = StripeIntent.Status.f43988j;
        b70.a aVarF = b.c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (((StripeIntent.Status) next).f43989a.equals(str)) {
                break;
            }
        }
        return (StripeIntent.Status) next;
    }
}
