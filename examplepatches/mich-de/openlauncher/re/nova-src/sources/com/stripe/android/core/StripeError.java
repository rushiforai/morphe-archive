package com.stripe.android.core;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.model.StripeModel;
import java.io.Serializable;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import xq.b;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/core/StripeError;", "Lcom/stripe/android/core/model/StripeModel;", "Ljava/io/Serializable;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class StripeError implements StripeModel, Serializable {

    @NotNull
    public static final Parcelable.Creator<StripeError> CREATOR = new b(1);

    /* renamed from: a, reason: collision with root package name */
    public final String f42550a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42551b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42552c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42553d;

    /* renamed from: e, reason: collision with root package name */
    public final String f42554e;

    /* renamed from: f, reason: collision with root package name */
    public final String f42555f;

    /* renamed from: g, reason: collision with root package name */
    public final String f42556g;

    /* renamed from: h, reason: collision with root package name */
    public final Map f42557h;

    public StripeError(String str, String str2, String str3, String str4, String str5, String str6, String str7, Map map) {
        this.f42550a = str;
        this.f42551b = str2;
        this.f42552c = str3;
        this.f42553d = str4;
        this.f42554e = str5;
        this.f42555f = str6;
        this.f42556g = str7;
        this.f42557h = map;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof StripeError)) {
            return false;
        }
        StripeError stripeError = (StripeError) obj;
        return Intrinsics.b(this.f42550a, stripeError.f42550a) && Intrinsics.b(this.f42551b, stripeError.f42551b) && Intrinsics.b(this.f42552c, stripeError.f42552c) && Intrinsics.b(this.f42553d, stripeError.f42553d) && Intrinsics.b(this.f42554e, stripeError.f42554e) && Intrinsics.b(this.f42555f, stripeError.f42555f) && Intrinsics.b(this.f42556g, stripeError.f42556g) && Intrinsics.b(this.f42557h, stripeError.f42557h);
    }

    public final int hashCode() {
        String str = this.f42550a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f42551b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f42552c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f42553d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f42554e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f42555f;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f42556g;
        int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
        Map map = this.f42557h;
        return iHashCode7 + (map != null ? map.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("StripeError(type=", this.f42550a, ", message=", this.f42551b, ", code=");
        c0.D(sbW, this.f42552c, ", param=", this.f42553d, ", declineCode=");
        c0.D(sbW, this.f42554e, ", charge=", this.f42555f, ", docUrl=");
        sbW.append(this.f42556g);
        sbW.append(", extraFields=");
        sbW.append(this.f42557h);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42550a);
        dest.writeString(this.f42551b);
        dest.writeString(this.f42552c);
        dest.writeString(this.f42553d);
        dest.writeString(this.f42554e);
        dest.writeString(this.f42555f);
        dest.writeString(this.f42556g);
        Map map = this.f42557h;
        if (map == null) {
            dest.writeInt(0);
            return;
        }
        dest.writeInt(1);
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeString((String) entry.getKey());
            dest.writeString((String) entry.getValue());
        }
    }
}
