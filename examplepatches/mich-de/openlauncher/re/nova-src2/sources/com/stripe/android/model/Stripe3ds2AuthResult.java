package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/Stripe3ds2AuthResult;", "Lcom/stripe/android/core/model/StripeModel;", "Ares", "MessageExtension", "ThreeDS2Error", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Stripe3ds2AuthResult implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<Stripe3ds2AuthResult> CREATOR = new l5();

    /* renamed from: a, reason: collision with root package name */
    public final String f43888a;

    /* renamed from: b, reason: collision with root package name */
    public final Ares f43889b;

    /* renamed from: c, reason: collision with root package name */
    public final Long f43890c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43891d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43892e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f43893f;

    /* renamed from: g, reason: collision with root package name */
    public final ThreeDS2Error f43894g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43895h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43896i;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/Stripe3ds2AuthResult$Ares;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Ares implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Ares> CREATOR = new k5();

        /* renamed from: a, reason: collision with root package name */
        public final String f43897a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43898b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43899c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43900d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43901e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43902f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43903g;

        /* renamed from: h, reason: collision with root package name */
        public final List f43904h;

        /* renamed from: i, reason: collision with root package name */
        public final String f43905i;

        /* renamed from: j, reason: collision with root package name */
        public final String f43906j;

        /* renamed from: k, reason: collision with root package name */
        public final String f43907k;

        /* renamed from: l, reason: collision with root package name */
        public final String f43908l;

        public Ares(String str, String str2, String str3, String str4, String str5, String str6, String str7, ArrayList arrayList, String str8, String str9, String str10, String str11) {
            this.f43897a = str;
            this.f43898b = str2;
            this.f43899c = str3;
            this.f43900d = str4;
            this.f43901e = str5;
            this.f43902f = str6;
            this.f43903g = str7;
            this.f43904h = arrayList;
            this.f43905i = str8;
            this.f43906j = str9;
            this.f43907k = str10;
            this.f43908l = str11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Ares)) {
                return false;
            }
            Ares ares = (Ares) obj;
            return Intrinsics.b(this.f43897a, ares.f43897a) && Intrinsics.b(this.f43898b, ares.f43898b) && Intrinsics.b(this.f43899c, ares.f43899c) && Intrinsics.b(this.f43900d, ares.f43900d) && Intrinsics.b(this.f43901e, ares.f43901e) && Intrinsics.b(this.f43902f, ares.f43902f) && Intrinsics.b(this.f43903g, ares.f43903g) && Intrinsics.b(this.f43904h, ares.f43904h) && Intrinsics.b(this.f43905i, ares.f43905i) && Intrinsics.b(this.f43906j, ares.f43906j) && Intrinsics.b(this.f43907k, ares.f43907k) && Intrinsics.b(this.f43908l, ares.f43908l);
        }

        public final int hashCode() {
            String str = this.f43897a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43898b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43899c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43900d;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43901e;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.f43902f;
            int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
            String str7 = this.f43903g;
            int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
            List list = this.f43904h;
            int iHashCode8 = (iHashCode7 + (list == null ? 0 : list.hashCode())) * 31;
            String str8 = this.f43905i;
            int iHashCode9 = (iHashCode8 + (str8 == null ? 0 : str8.hashCode())) * 31;
            String str9 = this.f43906j;
            int iHashCode10 = (iHashCode9 + (str9 == null ? 0 : str9.hashCode())) * 31;
            String str10 = this.f43907k;
            int iHashCode11 = (iHashCode10 + (str10 == null ? 0 : str10.hashCode())) * 31;
            String str11 = this.f43908l;
            return iHashCode11 + (str11 != null ? str11.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Ares(threeDSServerTransId=", this.f43897a, ", acsChallengeMandated=", this.f43898b, ", acsSignedContent=");
            b.c0.D(sbW, this.f43899c, ", acsTransId=", this.f43900d, ", acsUrl=");
            b.c0.D(sbW, this.f43901e, ", authenticationType=", this.f43902f, ", cardholderInfo=");
            sbW.append(this.f43903g);
            sbW.append(", messageExtension=");
            sbW.append(this.f43904h);
            sbW.append(", messageType=");
            b.c0.D(sbW, this.f43905i, ", messageVersion=", this.f43906j, ", sdkTransId=");
            return b.c0.s(sbW, this.f43907k, ", transStatus=", this.f43908l, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43897a);
            dest.writeString(this.f43898b);
            dest.writeString(this.f43899c);
            dest.writeString(this.f43900d);
            dest.writeString(this.f43901e);
            dest.writeString(this.f43902f);
            dest.writeString(this.f43903g);
            List list = this.f43904h;
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
            dest.writeString(this.f43905i);
            dest.writeString(this.f43906j);
            dest.writeString(this.f43907k);
            dest.writeString(this.f43908l);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/Stripe3ds2AuthResult$MessageExtension;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class MessageExtension implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<MessageExtension> CREATOR = new m5();

        /* renamed from: a, reason: collision with root package name */
        public final String f43909a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f43910b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43911c;

        /* renamed from: d, reason: collision with root package name */
        public final Map f43912d;

        public MessageExtension(String str, String str2, Map map, boolean z11) {
            this.f43909a = str;
            this.f43910b = z11;
            this.f43911c = str2;
            this.f43912d = map;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof MessageExtension)) {
                return false;
            }
            MessageExtension messageExtension = (MessageExtension) obj;
            return Intrinsics.b(this.f43909a, messageExtension.f43909a) && this.f43910b == messageExtension.f43910b && Intrinsics.b(this.f43911c, messageExtension.f43911c) && Intrinsics.b(this.f43912d, messageExtension.f43912d);
        }

        public final int hashCode() {
            String str = this.f43909a;
            int iF = c9.f((str == null ? 0 : str.hashCode()) * 31, 31, this.f43910b);
            String str2 = this.f43911c;
            int iHashCode = (iF + (str2 == null ? 0 : str2.hashCode())) * 31;
            Map map = this.f43912d;
            return iHashCode + (map != null ? map.hashCode() : 0);
        }

        public final String toString() {
            return "MessageExtension(name=" + this.f43909a + ", criticalityIndicator=" + this.f43910b + ", id=" + this.f43911c + ", data=" + this.f43912d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43909a);
            dest.writeInt(this.f43910b ? 1 : 0);
            dest.writeString(this.f43911c);
            Map map = this.f43912d;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/Stripe3ds2AuthResult$ThreeDS2Error;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ThreeDS2Error implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<ThreeDS2Error> CREATOR = new n5();

        /* renamed from: a, reason: collision with root package name */
        public final String f43913a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43914b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43915c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43916d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43917e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43918f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43919g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43920h;

        /* renamed from: i, reason: collision with root package name */
        public final String f43921i;

        /* renamed from: j, reason: collision with root package name */
        public final String f43922j;

        /* renamed from: k, reason: collision with root package name */
        public final String f43923k;

        public ThreeDS2Error(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11) {
            this.f43913a = str;
            this.f43914b = str2;
            this.f43915c = str3;
            this.f43916d = str4;
            this.f43917e = str5;
            this.f43918f = str6;
            this.f43919g = str7;
            this.f43920h = str8;
            this.f43921i = str9;
            this.f43922j = str10;
            this.f43923k = str11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ThreeDS2Error)) {
                return false;
            }
            ThreeDS2Error threeDS2Error = (ThreeDS2Error) obj;
            return Intrinsics.b(this.f43913a, threeDS2Error.f43913a) && Intrinsics.b(this.f43914b, threeDS2Error.f43914b) && Intrinsics.b(this.f43915c, threeDS2Error.f43915c) && Intrinsics.b(this.f43916d, threeDS2Error.f43916d) && Intrinsics.b(this.f43917e, threeDS2Error.f43917e) && Intrinsics.b(this.f43918f, threeDS2Error.f43918f) && Intrinsics.b(this.f43919g, threeDS2Error.f43919g) && Intrinsics.b(this.f43920h, threeDS2Error.f43920h) && Intrinsics.b(this.f43921i, threeDS2Error.f43921i) && Intrinsics.b(this.f43922j, threeDS2Error.f43922j) && Intrinsics.b(this.f43923k, threeDS2Error.f43923k);
        }

        public final int hashCode() {
            String str = this.f43913a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43914b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43915c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43916d;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43917e;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.f43918f;
            int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
            String str7 = this.f43919g;
            int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
            String str8 = this.f43920h;
            int iHashCode8 = (iHashCode7 + (str8 == null ? 0 : str8.hashCode())) * 31;
            String str9 = this.f43921i;
            int iHashCode9 = (iHashCode8 + (str9 == null ? 0 : str9.hashCode())) * 31;
            String str10 = this.f43922j;
            int iHashCode10 = (iHashCode9 + (str10 == null ? 0 : str10.hashCode())) * 31;
            String str11 = this.f43923k;
            return iHashCode10 + (str11 != null ? str11.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("ThreeDS2Error(threeDSServerTransId=", this.f43913a, ", acsTransId=", this.f43914b, ", dsTransId=");
            b.c0.D(sbW, this.f43915c, ", errorCode=", this.f43916d, ", errorComponent=");
            b.c0.D(sbW, this.f43917e, ", errorDescription=", this.f43918f, ", errorDetail=");
            b.c0.D(sbW, this.f43919g, ", errorMessageType=", this.f43920h, ", messageType=");
            b.c0.D(sbW, this.f43921i, ", messageVersion=", this.f43922j, ", sdkTransId=");
            return b.c0.q(sbW, this.f43923k, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43913a);
            dest.writeString(this.f43914b);
            dest.writeString(this.f43915c);
            dest.writeString(this.f43916d);
            dest.writeString(this.f43917e);
            dest.writeString(this.f43918f);
            dest.writeString(this.f43919g);
            dest.writeString(this.f43920h);
            dest.writeString(this.f43921i);
            dest.writeString(this.f43922j);
            dest.writeString(this.f43923k);
        }
    }

    public Stripe3ds2AuthResult(String str, Ares ares, Long l9, String str2, String str3, boolean z11, ThreeDS2Error threeDS2Error, String str4, String str5) {
        this.f43888a = str;
        this.f43889b = ares;
        this.f43890c = l9;
        this.f43891d = str2;
        this.f43892e = str3;
        this.f43893f = z11;
        this.f43894g = threeDS2Error;
        this.f43895h = str4;
        this.f43896i = str5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Stripe3ds2AuthResult)) {
            return false;
        }
        Stripe3ds2AuthResult stripe3ds2AuthResult = (Stripe3ds2AuthResult) obj;
        return Intrinsics.b(this.f43888a, stripe3ds2AuthResult.f43888a) && Intrinsics.b(this.f43889b, stripe3ds2AuthResult.f43889b) && Intrinsics.b(this.f43890c, stripe3ds2AuthResult.f43890c) && Intrinsics.b(this.f43891d, stripe3ds2AuthResult.f43891d) && Intrinsics.b(this.f43892e, stripe3ds2AuthResult.f43892e) && this.f43893f == stripe3ds2AuthResult.f43893f && Intrinsics.b(this.f43894g, stripe3ds2AuthResult.f43894g) && Intrinsics.b(this.f43895h, stripe3ds2AuthResult.f43895h) && Intrinsics.b(this.f43896i, stripe3ds2AuthResult.f43896i);
    }

    public final int hashCode() {
        String str = this.f43888a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Ares ares = this.f43889b;
        int iHashCode2 = (iHashCode + (ares == null ? 0 : ares.hashCode())) * 31;
        Long l9 = this.f43890c;
        int iHashCode3 = (iHashCode2 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str2 = this.f43891d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f43892e;
        int iF = c9.f((iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.f43893f);
        ThreeDS2Error threeDS2Error = this.f43894g;
        int iHashCode5 = (iF + (threeDS2Error == null ? 0 : threeDS2Error.hashCode())) * 31;
        String str4 = this.f43895h;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43896i;
        return iHashCode6 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Stripe3ds2AuthResult(id=");
        sb2.append(this.f43888a);
        sb2.append(", ares=");
        sb2.append(this.f43889b);
        sb2.append(", created=");
        sb2.append(this.f43890c);
        sb2.append(", source=");
        sb2.append(this.f43891d);
        sb2.append(", state=");
        a80.m.q(this.f43892e, ", liveMode=", ", error=", sb2, this.f43893f);
        sb2.append(this.f43894g);
        sb2.append(", fallbackRedirectUrl=");
        sb2.append(this.f43895h);
        sb2.append(", creq=");
        return b.c0.q(sb2, this.f43896i, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43888a);
        Ares ares = this.f43889b;
        if (ares == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            ares.writeToParcel(dest, i5);
        }
        Long l9 = this.f43890c;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeString(this.f43891d);
        dest.writeString(this.f43892e);
        dest.writeInt(this.f43893f ? 1 : 0);
        ThreeDS2Error threeDS2Error = this.f43894g;
        if (threeDS2Error == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            threeDS2Error.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43895h);
        dest.writeString(this.f43896i);
    }
}
