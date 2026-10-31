package com.stripe.android.paymentelement.embedded.manage;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentelement.embedded.manage.ManageResult;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\bÁ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/manage/ManageContract;", "Lk/b;", "Lcom/stripe/android/paymentelement/embedded/manage/ManageContract$Args;", "Lcom/stripe/android/paymentelement/embedded/manage/ManageResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ManageContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/manage/ManageContract$Args;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethodMetadata f44228a;

        /* renamed from: b, reason: collision with root package name */
        public final CustomerState f44229b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentSelection f44230c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44231d;

        public Args(PaymentMethodMetadata paymentMethodMetadata, CustomerState customerState, PaymentSelection paymentSelection, String paymentElementCallbackIdentifier) {
            Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
            Intrinsics.g(customerState, "customerState");
            Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
            this.f44228a = paymentMethodMetadata;
            this.f44229b = customerState;
            this.f44230c = paymentSelection;
            this.f44231d = paymentElementCallbackIdentifier;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Args)) {
                return false;
            }
            Args args = (Args) obj;
            return Intrinsics.b(this.f44228a, args.f44228a) && Intrinsics.b(this.f44229b, args.f44229b) && Intrinsics.b(this.f44230c, args.f44230c) && Intrinsics.b(this.f44231d, args.f44231d);
        }

        public final int hashCode() {
            int iHashCode = (this.f44229b.hashCode() + (this.f44228a.hashCode() * 31)) * 31;
            PaymentSelection paymentSelection = this.f44230c;
            return this.f44231d.hashCode() + ((iHashCode + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 31);
        }

        public final String toString() {
            return "Args(paymentMethodMetadata=" + this.f44228a + ", customerState=" + this.f44229b + ", selection=" + this.f44230c + ", paymentElementCallbackIdentifier=" + this.f44231d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44228a, i5);
            dest.writeParcelable(this.f44229b, i5);
            dest.writeParcelable(this.f44230c, i5);
            dest.writeString(this.f44231d);
        }
    }

    static {
        new ManageContract();
    }

    private ManageContract() {
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) ManageActivity.class).putExtra("extra_activity_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        ManageResult manageResult = (intent == null || (extras = intent.getExtras()) == null) ? null : (ManageResult) vm.d.i(extras, "extra_activity_result", ManageResult.class);
        return manageResult == null ? ManageResult.Error.f44235a : manageResult;
    }
}
