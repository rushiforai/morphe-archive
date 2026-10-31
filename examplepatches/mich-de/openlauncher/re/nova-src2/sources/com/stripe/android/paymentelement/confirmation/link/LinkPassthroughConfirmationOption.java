package com.stripe.android.paymentelement.confirmation.link;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import wt.g;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/link/LinkPassthroughConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkPassthroughConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<LinkPassthroughConfirmationOption> CREATOR = new g();

    /* renamed from: a, reason: collision with root package name */
    public final String f44182a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44183b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44184c;

    /* renamed from: d, reason: collision with root package name */
    public final String f44185d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentMethod.AllowRedisplay f44186e;

    public LinkPassthroughConfirmationOption(String paymentDetailsId, String expectedPaymentMethodType, String str, String str2, PaymentMethod.AllowRedisplay allowRedisplay) {
        Intrinsics.g(paymentDetailsId, "paymentDetailsId");
        Intrinsics.g(expectedPaymentMethodType, "expectedPaymentMethodType");
        this.f44182a = paymentDetailsId;
        this.f44183b = expectedPaymentMethodType;
        this.f44184c = str;
        this.f44185d = str2;
        this.f44186e = allowRedisplay;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkPassthroughConfirmationOption)) {
            return false;
        }
        LinkPassthroughConfirmationOption linkPassthroughConfirmationOption = (LinkPassthroughConfirmationOption) obj;
        return Intrinsics.b(this.f44182a, linkPassthroughConfirmationOption.f44182a) && Intrinsics.b(this.f44183b, linkPassthroughConfirmationOption.f44183b) && Intrinsics.b(this.f44184c, linkPassthroughConfirmationOption.f44184c) && Intrinsics.b(this.f44185d, linkPassthroughConfirmationOption.f44185d) && this.f44186e == linkPassthroughConfirmationOption.f44186e;
    }

    public final int hashCode() {
        int iE = c0.e(this.f44182a.hashCode() * 31, 31, this.f44183b);
        String str = this.f44184c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f44185d;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        PaymentMethod.AllowRedisplay allowRedisplay = this.f44186e;
        return iHashCode2 + (allowRedisplay != null ? allowRedisplay.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("LinkPassthroughConfirmationOption(paymentDetailsId=", this.f44182a, ", expectedPaymentMethodType=", this.f44183b, ", cvc=");
        c0.D(sbW, this.f44184c, ", billingPhone=", this.f44185d, ", allowRedisplay=");
        sbW.append(this.f44186e);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44182a);
        dest.writeString(this.f44183b);
        dest.writeString(this.f44184c);
        dest.writeString(this.f44185d);
        dest.writeParcelable(this.f44186e, i5);
    }
}
