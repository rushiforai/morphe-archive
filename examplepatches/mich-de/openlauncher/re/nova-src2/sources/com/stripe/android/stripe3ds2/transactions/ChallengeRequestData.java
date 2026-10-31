package com.stripe.android.stripe3ds2.transactions;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.stripe3ds2.exceptions.SDKRuntimeException;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONObject;
import ps.f0;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/ChallengeRequestData;", "Ljava/io/Serializable;", "Landroid/os/Parcelable;", "xv/a", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ChallengeRequestData implements Serializable, Parcelable {

    @NotNull
    public static final Parcelable.Creator<ChallengeRequestData> CREATOR = new ww.c(14);

    /* renamed from: a, reason: collision with root package name */
    public final String f45153a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45154b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45155c;

    /* renamed from: d, reason: collision with root package name */
    public final SdkTransactionId f45156d;

    /* renamed from: e, reason: collision with root package name */
    public final String f45157e;

    /* renamed from: f, reason: collision with root package name */
    public final String f45158f;

    /* renamed from: g, reason: collision with root package name */
    public final xv.a f45159g;

    /* renamed from: h, reason: collision with root package name */
    public final String f45160h;

    /* renamed from: i, reason: collision with root package name */
    public final List f45161i;

    /* renamed from: j, reason: collision with root package name */
    public final Boolean f45162j;

    /* renamed from: k, reason: collision with root package name */
    public final Boolean f45163k;

    /* renamed from: l, reason: collision with root package name */
    public final Boolean f45164l;

    public ChallengeRequestData(String messageVersion, String threeDsServerTransId, String acsTransId, SdkTransactionId sdkTransId, String str, String str2, xv.a aVar, String str3, List list, Boolean bool, Boolean bool2, Boolean bool3) {
        Intrinsics.g(messageVersion, "messageVersion");
        Intrinsics.g(threeDsServerTransId, "threeDsServerTransId");
        Intrinsics.g(acsTransId, "acsTransId");
        Intrinsics.g(sdkTransId, "sdkTransId");
        this.f45153a = messageVersion;
        this.f45154b = threeDsServerTransId;
        this.f45155c = acsTransId;
        this.f45156d = sdkTransId;
        this.f45157e = str;
        this.f45158f = str2;
        this.f45159g = aVar;
        this.f45160h = str3;
        this.f45161i = list;
        this.f45162j = bool;
        this.f45163k = bool2;
        this.f45164l = bool3;
    }

    public static ChallengeRequestData a(ChallengeRequestData challengeRequestData, String str, String str2, Boolean bool, int i5) {
        xv.a aVar = xv.a.f96415b;
        Boolean bool2 = Boolean.TRUE;
        String messageVersion = challengeRequestData.f45153a;
        String threeDsServerTransId = challengeRequestData.f45154b;
        String acsTransId = challengeRequestData.f45155c;
        SdkTransactionId sdkTransId = challengeRequestData.f45156d;
        String str3 = challengeRequestData.f45157e;
        String str4 = (i5 & 32) != 0 ? challengeRequestData.f45158f : str;
        if ((i5 & 64) != 0) {
            aVar = challengeRequestData.f45159g;
        }
        xv.a aVar2 = aVar;
        String str5 = (i5 & 128) != 0 ? challengeRequestData.f45160h : str2;
        List list = challengeRequestData.f45161i;
        Boolean bool3 = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? challengeRequestData.f45162j : bool2;
        if ((i5 & 1024) != 0) {
            bool2 = challengeRequestData.f45163k;
        }
        Boolean bool4 = bool2;
        Boolean bool5 = (i5 & 2048) != 0 ? challengeRequestData.f45164l : bool;
        Intrinsics.g(messageVersion, "messageVersion");
        Intrinsics.g(threeDsServerTransId, "threeDsServerTransId");
        Intrinsics.g(acsTransId, "acsTransId");
        Intrinsics.g(sdkTransId, "sdkTransId");
        return new ChallengeRequestData(messageVersion, threeDsServerTransId, acsTransId, sdkTransId, str3, str4, aVar2, str5, list, bool3, bool4, bool5);
    }

    public final JSONObject b() {
        try {
            int i5 = Result.f71687b;
            JSONObject jSONObjectPut = new JSONObject().put("messageType", "CReq").put("messageVersion", this.f45153a).put("sdkTransID", this.f45156d.f45118a).put("threeDSServerTransID", this.f45154b).put("acsTransID", this.f45155c);
            xv.a aVar = this.f45159g;
            if (aVar != null) {
                jSONObjectPut.put("challengeCancel", aVar.f96417a);
            }
            String str = this.f45157e;
            if (str != null && str.length() != 0) {
                jSONObjectPut.put("threeDSRequestorAppURL", str);
            }
            String str2 = this.f45158f;
            if (str2 != null && str2.length() != 0) {
                jSONObjectPut.put("challengeDataEntry", str2);
            }
            String str3 = this.f45160h;
            if (str3 != null && str3.length() != 0) {
                jSONObjectPut.put("challengeHTMLDataEntry", str3);
            }
            String str4 = "Y";
            if ((str2 == null || str2.length() == 0) && ((str3 == null || str3.length() == 0) && aVar == null)) {
                jSONObjectPut.put("challengeNoEntry", "Y");
            }
            Parcelable.Creator<MessageExtension> creator = MessageExtension.CREATOR;
            JSONArray jSONArrayW = f0.w(this.f45161i);
            if (jSONArrayW != null) {
                jSONObjectPut.put("messageExtensions", jSONArrayW);
            }
            Boolean bool = this.f45162j;
            if (bool != null) {
                jSONObjectPut.put("oobContinue", bool.booleanValue());
            }
            Boolean bool2 = this.f45163k;
            if (bool2 != null) {
                jSONObjectPut.put("resendChallenge", bool2.booleanValue() ? "Y" : "N");
            }
            Boolean bool3 = this.f45164l;
            if (bool3 != null) {
                if (!bool3.booleanValue()) {
                    str4 = "N";
                }
                jSONObjectPut.put("whitelistingDataEntry", str4);
            }
            Intrinsics.d(jSONObjectPut);
            return jSONObjectPut;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            Throwable thA = Result.a(ResultKt.a(th2));
            if (thA == null) {
                throw new KotlinNothingValueException();
            }
            throw new SDKRuntimeException(thA);
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ChallengeRequestData)) {
            return false;
        }
        ChallengeRequestData challengeRequestData = (ChallengeRequestData) obj;
        return Intrinsics.b(this.f45153a, challengeRequestData.f45153a) && Intrinsics.b(this.f45154b, challengeRequestData.f45154b) && Intrinsics.b(this.f45155c, challengeRequestData.f45155c) && Intrinsics.b(this.f45156d, challengeRequestData.f45156d) && Intrinsics.b(this.f45157e, challengeRequestData.f45157e) && Intrinsics.b(this.f45158f, challengeRequestData.f45158f) && this.f45159g == challengeRequestData.f45159g && Intrinsics.b(this.f45160h, challengeRequestData.f45160h) && Intrinsics.b(this.f45161i, challengeRequestData.f45161i) && Intrinsics.b(this.f45162j, challengeRequestData.f45162j) && Intrinsics.b(this.f45163k, challengeRequestData.f45163k) && Intrinsics.b(this.f45164l, challengeRequestData.f45164l);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(c0.e(this.f45153a.hashCode() * 31, 31, this.f45154b), 31, this.f45155c), 31, this.f45156d.f45118a);
        String str = this.f45157e;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f45158f;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        xv.a aVar = this.f45159g;
        int iHashCode3 = (iHashCode2 + (aVar == null ? 0 : aVar.hashCode())) * 31;
        String str3 = this.f45160h;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        List list = this.f45161i;
        int iHashCode5 = (iHashCode4 + (list == null ? 0 : list.hashCode())) * 31;
        Boolean bool = this.f45162j;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.f45163k;
        int iHashCode7 = (iHashCode6 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Boolean bool3 = this.f45164l;
        return iHashCode7 + (bool3 != null ? bool3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ChallengeRequestData(messageVersion=", this.f45153a, ", threeDsServerTransId=", this.f45154b, ", acsTransId=");
        sbW.append(this.f45155c);
        sbW.append(", sdkTransId=");
        sbW.append(this.f45156d);
        sbW.append(", threeDSRequestorAppURL=");
        c0.D(sbW, this.f45157e, ", challengeDataEntry=", this.f45158f, ", cancelReason=");
        sbW.append(this.f45159g);
        sbW.append(", challengeHtmlDataEntry=");
        sbW.append(this.f45160h);
        sbW.append(", messageExtensions=");
        sbW.append(this.f45161i);
        sbW.append(", oobContinue=");
        sbW.append(this.f45162j);
        sbW.append(", shouldResendChallenge=");
        sbW.append(this.f45163k);
        sbW.append(", whitelistingDataEntry=");
        sbW.append(this.f45164l);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45153a);
        dest.writeString(this.f45154b);
        dest.writeString(this.f45155c);
        this.f45156d.writeToParcel(dest, i5);
        dest.writeString(this.f45157e);
        dest.writeString(this.f45158f);
        xv.a aVar = this.f45159g;
        if (aVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(aVar.name());
        }
        dest.writeString(this.f45160h);
        List list = this.f45161i;
        if (list == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeInt(list.size());
            Iterator it = list.iterator();
            while (it.hasNext()) {
                ((MessageExtension) it.next()).writeToParcel(dest, i5);
            }
        }
        Boolean bool = this.f45162j;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            k2.w(dest, 1, bool);
        }
        Boolean bool2 = this.f45163k;
        if (bool2 == null) {
            dest.writeInt(0);
        } else {
            k2.w(dest, 1, bool2);
        }
        Boolean bool3 = this.f45164l;
        if (bool3 == null) {
            dest.writeInt(0);
        } else {
            k2.w(dest, 1, bool3);
        }
    }

    public /* synthetic */ ChallengeRequestData(String str, String str2, String str3, SdkTransactionId sdkTransactionId, String str4, List list, int i5) {
        this(str, str2, str3, sdkTransactionId, str4, null, null, null, (i5 & 256) != 0 ? null : list, null, null, null);
    }
}
