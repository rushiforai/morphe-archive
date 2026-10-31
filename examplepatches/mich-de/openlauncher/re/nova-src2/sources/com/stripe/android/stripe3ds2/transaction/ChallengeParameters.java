package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeParameters;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ChallengeParameters implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ChallengeParameters> CREATOR = new sv.b(26);

    /* renamed from: a, reason: collision with root package name */
    public final String f45070a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45071b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45072c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45073d;

    /* renamed from: e, reason: collision with root package name */
    public final String f45074e;

    public ChallengeParameters(String str, String str2, String str3, String str4, String str5) {
        this.f45070a = str;
        this.f45071b = str2;
        this.f45072c = str3;
        this.f45073d = str4;
        this.f45074e = str5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ChallengeParameters)) {
            return false;
        }
        ChallengeParameters challengeParameters = (ChallengeParameters) obj;
        return Intrinsics.b(this.f45070a, challengeParameters.f45070a) && Intrinsics.b(this.f45071b, challengeParameters.f45071b) && Intrinsics.b(this.f45072c, challengeParameters.f45072c) && Intrinsics.b(this.f45073d, challengeParameters.f45073d) && Intrinsics.b(this.f45074e, challengeParameters.f45074e);
    }

    public final int hashCode() {
        String str = this.f45070a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f45071b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f45072c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f45073d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f45074e;
        return iHashCode4 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ChallengeParameters(threeDsServerTransactionId=", this.f45070a, ", acsTransactionId=", this.f45071b, ", acsRefNumber=");
        c0.D(sbW, this.f45072c, ", acsSignedContent=", this.f45073d, ", threeDSRequestorAppURL=");
        return c0.q(sbW, this.f45074e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45070a);
        dest.writeString(this.f45071b);
        dest.writeString(this.f45072c);
        dest.writeString(this.f45073d);
        dest.writeString(this.f45074e);
    }
}
