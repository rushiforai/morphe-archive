package com.stripe.android.paymentsheet.model;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k {

    /* renamed from: b, reason: collision with root package name */
    public static final k f44856b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ k[] f44857c;

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSelection f44858a;

    /* JADX WARN: Multi-variable type inference failed */
    static {
        k kVar = new k("GooglePay", 0, PaymentSelection.GooglePay.f44810a);
        k kVar2 = new k("Link", 1, new PaymentSelection.Link(null, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 7));
        f44856b = kVar2;
        k[] kVarArr = {kVar, kVar2};
        f44857c = kVarArr;
        EnumEntriesKt.a(kVarArr);
    }

    public k(String str, int i5, PaymentSelection paymentSelection) {
        this.f44858a = paymentSelection;
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f44857c.clone();
    }
}
