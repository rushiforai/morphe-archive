package com.stripe.android.model;

import com.stripe.android.model.StripeIntent;

/* loaded from: classes4.dex */
public final class k6 {
    public static StripeIntent.Usage a(String str) {
        Object next;
        i70.a aVar = StripeIntent.Usage.f43994f;
        b70.a aVarF = b.c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (((StripeIntent.Usage) next).f43995a.equals(str)) {
                break;
            }
        }
        return (StripeIntent.Usage) next;
    }
}
