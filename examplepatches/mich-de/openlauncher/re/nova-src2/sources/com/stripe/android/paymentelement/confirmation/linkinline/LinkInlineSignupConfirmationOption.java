package com.stripe.android.paymentelement.confirmation.linkinline;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import ww.c;
import xt.g;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/linkinline/LinkInlineSignupConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "xt/g", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkInlineSignupConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<LinkInlineSignupConfirmationOption> CREATOR = new c(13);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodCreateParams f44188a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodOptionsParams f44189b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentMethodExtraParams f44190c;

    /* renamed from: d, reason: collision with root package name */
    public final g f44191d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkConfiguration f44192e;

    /* renamed from: f, reason: collision with root package name */
    public final UserInput f44193f;

    public LinkInlineSignupConfirmationOption(PaymentMethodCreateParams createParams, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams, g saveOption, LinkConfiguration linkConfiguration, UserInput userInput) {
        Intrinsics.g(createParams, "createParams");
        Intrinsics.g(saveOption, "saveOption");
        Intrinsics.g(linkConfiguration, "linkConfiguration");
        Intrinsics.g(userInput, "userInput");
        this.f44188a = createParams;
        this.f44189b = paymentMethodOptionsParams;
        this.f44190c = paymentMethodExtraParams;
        this.f44191d = saveOption;
        this.f44192e = linkConfiguration;
        this.f44193f = userInput;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkInlineSignupConfirmationOption)) {
            return false;
        }
        LinkInlineSignupConfirmationOption linkInlineSignupConfirmationOption = (LinkInlineSignupConfirmationOption) obj;
        return Intrinsics.b(this.f44188a, linkInlineSignupConfirmationOption.f44188a) && Intrinsics.b(this.f44189b, linkInlineSignupConfirmationOption.f44189b) && Intrinsics.b(this.f44190c, linkInlineSignupConfirmationOption.f44190c) && this.f44191d == linkInlineSignupConfirmationOption.f44191d && Intrinsics.b(this.f44192e, linkInlineSignupConfirmationOption.f44192e) && Intrinsics.b(this.f44193f, linkInlineSignupConfirmationOption.f44193f);
    }

    public final int hashCode() {
        int iHashCode = this.f44188a.hashCode() * 31;
        PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44189b;
        int iHashCode2 = (iHashCode + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
        PaymentMethodExtraParams paymentMethodExtraParams = this.f44190c;
        return this.f44193f.hashCode() + ((this.f44192e.hashCode() + ((this.f44191d.hashCode() + ((iHashCode2 + (paymentMethodExtraParams != null ? paymentMethodExtraParams.hashCode() : 0)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "LinkInlineSignupConfirmationOption(createParams=" + this.f44188a + ", optionsParams=" + this.f44189b + ", extraParams=" + this.f44190c + ", saveOption=" + this.f44191d + ", linkConfiguration=" + this.f44192e + ", userInput=" + this.f44193f + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44188a, i5);
        dest.writeParcelable(this.f44189b, i5);
        dest.writeParcelable(this.f44190c, i5);
        dest.writeString(this.f44191d.name());
        dest.writeParcelable(this.f44192e, i5);
        dest.writeParcelable(this.f44193f, i5);
    }
}
