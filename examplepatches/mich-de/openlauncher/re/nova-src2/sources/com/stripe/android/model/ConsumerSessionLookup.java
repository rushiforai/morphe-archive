package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsumerSessionLookup;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ft/h", "ft/i", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ConsumerSessionLookup implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f43342a;

    /* renamed from: b, reason: collision with root package name */
    public final ConsumerSession f43343b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43344c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43345d;

    /* renamed from: e, reason: collision with root package name */
    public final DisplayablePaymentDetails f43346e;

    /* renamed from: f, reason: collision with root package name */
    public final ConsentUi f43347f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43348g;

    @NotNull
    public static final ft.i Companion = new ft.i();

    @NotNull
    public static final Parcelable.Creator<ConsumerSessionLookup> CREATOR = new eh.a(25);

    public /* synthetic */ ConsumerSessionLookup(int i5, boolean z11, ConsumerSession consumerSession, String str, String str2, DisplayablePaymentDetails displayablePaymentDetails, ConsentUi consentUi, String str3) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, ft.h.f55947a.getDescriptor());
        }
        this.f43342a = z11;
        if ((i5 & 2) == 0) {
            this.f43343b = null;
        } else {
            this.f43343b = consumerSession;
        }
        if ((i5 & 4) == 0) {
            this.f43344c = null;
        } else {
            this.f43344c = str;
        }
        if ((i5 & 8) == 0) {
            this.f43345d = null;
        } else {
            this.f43345d = str2;
        }
        if ((i5 & 16) == 0) {
            this.f43346e = null;
        } else {
            this.f43346e = displayablePaymentDetails;
        }
        if ((i5 & 32) == 0) {
            this.f43347f = null;
        } else {
            this.f43347f = consentUi;
        }
        if ((i5 & 64) == 0) {
            this.f43348g = null;
        } else {
            this.f43348g = str3;
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
        if (!(obj instanceof ConsumerSessionLookup)) {
            return false;
        }
        ConsumerSessionLookup consumerSessionLookup = (ConsumerSessionLookup) obj;
        return this.f43342a == consumerSessionLookup.f43342a && Intrinsics.b(this.f43343b, consumerSessionLookup.f43343b) && Intrinsics.b(this.f43344c, consumerSessionLookup.f43344c) && Intrinsics.b(this.f43345d, consumerSessionLookup.f43345d) && Intrinsics.b(this.f43346e, consumerSessionLookup.f43346e) && Intrinsics.b(this.f43347f, consumerSessionLookup.f43347f) && Intrinsics.b(this.f43348g, consumerSessionLookup.f43348g);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f43342a) * 31;
        ConsumerSession consumerSession = this.f43343b;
        int iHashCode2 = (iHashCode + (consumerSession == null ? 0 : consumerSession.hashCode())) * 31;
        String str = this.f43344c;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43345d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        DisplayablePaymentDetails displayablePaymentDetails = this.f43346e;
        int iHashCode5 = (iHashCode4 + (displayablePaymentDetails == null ? 0 : displayablePaymentDetails.hashCode())) * 31;
        ConsentUi consentUi = this.f43347f;
        int iHashCode6 = (iHashCode5 + (consentUi == null ? 0 : consentUi.hashCode())) * 31;
        String str3 = this.f43348g;
        return iHashCode6 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ConsumerSessionLookup(exists=");
        sb2.append(this.f43342a);
        sb2.append(", consumerSession=");
        sb2.append(this.f43343b);
        sb2.append(", errorMessage=");
        b.c0.D(sb2, this.f43344c, ", publishableKey=", this.f43345d, ", displayablePaymentDetails=");
        sb2.append(this.f43346e);
        sb2.append(", consentUi=");
        sb2.append(this.f43347f);
        sb2.append(", suggestedEmail=");
        return b.c0.q(sb2, this.f43348g, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f43342a ? 1 : 0);
        ConsumerSession consumerSession = this.f43343b;
        if (consumerSession == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            consumerSession.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43344c);
        dest.writeString(this.f43345d);
        DisplayablePaymentDetails displayablePaymentDetails = this.f43346e;
        if (displayablePaymentDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            displayablePaymentDetails.writeToParcel(dest, i5);
        }
        ConsentUi consentUi = this.f43347f;
        if (consentUi == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            consentUi.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43348g);
    }

    public ConsumerSessionLookup(boolean z11, ConsumerSession consumerSession, String str, String str2, DisplayablePaymentDetails displayablePaymentDetails, ConsentUi consentUi, String str3) {
        this.f43342a = z11;
        this.f43343b = consumerSession;
        this.f43344c = str;
        this.f43345d = str2;
        this.f43346e = displayablePaymentDetails;
        this.f43347f = consentUi;
        this.f43348g = str3;
    }
}
