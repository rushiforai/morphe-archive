package com.stripe.android.stripe3ds2.transactions;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/ErrorData;", "Landroid/os/Parcelable;", "xv/b", "ps/e0", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ErrorData implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ErrorData> CREATOR = new ww.c(15);

    /* renamed from: a, reason: collision with root package name */
    public final String f45198a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45199b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45200c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45201d;

    /* renamed from: e, reason: collision with root package name */
    public final xv.b f45202e;

    /* renamed from: f, reason: collision with root package name */
    public final String f45203f;

    /* renamed from: g, reason: collision with root package name */
    public final String f45204g;

    /* renamed from: h, reason: collision with root package name */
    public final String f45205h;

    /* renamed from: i, reason: collision with root package name */
    public final String f45206i;

    /* renamed from: j, reason: collision with root package name */
    public final SdkTransactionId f45207j;

    public /* synthetic */ ErrorData(String str, String str2, String str3, String str4, String str5, String str6, String str7, SdkTransactionId sdkTransactionId, int i5) {
        this(str, str2, null, str3, xv.b.f96419c, str4, str5, (i5 & 128) != 0 ? null : str6, str7, sdkTransactionId);
    }

    public final JSONObject b() throws JSONException {
        JSONObject jSONObjectPut = new JSONObject().put("messageType", "Erro").put("messageVersion", this.f45206i).put("sdkTransID", this.f45207j).put("errorCode", this.f45201d).put("errorDescription", this.f45203f).put("errorDetail", this.f45204g);
        String str = this.f45198a;
        if (str != null) {
            jSONObjectPut.put("threeDSServerTransID", str);
        }
        String str2 = this.f45199b;
        if (str2 != null) {
            jSONObjectPut.put("acsTransID", str2);
        }
        String str3 = this.f45200c;
        if (str3 != null) {
            jSONObjectPut.put("dsTransID", str3);
        }
        xv.b bVar = this.f45202e;
        if (bVar != null) {
            jSONObjectPut.put("errorComponent", bVar.f96422a);
        }
        String str4 = this.f45205h;
        if (str4 != null) {
            jSONObjectPut.put("errorMessageType", str4);
        }
        Intrinsics.d(jSONObjectPut);
        return jSONObjectPut;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ErrorData)) {
            return false;
        }
        ErrorData errorData = (ErrorData) obj;
        return Intrinsics.b(this.f45198a, errorData.f45198a) && Intrinsics.b(this.f45199b, errorData.f45199b) && Intrinsics.b(this.f45200c, errorData.f45200c) && Intrinsics.b(this.f45201d, errorData.f45201d) && this.f45202e == errorData.f45202e && Intrinsics.b(this.f45203f, errorData.f45203f) && Intrinsics.b(this.f45204g, errorData.f45204g) && Intrinsics.b(this.f45205h, errorData.f45205h) && Intrinsics.b(this.f45206i, errorData.f45206i) && Intrinsics.b(this.f45207j, errorData.f45207j);
    }

    public final int hashCode() {
        String str = this.f45198a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f45199b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f45200c;
        int iE = c0.e((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.f45201d);
        xv.b bVar = this.f45202e;
        int iE2 = c0.e(c0.e((iE + (bVar == null ? 0 : bVar.hashCode())) * 31, 31, this.f45203f), 31, this.f45204g);
        String str4 = this.f45205h;
        int iE3 = c0.e((iE2 + (str4 == null ? 0 : str4.hashCode())) * 31, 31, this.f45206i);
        SdkTransactionId sdkTransactionId = this.f45207j;
        return iE3 + (sdkTransactionId != null ? sdkTransactionId.f45118a.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ErrorData(serverTransId=", this.f45198a, ", acsTransId=", this.f45199b, ", dsTransId=");
        c0.D(sbW, this.f45200c, ", errorCode=", this.f45201d, ", errorComponent=");
        sbW.append(this.f45202e);
        sbW.append(", errorDescription=");
        sbW.append(this.f45203f);
        sbW.append(", errorDetail=");
        c0.D(sbW, this.f45204g, ", errorMessageType=", this.f45205h, ", messageVersion=");
        sbW.append(this.f45206i);
        sbW.append(", sdkTransId=");
        sbW.append(this.f45207j);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45198a);
        dest.writeString(this.f45199b);
        dest.writeString(this.f45200c);
        dest.writeString(this.f45201d);
        xv.b bVar = this.f45202e;
        if (bVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(bVar.name());
        }
        dest.writeString(this.f45203f);
        dest.writeString(this.f45204g);
        dest.writeString(this.f45205h);
        dest.writeString(this.f45206i);
        SdkTransactionId sdkTransactionId = this.f45207j;
        if (sdkTransactionId == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sdkTransactionId.writeToParcel(dest, i5);
        }
    }

    public ErrorData(String str, String str2, String str3, String errorCode, xv.b bVar, String errorDescription, String errorDetail, String str4, String messageVersion, SdkTransactionId sdkTransactionId) {
        Intrinsics.g(errorCode, "errorCode");
        Intrinsics.g(errorDescription, "errorDescription");
        Intrinsics.g(errorDetail, "errorDetail");
        Intrinsics.g(messageVersion, "messageVersion");
        this.f45198a = str;
        this.f45199b = str2;
        this.f45200c = str3;
        this.f45201d = errorCode;
        this.f45202e = bVar;
        this.f45203f = errorDescription;
        this.f45204g = errorDetail;
        this.f45205h = str4;
        this.f45206i = messageVersion;
        this.f45207j = sdkTransactionId;
    }
}
