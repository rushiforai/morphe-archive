package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/WeChat;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class WeChat implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<WeChat> CREATOR = new ft.q(17);

    /* renamed from: a, reason: collision with root package name */
    public final String f44003a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44004b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44005c;

    /* renamed from: d, reason: collision with root package name */
    public final String f44006d;

    /* renamed from: e, reason: collision with root package name */
    public final String f44007e;

    /* renamed from: f, reason: collision with root package name */
    public final String f44008f;

    /* renamed from: g, reason: collision with root package name */
    public final String f44009g;

    /* renamed from: h, reason: collision with root package name */
    public final String f44010h;

    /* renamed from: i, reason: collision with root package name */
    public final String f44011i;

    public WeChat(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9) {
        this.f44003a = str;
        this.f44004b = str2;
        this.f44005c = str3;
        this.f44006d = str4;
        this.f44007e = str5;
        this.f44008f = str6;
        this.f44009g = str7;
        this.f44010h = str8;
        this.f44011i = str9;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof WeChat)) {
            return false;
        }
        WeChat weChat = (WeChat) obj;
        return Intrinsics.b(this.f44003a, weChat.f44003a) && Intrinsics.b(this.f44004b, weChat.f44004b) && Intrinsics.b(this.f44005c, weChat.f44005c) && Intrinsics.b(this.f44006d, weChat.f44006d) && Intrinsics.b(this.f44007e, weChat.f44007e) && Intrinsics.b(this.f44008f, weChat.f44008f) && Intrinsics.b(this.f44009g, weChat.f44009g) && Intrinsics.b(this.f44010h, weChat.f44010h) && Intrinsics.b(this.f44011i, weChat.f44011i);
    }

    public final int hashCode() {
        String str = this.f44003a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f44004b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f44005c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f44006d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f44007e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f44008f;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f44009g;
        int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.f44010h;
        int iHashCode8 = (iHashCode7 + (str8 == null ? 0 : str8.hashCode())) * 31;
        String str9 = this.f44011i;
        return iHashCode8 + (str9 != null ? str9.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("WeChat(statementDescriptor=", this.f44003a, ", appId=", this.f44004b, ", nonce=");
        b.c0.D(sbW, this.f44005c, ", packageValue=", this.f44006d, ", partnerId=");
        b.c0.D(sbW, this.f44007e, ", prepayId=", this.f44008f, ", sign=");
        b.c0.D(sbW, this.f44009g, ", timestamp=", this.f44010h, ", qrCodeUrl=");
        return b.c0.q(sbW, this.f44011i, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44003a);
        dest.writeString(this.f44004b);
        dest.writeString(this.f44005c);
        dest.writeString(this.f44006d);
        dest.writeString(this.f44007e);
        dest.writeString(this.f44008f);
        dest.writeString(this.f44009g);
        dest.writeString(this.f44010h);
        dest.writeString(this.f44011i);
    }
}
