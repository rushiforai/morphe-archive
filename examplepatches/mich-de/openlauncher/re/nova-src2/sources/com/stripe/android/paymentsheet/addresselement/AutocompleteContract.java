package com.stripe.android.paymentsheet.addresselement;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\bÁ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0002\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract;", "Lk/b;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Args;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result;", "<init>", "()V", "Args", "Result", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AutocompleteContract extends k.b {

    /* renamed from: a, reason: collision with root package name */
    public static final AutocompleteContract f44710a = new AutocompleteContract();

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Args;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new x();

        /* renamed from: a, reason: collision with root package name */
        public final String f44711a;

        /* renamed from: b, reason: collision with root package name */
        public final String f44712b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44713c;

        /* renamed from: d, reason: collision with root package name */
        public final AutocompleteAppearanceContext f44714d;

        public Args(String id2, String country, String googlePlacesApiKey, AutocompleteAppearanceContext appearanceContext) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(country, "country");
            Intrinsics.g(googlePlacesApiKey, "googlePlacesApiKey");
            Intrinsics.g(appearanceContext, "appearanceContext");
            this.f44711a = id2;
            this.f44712b = country;
            this.f44713c = googlePlacesApiKey;
            this.f44714d = appearanceContext;
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
            return Intrinsics.b(this.f44711a, args.f44711a) && Intrinsics.b(this.f44712b, args.f44712b) && Intrinsics.b(this.f44713c, args.f44713c) && Intrinsics.b(this.f44714d, args.f44714d);
        }

        public final int hashCode() {
            return this.f44714d.hashCode() + b.c0.e(b.c0.e(this.f44711a.hashCode() * 31, 31, this.f44712b), 31, this.f44713c);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Args(id=", this.f44711a, ", country=", this.f44712b, ", googlePlacesApiKey=");
            sbW.append(this.f44713c);
            sbW.append(", appearanceContext=");
            sbW.append(this.f44714d);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44711a);
            dest.writeString(this.f44712b);
            dest.writeString(this.f44713c);
            dest.writeParcelable(this.f44714d, i5);
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "EnterManually", "Address", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result$Address;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result$EnterManually;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Result implements Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result$Address;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Address extends Result {

            @NotNull
            public static final Parcelable.Creator<Address> CREATOR = new y();

            /* renamed from: a, reason: collision with root package name */
            public final String f44715a;

            /* renamed from: b, reason: collision with root package name */
            public final PaymentSheet$Address f44716b;

            public Address(String id2, PaymentSheet$Address paymentSheet$Address) {
                Intrinsics.g(id2, "id");
                this.f44715a = id2;
                this.f44716b = paymentSheet$Address;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Address)) {
                    return false;
                }
                Address address = (Address) obj;
                return Intrinsics.b(this.f44715a, address.f44715a) && Intrinsics.b(this.f44716b, address.f44716b);
            }

            @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteContract.Result
            /* renamed from: getId, reason: from getter */
            public final String getF44717a() {
                return this.f44715a;
            }

            public final int hashCode() {
                int iHashCode = this.f44715a.hashCode() * 31;
                PaymentSheet$Address paymentSheet$Address = this.f44716b;
                return iHashCode + (paymentSheet$Address == null ? 0 : paymentSheet$Address.hashCode());
            }

            public final String toString() {
                return "Address(id=" + this.f44715a + ", address=" + this.f44716b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44715a);
                PaymentSheet$Address paymentSheet$Address = this.f44716b;
                if (paymentSheet$Address == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    paymentSheet$Address.writeToParcel(dest, i5);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result$EnterManually;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteContract$Result;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class EnterManually extends Result {

            @NotNull
            public static final Parcelable.Creator<EnterManually> CREATOR = new z();

            /* renamed from: a, reason: collision with root package name */
            public final String f44717a;

            /* renamed from: b, reason: collision with root package name */
            public final PaymentSheet$Address f44718b;

            public EnterManually(String id2, PaymentSheet$Address paymentSheet$Address) {
                Intrinsics.g(id2, "id");
                this.f44717a = id2;
                this.f44718b = paymentSheet$Address;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof EnterManually)) {
                    return false;
                }
                EnterManually enterManually = (EnterManually) obj;
                return Intrinsics.b(this.f44717a, enterManually.f44717a) && Intrinsics.b(this.f44718b, enterManually.f44718b);
            }

            @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteContract.Result
            /* renamed from: getId, reason: from getter */
            public final String getF44717a() {
                return this.f44717a;
            }

            public final int hashCode() {
                int iHashCode = this.f44717a.hashCode() * 31;
                PaymentSheet$Address paymentSheet$Address = this.f44718b;
                return iHashCode + (paymentSheet$Address == null ? 0 : paymentSheet$Address.hashCode());
            }

            public final String toString() {
                return "EnterManually(id=" + this.f44717a + ", address=" + this.f44718b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44717a);
                PaymentSheet$Address paymentSheet$Address = this.f44718b;
                if (paymentSheet$Address == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    paymentSheet$Address.writeToParcel(dest, i5);
                }
            }
        }

        /* renamed from: getId */
        public abstract String getF44717a();
    }

    private AutocompleteContract() {
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) AutocompleteActivity.class).putExtra("com.stripe.android.paymentsheet.addresselement.AutocompleteContract.extra_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Result result;
        if (intent == null || (result = (Result) intent.getParcelableExtra("com.stripe.android.paymentsheet.addresselement.AutocompleteContract.extra_result")) == null) {
            throw new IllegalStateException("Unknown MPE address autocomplete result!");
        }
        return result;
    }
}
