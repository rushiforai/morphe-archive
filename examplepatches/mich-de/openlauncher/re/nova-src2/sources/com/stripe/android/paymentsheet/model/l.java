package com.stripe.android.paymentsheet.model;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class l {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f44859a;

    static {
        int[] iArr = new int[PaymentMethod.Type.values().length];
        try {
            z2 z2Var = PaymentMethod.Type.f43637g;
            iArr[32] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            z2 z2Var2 = PaymentMethod.Type.f43637g;
            iArr[5] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        f44859a = iArr;
    }
}
