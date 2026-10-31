package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/RadarOptions;", "Lcom/stripe/android/model/StripeParamsModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class RadarOptions implements StripeParamsModel {

    @NotNull
    public static final Parcelable.Creator<RadarOptions> CREATOR = new ft.q(10);

    /* renamed from: a, reason: collision with root package name */
    public final String f43758a;

    /* renamed from: b, reason: collision with root package name */
    public final AndroidVerificationObject f43759b;

    public RadarOptions(String str, AndroidVerificationObject androidVerificationObject) {
        this.f43758a = str;
        this.f43759b = androidVerificationObject;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof RadarOptions)) {
            return false;
        }
        RadarOptions radarOptions = (RadarOptions) obj;
        return Intrinsics.b(this.f43758a, radarOptions.f43758a) && Intrinsics.b(this.f43759b, radarOptions.f43759b);
    }

    public final int hashCode() {
        String str = this.f43758a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        AndroidVerificationObject androidVerificationObject = this.f43759b;
        return iHashCode + (androidVerificationObject != null ? androidVerificationObject.hashCode() : 0);
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        String str = this.f43758a;
        Map mapN = str != null ? a80.m.n("hcaptcha_token", str) : null;
        Map map = b70.h.f17594a;
        if (mapN == null) {
            mapN = map;
        }
        AndroidVerificationObject androidVerificationObject = this.f43759b;
        Map mapO = androidVerificationObject != null ? com.google.android.gms.internal.measurement.k2.o("android_verification_object", androidVerificationObject.k0()) : null;
        if (mapO != null) {
            map = mapO;
        }
        return MapsKt.m0(mapN, map);
    }

    public final String toString() {
        return "RadarOptions(hCaptchaToken=" + this.f43758a + ", androidVerificationObject=" + this.f43759b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43758a);
        AndroidVerificationObject androidVerificationObject = this.f43759b;
        if (androidVerificationObject == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            androidVerificationObject.writeToParcel(dest, i5);
        }
    }
}
