package com.stripe.android.link.ui.inline;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import rs.b0;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/ui/inline/UserInput;", "Landroid/os/Parcelable;", "SignIn", "SignUp", "Lcom/stripe/android/link/ui/inline/UserInput$SignIn;", "Lcom/stripe/android/link/ui/inline/UserInput$SignUp;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class UserInput implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/ui/inline/UserInput$SignIn;", "Lcom/stripe/android/link/ui/inline/UserInput;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SignIn extends UserInput {

        @NotNull
        public static final Parcelable.Creator<SignIn> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f43024a;

        public SignIn(String email) {
            Intrinsics.g(email, "email");
            this.f43024a = email;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SignIn) && Intrinsics.b(this.f43024a, ((SignIn) obj).f43024a);
        }

        public final int hashCode() {
            return this.f43024a.hashCode();
        }

        public final String toString() {
            return c0.l("SignIn(email=", this.f43024a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43024a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/ui/inline/UserInput$SignUp;", "Lcom/stripe/android/link/ui/inline/UserInput;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SignUp extends UserInput {

        @NotNull
        public static final Parcelable.Creator<SignUp> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f43025a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43026b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43027c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43028d;

        /* renamed from: e, reason: collision with root package name */
        public final b0 f43029e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43030f;

        public SignUp(String email, String str, String str2, String str3, b0 consentAction, String countryInferringMethod) {
            Intrinsics.g(email, "email");
            Intrinsics.g(consentAction, "consentAction");
            Intrinsics.g(countryInferringMethod, "countryInferringMethod");
            this.f43025a = email;
            this.f43026b = str;
            this.f43027c = str2;
            this.f43028d = str3;
            this.f43029e = consentAction;
            this.f43030f = countryInferringMethod;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SignUp)) {
                return false;
            }
            SignUp signUp = (SignUp) obj;
            return Intrinsics.b(this.f43025a, signUp.f43025a) && Intrinsics.b(this.f43026b, signUp.f43026b) && Intrinsics.b(this.f43027c, signUp.f43027c) && Intrinsics.b(this.f43028d, signUp.f43028d) && this.f43029e == signUp.f43029e && Intrinsics.b(this.f43030f, signUp.f43030f);
        }

        public final int hashCode() {
            int iHashCode = this.f43025a.hashCode() * 31;
            String str = this.f43026b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43027c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43028d;
            return this.f43030f.hashCode() + ((this.f43029e.hashCode() + ((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31)) * 31);
        }

        public final String toString() {
            StringBuilder sbW = c0.w("SignUp(email=", this.f43025a, ", phone=", this.f43026b, ", country=");
            c0.D(sbW, this.f43027c, ", name=", this.f43028d, ", consentAction=");
            sbW.append(this.f43029e);
            sbW.append(", countryInferringMethod=");
            sbW.append(this.f43030f);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43025a);
            dest.writeString(this.f43026b);
            dest.writeString(this.f43027c);
            dest.writeString(this.f43028d);
            dest.writeString(this.f43029e.name());
            dest.writeString(this.f43030f);
        }
    }
}
