package com.stripe.android.paymentsheet.paymentdatacollection.bacs;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult;", "Landroid/os/Parcelable;", "Confirmed", "ModifyDetails", "Cancelled", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult$Cancelled;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult$Confirmed;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult$ModifyDetails;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface BacsMandateConfirmationResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult$Cancelled;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Cancelled implements BacsMandateConfirmationResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Cancelled f44907a = new Cancelled();

        @NotNull
        public static final Parcelable.Creator<Cancelled> CREATOR = new c();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult$Confirmed;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Confirmed implements BacsMandateConfirmationResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Confirmed f44908a = new Confirmed();

        @NotNull
        public static final Parcelable.Creator<Confirmed> CREATOR = new d();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult$ModifyDetails;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ModifyDetails implements BacsMandateConfirmationResult {

        /* renamed from: a, reason: collision with root package name */
        public static final ModifyDetails f44909a = new ModifyDetails();

        @NotNull
        public static final Parcelable.Creator<ModifyDetails> CREATOR = new e();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }
}
