package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/PaymentSheetCardFundingFilter;", "Lcom/stripe/android/CardFundingFilter;", "b50/d", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class PaymentSheetCardFundingFilter implements CardFundingFilter {

    @NotNull
    public static final Parcelable.Creator<PaymentSheetCardFundingFilter> CREATOR = new cf.a(25);

    /* renamed from: a, reason: collision with root package name */
    public final List f43120a;

    public PaymentSheetCardFundingFilter(List allowedCardFundingTypes) {
        Intrinsics.g(allowedCardFundingTypes, "allowedCardFundingTypes");
        this.f43120a = allowedCardFundingTypes;
    }

    @Override // com.stripe.android.CardFundingFilter
    public final Integer E() {
        List list = this.f43120a;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((PaymentSheet$CardFundingType) it.next()).b());
        }
        Set setN1 = b70.g.N1(arrayList);
        boolean zContains = setN1.contains(ft.c.f55911c);
        boolean zContains2 = setN1.contains(ft.c.f55912d);
        boolean zContains3 = setN1.contains(ft.c.f55913e);
        if (zContains && zContains2 && zContains3) {
            return null;
        }
        if (zContains && zContains2) {
            return 2132019744;
        }
        if (zContains && zContains3) {
            return 2132019742;
        }
        if (zContains2 && zContains3) {
            return 2132019745;
        }
        if (zContains) {
            return 2132019741;
        }
        if (zContains2) {
            return 2132019743;
        }
        return zContains3 ? 2132019746 : null;
    }

    @Override // com.stripe.android.CardFundingFilter
    public final boolean H(ft.c cardFunding) {
        Intrinsics.g(cardFunding, "cardFunding");
        if (cardFunding == ft.c.f55914f) {
            return true;
        }
        List list = this.f43120a;
        if ((list instanceof Collection) && list.isEmpty()) {
            return false;
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            if (((PaymentSheet$CardFundingType) it.next()).b() == cardFunding) {
                return true;
            }
        }
        return false;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentSheetCardFundingFilter) && Intrinsics.b(this.f43120a, ((PaymentSheetCardFundingFilter) obj).f43120a);
    }

    public final int hashCode() {
        return this.f43120a.hashCode();
    }

    public final String toString() {
        return "PaymentSheetCardFundingFilter(allowedCardFundingTypes=" + this.f43120a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itK = fq.c.k(this.f43120a, dest);
        while (itK.hasNext()) {
            ((PaymentSheet$CardFundingType) itK.next()).writeToParcel(dest, i5);
        }
    }
}
