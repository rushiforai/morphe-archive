package com.stripe.android.paymentelement.confirmation.linkinline;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import ww.c;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentelement/confirmation/linkinline/LinkInlineSignupConfirmationDefinition$Result", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkInlineSignupConfirmationDefinition$Result implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<LinkInlineSignupConfirmationDefinition$Result> CREATOR = new c(12);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodConfirmationOption f44187a;

    public LinkInlineSignupConfirmationDefinition$Result(PaymentMethodConfirmationOption nextConfirmationOption) {
        Intrinsics.g(nextConfirmationOption, "nextConfirmationOption");
        this.f44187a = nextConfirmationOption;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof LinkInlineSignupConfirmationDefinition$Result) && Intrinsics.b(this.f44187a, ((LinkInlineSignupConfirmationDefinition$Result) obj).f44187a);
    }

    public final int hashCode() {
        return this.f44187a.hashCode();
    }

    public final String toString() {
        return "Result(nextConfirmationOption=" + this.f44187a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44187a, i5);
    }
}
