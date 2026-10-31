package com.stripe.android.paymentsheet.paymentdatacollection.bacs;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationContract$Args;", "Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class BacsMandateConfirmationContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/bacs/BacsMandateConfirmationContract$Args;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f44902a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44903b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44904c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44905d;

        /* renamed from: e, reason: collision with root package name */
        public final PaymentSheet$Appearance f44906e;

        public Args(String email, String nameOnAccount, String sortCode, String accountNumber, PaymentSheet$Appearance appearance) {
            Intrinsics.g(email, "email");
            Intrinsics.g(nameOnAccount, "nameOnAccount");
            Intrinsics.g(sortCode, "sortCode");
            Intrinsics.g(accountNumber, "accountNumber");
            Intrinsics.g(appearance, "appearance");
            this.f44902a = email;
            this.f44903b = nameOnAccount;
            this.f44904c = sortCode;
            this.f44905d = accountNumber;
            this.f44906e = appearance;
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
            return Intrinsics.b(this.f44902a, args.f44902a) && Intrinsics.b(this.f44903b, args.f44903b) && Intrinsics.b(this.f44904c, args.f44904c) && Intrinsics.b(this.f44905d, args.f44905d) && Intrinsics.b(this.f44906e, args.f44906e);
        }

        public final int hashCode() {
            return this.f44906e.hashCode() + c0.e(c0.e(c0.e(this.f44902a.hashCode() * 31, 31, this.f44903b), 31, this.f44904c), 31, this.f44905d);
        }

        public final String toString() {
            StringBuilder sbW = c0.w("Args(email=", this.f44902a, ", nameOnAccount=", this.f44903b, ", sortCode=");
            c0.D(sbW, this.f44904c, ", accountNumber=", this.f44905d, ", appearance=");
            sbW.append(this.f44906e);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44902a);
            dest.writeString(this.f44903b);
            dest.writeString(this.f44904c);
            dest.writeString(this.f44905d);
            this.f44906e.writeToParcel(dest, i5);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) BacsMandateConfirmationActivity.class).putExtra("extra_activity_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        BacsMandateConfirmationResult bacsMandateConfirmationResult = (intent == null || (extras = intent.getExtras()) == null) ? null : (BacsMandateConfirmationResult) vm.d.i(extras, "extra_activity_result", BacsMandateConfirmationResult.class);
        return bacsMandateConfirmationResult == null ? BacsMandateConfirmationResult.Cancelled.f44907a : bacsMandateConfirmationResult;
    }
}
