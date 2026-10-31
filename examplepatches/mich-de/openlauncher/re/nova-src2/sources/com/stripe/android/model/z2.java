package com.stripe.android.model;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z2 {
    public static PaymentMethod.Type a(String str) {
        Object next;
        i70.a aVar = PaymentMethod.Type.V;
        b70.a aVarF = b.c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (Intrinsics.b(((PaymentMethod.Type) next).f43655a, str)) {
                break;
            }
        }
        return (PaymentMethod.Type) next;
    }
}
