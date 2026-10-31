package com.stripe.android.customersheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/customersheet/InternalCustomerSheetResult;", "Landroid/os/Parcelable;", "Canceled", k.f40331e, "Lcom/stripe/android/customersheet/InternalCustomerSheetResult$Canceled;", "Lcom/stripe/android/customersheet/InternalCustomerSheetResult$Error;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class InternalCustomerSheetResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/customersheet/InternalCustomerSheetResult$Canceled;", "Lcom/stripe/android/customersheet/InternalCustomerSheetResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends InternalCustomerSheetResult {

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSelection f42607a;

        public Canceled(PaymentSelection paymentSelection) {
            this.f42607a = paymentSelection;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Canceled) && Intrinsics.b(this.f42607a, ((Canceled) obj).f42607a);
        }

        public final int hashCode() {
            PaymentSelection paymentSelection = this.f42607a;
            if (paymentSelection == null) {
                return 0;
            }
            return paymentSelection.hashCode();
        }

        public final String toString() {
            return "Canceled(paymentSelection=" + this.f42607a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f42607a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/customersheet/InternalCustomerSheetResult$Error;", "Lcom/stripe/android/customersheet/InternalCustomerSheetResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Error extends InternalCustomerSheetResult {

        @NotNull
        public static final Parcelable.Creator<Error> CREATOR = new f();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42608a;

        public Error(Throwable exception) {
            Intrinsics.g(exception, "exception");
            this.f42608a = exception;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42608a);
        }
    }
}
