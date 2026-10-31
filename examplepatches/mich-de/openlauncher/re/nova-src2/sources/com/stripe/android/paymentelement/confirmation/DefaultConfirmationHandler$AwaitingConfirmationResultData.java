package com.stripe.android.paymentelement.confirmation;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentelement/confirmation/DefaultConfirmationHandler$AwaitingConfirmationResultData", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class DefaultConfirmationHandler$AwaitingConfirmationResultData implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<DefaultConfirmationHandler$AwaitingConfirmationResultData> CREATOR = new ji.a(28);

    /* renamed from: a, reason: collision with root package name */
    public final String f44134a;

    /* renamed from: b, reason: collision with root package name */
    public final ConfirmationHandler$Option f44135b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f44136c;

    public DefaultConfirmationHandler$AwaitingConfirmationResultData(String key, ConfirmationHandler$Option confirmationOption, boolean z11) {
        Intrinsics.g(key, "key");
        Intrinsics.g(confirmationOption, "confirmationOption");
        this.f44134a = key;
        this.f44135b = confirmationOption;
        this.f44136c = z11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DefaultConfirmationHandler$AwaitingConfirmationResultData)) {
            return false;
        }
        DefaultConfirmationHandler$AwaitingConfirmationResultData defaultConfirmationHandler$AwaitingConfirmationResultData = (DefaultConfirmationHandler$AwaitingConfirmationResultData) obj;
        return Intrinsics.b(this.f44134a, defaultConfirmationHandler$AwaitingConfirmationResultData.f44134a) && Intrinsics.b(this.f44135b, defaultConfirmationHandler$AwaitingConfirmationResultData.f44135b) && this.f44136c == defaultConfirmationHandler$AwaitingConfirmationResultData.f44136c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f44136c) + ((this.f44135b.hashCode() + (this.f44134a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AwaitingConfirmationResultData(key=");
        sb2.append(this.f44134a);
        sb2.append(", confirmationOption=");
        sb2.append(this.f44135b);
        sb2.append(", receivesResultInProcess=");
        return m.k(sb2, this.f44136c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44134a);
        dest.writeParcelable(this.f44135b, i5);
        dest.writeInt(this.f44136c ? 1 : 0);
    }
}
