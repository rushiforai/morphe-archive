package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/DisplayablePaymentDetails;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ft/s", "ft/t", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class DisplayablePaymentDetails implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final String f43382a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43383b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43384c;

    /* renamed from: d, reason: collision with root package name */
    public final Long f43385d;

    @NotNull
    public static final ft.t Companion = new ft.t();

    @NotNull
    public static final Parcelable.Creator<DisplayablePaymentDetails> CREATOR = new ft.q(3);

    public /* synthetic */ DisplayablePaymentDetails(int i5, String str, String str2, String str3, Long l9) {
        if ((i5 & 1) == 0) {
            this.f43382a = null;
        } else {
            this.f43382a = str;
        }
        if ((i5 & 2) == 0) {
            this.f43383b = null;
        } else {
            this.f43383b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f43384c = null;
        } else {
            this.f43384c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f43385d = null;
        } else {
            this.f43385d = l9;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DisplayablePaymentDetails)) {
            return false;
        }
        DisplayablePaymentDetails displayablePaymentDetails = (DisplayablePaymentDetails) obj;
        return Intrinsics.b(this.f43382a, displayablePaymentDetails.f43382a) && Intrinsics.b(this.f43383b, displayablePaymentDetails.f43383b) && Intrinsics.b(this.f43384c, displayablePaymentDetails.f43384c) && Intrinsics.b(this.f43385d, displayablePaymentDetails.f43385d);
    }

    public final int hashCode() {
        String str = this.f43382a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f43383b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f43384c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Long l9 = this.f43385d;
        return iHashCode3 + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("DisplayablePaymentDetails(defaultCardBrand=", this.f43382a, ", defaultPaymentType=", this.f43383b, ", last4=");
        sbW.append(this.f43384c);
        sbW.append(", numberOfSavedPaymentDetails=");
        sbW.append(this.f43385d);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43382a);
        dest.writeString(this.f43383b);
        dest.writeString(this.f43384c);
        Long l9 = this.f43385d;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
    }

    public DisplayablePaymentDetails(String str, String str2, String str3, Long l9) {
        this.f43382a = str;
        this.f43383b = str2;
        this.f43384c = str3;
        this.f43385d = l9;
    }
}
