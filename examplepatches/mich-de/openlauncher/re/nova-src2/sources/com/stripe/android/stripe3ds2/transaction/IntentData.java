package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/IntentData;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class IntentData implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<IntentData> CREATOR = new sv.b(28);

    /* renamed from: e, reason: collision with root package name */
    public static final IntentData f45113e = new IntentData(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);

    /* renamed from: a, reason: collision with root package name */
    public final String f45114a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45115b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45116c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45117d;

    public IntentData(String clientSecret, String sourceId, String publishableKey, String str) {
        Intrinsics.g(clientSecret, "clientSecret");
        Intrinsics.g(sourceId, "sourceId");
        Intrinsics.g(publishableKey, "publishableKey");
        this.f45114a = clientSecret;
        this.f45115b = sourceId;
        this.f45116c = publishableKey;
        this.f45117d = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IntentData)) {
            return false;
        }
        IntentData intentData = (IntentData) obj;
        return Intrinsics.b(this.f45114a, intentData.f45114a) && Intrinsics.b(this.f45115b, intentData.f45115b) && Intrinsics.b(this.f45116c, intentData.f45116c) && Intrinsics.b(this.f45117d, intentData.f45117d);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f45114a.hashCode() * 31, 31, this.f45115b), 31, this.f45116c);
        String str = this.f45117d;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.s(c0.w("IntentData(clientSecret=", this.f45114a, ", sourceId=", this.f45115b, ", publishableKey="), this.f45116c, ", accountId=", this.f45117d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45114a);
        dest.writeString(this.f45115b);
        dest.writeString(this.f45116c);
        dest.writeString(this.f45117d);
    }
}
