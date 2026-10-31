package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentSheetCardBrandFilter;", "Lcom/stripe/android/CardBrandFilter;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentSheetCardBrandFilter implements CardBrandFilter {

    @NotNull
    public static final Parcelable.Creator<PaymentSheetCardBrandFilter> CREATOR = new cf.a(24);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$CardBrandAcceptance f43119a;

    public PaymentSheetCardBrandFilter(PaymentSheet$CardBrandAcceptance cardBrandAcceptance) {
        Intrinsics.g(cardBrandAcceptance, "cardBrandAcceptance");
        this.f43119a = cardBrandAcceptance;
    }

    @Override // com.stripe.android.CardBrandFilter
    public final boolean M(ft.b cardBrand) {
        PaymentSheet$CardBrandAcceptance.BrandCategory brandCategory;
        Intrinsics.g(cardBrand, "cardBrand");
        switch (cardBrand.ordinal()) {
            case 0:
                brandCategory = PaymentSheet$CardBrandAcceptance.BrandCategory.f44523a;
                break;
            case 1:
                brandCategory = PaymentSheet$CardBrandAcceptance.BrandCategory.f44524b;
                break;
            case 2:
                brandCategory = PaymentSheet$CardBrandAcceptance.BrandCategory.f44525c;
                break;
            case 3:
            case 4:
            case 5:
            case 6:
                brandCategory = PaymentSheet$CardBrandAcceptance.BrandCategory.f44526d;
                break;
            default:
                brandCategory = null;
                break;
        }
        PaymentSheet$CardBrandAcceptance paymentSheet$CardBrandAcceptance = this.f43119a;
        if (paymentSheet$CardBrandAcceptance instanceof PaymentSheet$CardBrandAcceptance.All) {
            return true;
        }
        if (paymentSheet$CardBrandAcceptance instanceof PaymentSheet$CardBrandAcceptance.Allowed) {
            return brandCategory != null && ((PaymentSheet$CardBrandAcceptance.Allowed) paymentSheet$CardBrandAcceptance).f44522a.contains(brandCategory);
        }
        if (paymentSheet$CardBrandAcceptance instanceof PaymentSheet$CardBrandAcceptance.Disallowed) {
            return brandCategory == null || !((PaymentSheet$CardBrandAcceptance.Disallowed) paymentSheet$CardBrandAcceptance).f44528a.contains(brandCategory);
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentSheetCardBrandFilter) && Intrinsics.b(this.f43119a, ((PaymentSheetCardBrandFilter) obj).f43119a);
    }

    public final int hashCode() {
        return this.f43119a.hashCode();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0018  */
    @Override // com.stripe.android.CardBrandFilter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean q0(PaymentMethod paymentMethod) {
        ft.b bVarL;
        String str;
        PaymentMethod.Card card = paymentMethod.f43576h;
        if (card == null || (str = card.f43617l) == null) {
            bVarL = card != null ? card.f43606a : ft.b.f55894x;
        } else {
            ft.b.f55885m.getClass();
            bVarL = b6.b.l(str);
            if (bVarL == ft.b.f55894x) {
                bVarL = null;
            }
            if (bVarL == null) {
            }
        }
        return paymentMethod.f43573e != PaymentMethod.Type.f43639i || M(bVarL);
    }

    public final String toString() {
        return "PaymentSheetCardBrandFilter(cardBrandAcceptance=" + this.f43119a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43119a, i5);
    }
}
