package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.amplitude.android.TrackingOptions;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.stripe.android.core.model.StripeModel;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/Address;", "Lcom/stripe/android/core/model/StripeModel;", "Lcom/stripe/android/model/StripeParamsModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class Address implements StripeModel, StripeParamsModel {

    @NotNull
    public static final Parcelable.Creator<Address> CREATOR = new eh.a(13);

    /* renamed from: a, reason: collision with root package name */
    public final String f43127a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43128b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43129c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43130d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43131e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43132f;

    public Address(String str, String str2, String str3, String str4, String str5, String str6) {
        this.f43127a = str;
        this.f43128b = str2;
        this.f43129c = str3;
        this.f43130d = str4;
        this.f43131e = str5;
        this.f43132f = str6;
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
        return Intrinsics.b(this.f43127a, address.f43127a) && Intrinsics.b(this.f43128b, address.f43128b) && Intrinsics.b(this.f43129c, address.f43129c) && Intrinsics.b(this.f43130d, address.f43130d) && Intrinsics.b(this.f43131e, address.f43131e) && Intrinsics.b(this.f43132f, address.f43132f);
    }

    public final int hashCode() {
        String str = this.f43127a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f43128b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f43129c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43130d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43131e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f43132f;
        return iHashCode5 + (str6 != null ? str6.hashCode() : 0);
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String str2 = this.f43127a;
        if (str2 == null) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair = new Pair(TrackingOptions.AMP_TRACKING_OPTION_CITY, str2);
        String str3 = this.f43128b;
        if (str3 == null) {
            str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair2 = new Pair("country", str3);
        String str4 = this.f43129c;
        if (str4 == null) {
            str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair3 = new Pair("line1", str4);
        String str5 = this.f43130d;
        if (str5 == null) {
            str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair4 = new Pair("line2", str5);
        String str6 = this.f43131e;
        if (str6 == null) {
            str6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Pair pair5 = new Pair(PlaceTypes.POSTAL_CODE, str6);
        String str7 = this.f43132f;
        if (str7 != null) {
            str = str7;
        }
        Map mapJ0 = MapsKt.j0(pair, pair2, pair3, pair4, pair5, new Pair("state", str));
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : mapJ0.entrySet()) {
            if (((String) entry.getValue()).length() > 0) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return linkedHashMap;
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("Address(city=", this.f43127a, ", country=", this.f43128b, ", line1=");
        b.c0.D(sbW, this.f43129c, ", line2=", this.f43130d, ", postalCode=");
        return b.c0.s(sbW, this.f43131e, ", state=", this.f43132f, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43127a);
        dest.writeString(this.f43128b);
        dest.writeString(this.f43129c);
        dest.writeString(this.f43130d);
        dest.writeString(this.f43131e);
        dest.writeString(this.f43132f);
    }
}
