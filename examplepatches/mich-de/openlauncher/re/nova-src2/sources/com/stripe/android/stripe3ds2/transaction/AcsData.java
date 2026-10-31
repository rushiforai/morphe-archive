package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import java.security.interfaces.ECPublicKey;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/AcsData;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AcsData implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AcsData> CREATOR = new sv.b(24);

    /* renamed from: a, reason: collision with root package name */
    public final String f45055a;

    /* renamed from: b, reason: collision with root package name */
    public final ECPublicKey f45056b;

    /* renamed from: c, reason: collision with root package name */
    public final ECPublicKey f45057c;

    public AcsData(String acsUrl, ECPublicKey acsEphemPubKey, ECPublicKey sdkEphemPubKey) {
        Intrinsics.g(acsUrl, "acsUrl");
        Intrinsics.g(acsEphemPubKey, "acsEphemPubKey");
        Intrinsics.g(sdkEphemPubKey, "sdkEphemPubKey");
        this.f45055a = acsUrl;
        this.f45056b = acsEphemPubKey;
        this.f45057c = sdkEphemPubKey;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AcsData)) {
            return false;
        }
        AcsData acsData = (AcsData) obj;
        return Intrinsics.b(this.f45055a, acsData.f45055a) && Intrinsics.b(this.f45056b, acsData.f45056b) && Intrinsics.b(this.f45057c, acsData.f45057c);
    }

    public final int hashCode() {
        return this.f45057c.hashCode() + ((this.f45056b.hashCode() + (this.f45055a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "AcsData(acsUrl=" + this.f45055a + ", acsEphemPubKey=" + this.f45056b + ", sdkEphemPubKey=" + this.f45057c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45055a);
        dest.writeSerializable(this.f45056b);
        dest.writeSerializable(this.f45057c);
    }
}
