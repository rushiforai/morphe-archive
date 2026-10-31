package com.stripe.android.stripe3ds2.transactions;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/ChallengeResponseData;", "Landroid/os/Parcelable;", "Image", "ChallengeSelectOption", "com/stripe/android/stripe3ds2/transactions/b", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class ChallengeResponseData implements Parcelable {
    public final String A;
    public final String B;

    /* renamed from: a, reason: collision with root package name */
    public final String f45165a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45166b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45167c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45168d;

    /* renamed from: e, reason: collision with root package name */
    public final xv.d f45169e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f45170f;

    /* renamed from: g, reason: collision with root package name */
    public final String f45171g;

    /* renamed from: h, reason: collision with root package name */
    public final String f45172h;

    /* renamed from: i, reason: collision with root package name */
    public final String f45173i;

    /* renamed from: j, reason: collision with root package name */
    public final String f45174j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f45175k;

    /* renamed from: l, reason: collision with root package name */
    public final List f45176l;

    /* renamed from: m, reason: collision with root package name */
    public final String f45177m;
    public final String n;
    public final Image o;

    /* renamed from: p, reason: collision with root package name */
    public final List f45178p;

    /* renamed from: q, reason: collision with root package name */
    public final String f45179q;

    /* renamed from: r, reason: collision with root package name */
    public final String f45180r;

    /* renamed from: s, reason: collision with root package name */
    public final String f45181s;

    /* renamed from: t, reason: collision with root package name */
    public final String f45182t;

    /* renamed from: u, reason: collision with root package name */
    public final Image f45183u;

    /* renamed from: v, reason: collision with root package name */
    public final String f45184v;

    /* renamed from: w, reason: collision with root package name */
    public final SdkTransactionId f45185w;

    /* renamed from: x, reason: collision with root package name */
    public final String f45186x;

    /* renamed from: y, reason: collision with root package name */
    public final String f45187y;

    /* renamed from: z, reason: collision with root package name */
    public final String f45188z;

    @NotNull
    public static final Parcelable.Creator<ChallengeResponseData> CREATOR = new c();
    public static final List C = ul.b.Q("Y", "N");

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/ChallengeResponseData$ChallengeSelectOption;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ChallengeSelectOption implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<ChallengeSelectOption> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f45189a;

        /* renamed from: b, reason: collision with root package name */
        public final String f45190b;

        public ChallengeSelectOption(String name, String text) {
            Intrinsics.g(name, "name");
            Intrinsics.g(text, "text");
            this.f45189a = name;
            this.f45190b = text;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ChallengeSelectOption)) {
                return false;
            }
            ChallengeSelectOption challengeSelectOption = (ChallengeSelectOption) obj;
            return Intrinsics.b(this.f45189a, challengeSelectOption.f45189a) && Intrinsics.b(this.f45190b, challengeSelectOption.f45190b);
        }

        public final int hashCode() {
            return this.f45190b.hashCode() + (this.f45189a.hashCode() * 31);
        }

        public final String toString() {
            return c0.n("ChallengeSelectOption(name=", this.f45189a, ", text=", this.f45190b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45189a);
            dest.writeString(this.f45190b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/ChallengeResponseData$Image;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class Image implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Image> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final String f45191a;

        /* renamed from: b, reason: collision with root package name */
        public final String f45192b;

        /* renamed from: c, reason: collision with root package name */
        public final String f45193c;

        public Image(String str, String str2, String str3) {
            this.f45191a = str;
            this.f45192b = str2;
            this.f45193c = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Image)) {
                return false;
            }
            Image image = (Image) obj;
            return Intrinsics.b(this.f45191a, image.f45191a) && Intrinsics.b(this.f45192b, image.f45192b) && Intrinsics.b(this.f45193c, image.f45193c);
        }

        public final int hashCode() {
            String str = this.f45191a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f45192b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f45193c;
            return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
        }

        public final String toString() {
            return c0.q(c0.w("Image(mediumUrl=", this.f45191a, ", highUrl=", this.f45192b, ", extraHighUrl="), this.f45193c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45191a);
            dest.writeString(this.f45192b);
            dest.writeString(this.f45193c);
        }
    }

    public ChallengeResponseData(String serverTransId, String acsTransId, String str, String str2, xv.d dVar, boolean z11, String str3, String str4, String str5, String str6, boolean z12, ArrayList arrayList, String str7, String str8, Image image, ArrayList arrayList2, String messageVersion, String str9, String str10, String str11, Image image2, String str12, SdkTransactionId sdkTransId, String str13, String str14, String str15, String str16, String str17) {
        Intrinsics.g(serverTransId, "serverTransId");
        Intrinsics.g(acsTransId, "acsTransId");
        Intrinsics.g(messageVersion, "messageVersion");
        Intrinsics.g(sdkTransId, "sdkTransId");
        this.f45165a = serverTransId;
        this.f45166b = acsTransId;
        this.f45167c = str;
        this.f45168d = str2;
        this.f45169e = dVar;
        this.f45170f = z11;
        this.f45171g = str3;
        this.f45172h = str4;
        this.f45173i = str5;
        this.f45174j = str6;
        this.f45175k = z12;
        this.f45176l = arrayList;
        this.f45177m = str7;
        this.n = str8;
        this.o = image;
        this.f45178p = arrayList2;
        this.f45179q = messageVersion;
        this.f45180r = str9;
        this.f45181s = str10;
        this.f45182t = str11;
        this.f45183u = image2;
        this.f45184v = str12;
        this.f45185w = sdkTransId;
        this.f45186x = str13;
        this.f45187y = str14;
        this.f45188z = str15;
        this.A = str16;
        this.B = str17;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ChallengeResponseData)) {
            return false;
        }
        ChallengeResponseData challengeResponseData = (ChallengeResponseData) obj;
        return Intrinsics.b(this.f45165a, challengeResponseData.f45165a) && Intrinsics.b(this.f45166b, challengeResponseData.f45166b) && Intrinsics.b(this.f45167c, challengeResponseData.f45167c) && Intrinsics.b(this.f45168d, challengeResponseData.f45168d) && this.f45169e == challengeResponseData.f45169e && this.f45170f == challengeResponseData.f45170f && Intrinsics.b(this.f45171g, challengeResponseData.f45171g) && Intrinsics.b(this.f45172h, challengeResponseData.f45172h) && Intrinsics.b(this.f45173i, challengeResponseData.f45173i) && Intrinsics.b(this.f45174j, challengeResponseData.f45174j) && this.f45175k == challengeResponseData.f45175k && Intrinsics.b(this.f45176l, challengeResponseData.f45176l) && Intrinsics.b(this.f45177m, challengeResponseData.f45177m) && Intrinsics.b(this.n, challengeResponseData.n) && Intrinsics.b(this.o, challengeResponseData.o) && Intrinsics.b(this.f45178p, challengeResponseData.f45178p) && Intrinsics.b(this.f45179q, challengeResponseData.f45179q) && Intrinsics.b(this.f45180r, challengeResponseData.f45180r) && Intrinsics.b(this.f45181s, challengeResponseData.f45181s) && Intrinsics.b(this.f45182t, challengeResponseData.f45182t) && Intrinsics.b(this.f45183u, challengeResponseData.f45183u) && Intrinsics.b(this.f45184v, challengeResponseData.f45184v) && Intrinsics.b(this.f45185w, challengeResponseData.f45185w) && Intrinsics.b(this.f45186x, challengeResponseData.f45186x) && Intrinsics.b(this.f45187y, challengeResponseData.f45187y) && Intrinsics.b(this.f45188z, challengeResponseData.f45188z) && Intrinsics.b(this.A, challengeResponseData.A) && Intrinsics.b(this.B, challengeResponseData.B);
    }

    public final int hashCode() {
        int iE = c0.e(this.f45165a.hashCode() * 31, 31, this.f45166b);
        String str = this.f45167c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f45168d;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        xv.d dVar = this.f45169e;
        int iF = c9.f((iHashCode2 + (dVar == null ? 0 : dVar.hashCode())) * 31, 31, this.f45170f);
        String str3 = this.f45171g;
        int iHashCode3 = (iF + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f45172h;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f45173i;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f45174j;
        int iF2 = c9.f((iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31, 31, this.f45175k);
        List list = this.f45176l;
        int iHashCode6 = (iF2 + (list == null ? 0 : list.hashCode())) * 31;
        String str7 = this.f45177m;
        int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.n;
        int iHashCode8 = (iHashCode7 + (str8 == null ? 0 : str8.hashCode())) * 31;
        Image image = this.o;
        int iHashCode9 = (iHashCode8 + (image == null ? 0 : image.hashCode())) * 31;
        List list2 = this.f45178p;
        int iE2 = c0.e((iHashCode9 + (list2 == null ? 0 : list2.hashCode())) * 31, 31, this.f45179q);
        String str9 = this.f45180r;
        int iHashCode10 = (iE2 + (str9 == null ? 0 : str9.hashCode())) * 31;
        String str10 = this.f45181s;
        int iHashCode11 = (iHashCode10 + (str10 == null ? 0 : str10.hashCode())) * 31;
        String str11 = this.f45182t;
        int iHashCode12 = (iHashCode11 + (str11 == null ? 0 : str11.hashCode())) * 31;
        Image image2 = this.f45183u;
        int iHashCode13 = (iHashCode12 + (image2 == null ? 0 : image2.hashCode())) * 31;
        String str12 = this.f45184v;
        int iE3 = c0.e((iHashCode13 + (str12 == null ? 0 : str12.hashCode())) * 31, 31, this.f45185w.f45118a);
        String str13 = this.f45186x;
        int iHashCode14 = (iE3 + (str13 == null ? 0 : str13.hashCode())) * 31;
        String str14 = this.f45187y;
        int iHashCode15 = (iHashCode14 + (str14 == null ? 0 : str14.hashCode())) * 31;
        String str15 = this.f45188z;
        int iHashCode16 = (iHashCode15 + (str15 == null ? 0 : str15.hashCode())) * 31;
        String str16 = this.A;
        int iHashCode17 = (iHashCode16 + (str16 == null ? 0 : str16.hashCode())) * 31;
        String str17 = this.B;
        return iHashCode17 + (str17 != null ? str17.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ChallengeResponseData(serverTransId=", this.f45165a, ", acsTransId=", this.f45166b, ", acsHtml=");
        c0.D(sbW, this.f45167c, ", acsHtmlRefresh=", this.f45168d, ", uiType=");
        sbW.append(this.f45169e);
        sbW.append(", isChallengeCompleted=");
        sbW.append(this.f45170f);
        sbW.append(", challengeInfoHeader=");
        c0.D(sbW, this.f45171g, ", challengeInfoLabel=", this.f45172h, ", challengeInfoText=");
        c0.D(sbW, this.f45173i, ", challengeAdditionalInfoText=", this.f45174j, ", shouldShowChallengeInfoTextIndicator=");
        sbW.append(this.f45175k);
        sbW.append(", challengeSelectOptions=");
        sbW.append(this.f45176l);
        sbW.append(", expandInfoLabel=");
        c0.D(sbW, this.f45177m, ", expandInfoText=", this.n, ", issuerImage=");
        sbW.append(this.o);
        sbW.append(", messageExtensions=");
        sbW.append(this.f45178p);
        sbW.append(", messageVersion=");
        c0.D(sbW, this.f45179q, ", oobAppUrl=", this.f45180r, ", oobAppLabel=");
        c0.D(sbW, this.f45181s, ", oobContinueLabel=", this.f45182t, ", paymentSystemImage=");
        sbW.append(this.f45183u);
        sbW.append(", resendInformationLabel=");
        sbW.append(this.f45184v);
        sbW.append(", sdkTransId=");
        sbW.append(this.f45185w);
        sbW.append(", submitAuthenticationLabel=");
        sbW.append(this.f45186x);
        sbW.append(", whitelistingInfoText=");
        c0.D(sbW, this.f45187y, ", whyInfoLabel=", this.f45188z, ", whyInfoText=");
        return c0.s(sbW, this.A, ", transStatus=", this.B, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45165a);
        dest.writeString(this.f45166b);
        dest.writeString(this.f45167c);
        dest.writeString(this.f45168d);
        xv.d dVar = this.f45169e;
        if (dVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(dVar.name());
        }
        dest.writeInt(this.f45170f ? 1 : 0);
        dest.writeString(this.f45171g);
        dest.writeString(this.f45172h);
        dest.writeString(this.f45173i);
        dest.writeString(this.f45174j);
        dest.writeInt(this.f45175k ? 1 : 0);
        List list = this.f45176l;
        if (list == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeInt(list.size());
            Iterator it = list.iterator();
            while (it.hasNext()) {
                ((ChallengeSelectOption) it.next()).writeToParcel(dest, i5);
            }
        }
        dest.writeString(this.f45177m);
        dest.writeString(this.n);
        Image image = this.o;
        if (image == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            image.writeToParcel(dest, i5);
        }
        List list2 = this.f45178p;
        if (list2 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeInt(list2.size());
            Iterator it2 = list2.iterator();
            while (it2.hasNext()) {
                ((MessageExtension) it2.next()).writeToParcel(dest, i5);
            }
        }
        dest.writeString(this.f45179q);
        dest.writeString(this.f45180r);
        dest.writeString(this.f45181s);
        dest.writeString(this.f45182t);
        Image image2 = this.f45183u;
        if (image2 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            image2.writeToParcel(dest, i5);
        }
        dest.writeString(this.f45184v);
        this.f45185w.writeToParcel(dest, i5);
        dest.writeString(this.f45186x);
        dest.writeString(this.f45187y);
        dest.writeString(this.f45188z);
        dest.writeString(this.A);
        dest.writeString(this.B);
    }
}
