package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.amplitude.android.TrackingOptions;
import com.tiktok.util.TTConst;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/MandateDataParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Type", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class MandateDataParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<MandateDataParams> CREATOR = new y1();

    /* renamed from: a, reason: collision with root package name */
    public final Type f43521a;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003\u0082\u0001\u0001\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/MandateDataParams$Type;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Online", "Lcom/stripe/android/model/MandateDataParams$Type$Online;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Type implements StripeParamsModel, Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/MandateDataParams$Type$Online;", "Lcom/stripe/android/model/MandateDataParams$Type;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Online extends Type {

            @NotNull
            public static final Parcelable.Creator<Online> CREATOR = new z1();

            /* renamed from: d, reason: collision with root package name */
            public static final Online f43522d = new Online(null, null, true);

            /* renamed from: a, reason: collision with root package name */
            public final String f43523a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43524b;

            /* renamed from: c, reason: collision with root package name */
            public final boolean f43525c;

            public Online(String str, String str2, boolean z11) {
                this.f43523a = str;
                this.f43524b = str2;
                this.f43525c = z11;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Online)) {
                    return false;
                }
                Online online = (Online) obj;
                return Intrinsics.b(this.f43523a, online.f43523a) && Intrinsics.b(this.f43524b, online.f43524b) && this.f43525c == online.f43525c;
            }

            public final int hashCode() {
                String str = this.f43523a;
                int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
                String str2 = this.f43524b;
                return Boolean.hashCode(this.f43525c) + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
            }

            @Override // com.stripe.android.model.StripeParamsModel
            public final Map k0() {
                if (this.f43525c) {
                    return b70.k.e0(new Pair("infer_from_client", Boolean.TRUE));
                }
                String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                String str2 = this.f43523a;
                if (str2 == null) {
                    str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                Pair pair = new Pair(TrackingOptions.AMP_TRACKING_OPTION_IP_ADDRESS, str2);
                String str3 = this.f43524b;
                if (str3 != null) {
                    str = str3;
                }
                return MapsKt.j0(pair, new Pair("user_agent", str));
            }

            public final String toString() {
                return a80.m.k(b.c0.w("Online(ipAddress=", this.f43523a, ", userAgent=", this.f43524b, ", inferFromClient="), this.f43525c, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43523a);
                dest.writeString(this.f43524b);
                dest.writeInt(this.f43525c ? 1 : 0);
            }
        }
    }

    public MandateDataParams(Type type) {
        Intrinsics.g(type, "type");
        this.f43521a = type;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof MandateDataParams) && Intrinsics.b(this.f43521a, ((MandateDataParams) obj).f43521a);
    }

    public final int hashCode() {
        return this.f43521a.hashCode();
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        Type type = this.f43521a;
        type.getClass();
        return com.google.android.gms.internal.measurement.k2.o("customer_acceptance", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "online"), new Pair("online", ((Type.Online) type).k0())));
    }

    public final String toString() {
        return "MandateDataParams(type=" + this.f43521a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43521a, i5);
    }
}
