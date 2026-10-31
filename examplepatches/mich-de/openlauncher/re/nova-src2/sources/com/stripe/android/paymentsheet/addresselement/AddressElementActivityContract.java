package com.stripe.android.paymentsheet.addresselement;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.addresselement.AddressLauncherResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\bÁ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0002\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressElementActivityContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/addresselement/AddressElementActivityContract$Args;", "Lcom/stripe/android/paymentsheet/addresselement/AddressLauncherResult;", "<init>", "()V", "Args", "Result", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AddressElementActivityContract extends k.b {

    /* renamed from: a, reason: collision with root package name */
    public static final AddressElementActivityContract f44685a = new AddressElementActivityContract();

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressElementActivityContract$Args;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f44686a;

        /* renamed from: b, reason: collision with root package name */
        public final AddressLauncher$Configuration f44687b;

        public Args(String publishableKey, AddressLauncher$Configuration addressLauncher$Configuration) {
            Intrinsics.g(publishableKey, "publishableKey");
            this.f44686a = publishableKey;
            this.f44687b = addressLauncher$Configuration;
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
            return Intrinsics.b(this.f44686a, args.f44686a) && Intrinsics.b(this.f44687b, args.f44687b);
        }

        public final int hashCode() {
            int iHashCode = this.f44686a.hashCode() * 31;
            AddressLauncher$Configuration addressLauncher$Configuration = this.f44687b;
            return iHashCode + (addressLauncher$Configuration == null ? 0 : addressLauncher$Configuration.hashCode());
        }

        public final String toString() {
            return "Args(publishableKey=" + this.f44686a + ", config=" + this.f44687b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44686a);
            AddressLauncher$Configuration addressLauncher$Configuration = this.f44687b;
            if (addressLauncher$Configuration == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                addressLauncher$Configuration.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressElementActivityContract$Result;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Result implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Result> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final AddressLauncherResult f44688a;

        public Result(AddressLauncherResult addressOptionsResult) {
            Intrinsics.g(addressOptionsResult, "addressOptionsResult");
            this.f44688a = addressOptionsResult;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Result) && Intrinsics.b(this.f44688a, ((Result) obj).f44688a);
        }

        public final int hashCode() {
            return this.f44688a.hashCode();
        }

        public final String toString() {
            return "Result(addressOptionsResult=" + this.f44688a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44688a, i5);
        }
    }

    private AddressElementActivityContract() {
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) AddressElementActivity.class).putExtra("com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract.extra_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Result result;
        AddressLauncherResult addressLauncherResult;
        return (intent == null || (result = (Result) intent.getParcelableExtra("com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract.extra_result")) == null || (addressLauncherResult = result.f44688a) == null) ? new AddressLauncherResult.Canceled(true) : addressLauncherResult;
    }
}
