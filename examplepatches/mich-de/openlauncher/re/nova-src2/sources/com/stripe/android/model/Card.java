package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/Card;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "wh/f", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class Card implements StripeModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<Card> CREATOR = new eh.a(16);

    /* renamed from: a, reason: collision with root package name */
    public final Integer f43155a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f43156b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43157c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43158d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43159e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43160f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43161g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43162h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43163i;

    /* renamed from: j, reason: collision with root package name */
    public final String f43164j;

    /* renamed from: k, reason: collision with root package name */
    public final String f43165k;

    /* renamed from: l, reason: collision with root package name */
    public final String f43166l;

    /* renamed from: m, reason: collision with root package name */
    public final ft.b f43167m;
    public final ft.c n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f43168p;

    /* renamed from: q, reason: collision with root package name */
    public final String f43169q;

    /* renamed from: r, reason: collision with root package name */
    public final String f43170r;

    /* renamed from: s, reason: collision with root package name */
    public final String f43171s;

    /* renamed from: t, reason: collision with root package name */
    public final String f43172t;

    /* renamed from: u, reason: collision with root package name */
    public final ft.u0 f43173u;

    public Card(Integer num, Integer num2, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, ft.b brand, ft.c cVar, String str11, String str12, String str13, String str14, String str15, String str16, ft.u0 u0Var) {
        Intrinsics.g(brand, "brand");
        this.f43155a = num;
        this.f43156b = num2;
        this.f43157c = str;
        this.f43158d = str2;
        this.f43159e = str3;
        this.f43160f = str4;
        this.f43161g = str5;
        this.f43162h = str6;
        this.f43163i = str7;
        this.f43164j = str8;
        this.f43165k = str9;
        this.f43166l = str10;
        this.f43167m = brand;
        this.n = cVar;
        this.o = str11;
        this.f43168p = str12;
        this.f43169q = str13;
        this.f43170r = str14;
        this.f43171s = str15;
        this.f43172t = str16;
        this.f43173u = u0Var;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Card)) {
            return false;
        }
        Card card = (Card) obj;
        return Intrinsics.b(this.f43155a, card.f43155a) && Intrinsics.b(this.f43156b, card.f43156b) && Intrinsics.b(this.f43157c, card.f43157c) && Intrinsics.b(this.f43158d, card.f43158d) && Intrinsics.b(this.f43159e, card.f43159e) && Intrinsics.b(this.f43160f, card.f43160f) && Intrinsics.b(this.f43161g, card.f43161g) && Intrinsics.b(this.f43162h, card.f43162h) && Intrinsics.b(this.f43163i, card.f43163i) && Intrinsics.b(this.f43164j, card.f43164j) && Intrinsics.b(this.f43165k, card.f43165k) && Intrinsics.b(this.f43166l, card.f43166l) && this.f43167m == card.f43167m && this.n == card.n && Intrinsics.b(this.o, card.o) && Intrinsics.b(this.f43168p, card.f43168p) && Intrinsics.b(this.f43169q, card.f43169q) && Intrinsics.b(this.f43170r, card.f43170r) && Intrinsics.b(this.f43171s, card.f43171s) && Intrinsics.b(this.f43172t, card.f43172t) && this.f43173u == card.f43173u;
    }

    public final int hashCode() {
        Integer num = this.f43155a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f43156b;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        String str = this.f43157c;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43158d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f43159e;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43160f;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43161g;
        int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f43162h;
        int iHashCode8 = (iHashCode7 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f43163i;
        int iHashCode9 = (iHashCode8 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.f43164j;
        int iHashCode10 = (iHashCode9 + (str8 == null ? 0 : str8.hashCode())) * 31;
        String str9 = this.f43165k;
        int iHashCode11 = (iHashCode10 + (str9 == null ? 0 : str9.hashCode())) * 31;
        String str10 = this.f43166l;
        int iHashCode12 = (this.f43167m.hashCode() + ((iHashCode11 + (str10 == null ? 0 : str10.hashCode())) * 31)) * 31;
        ft.c cVar = this.n;
        int iHashCode13 = (iHashCode12 + (cVar == null ? 0 : cVar.hashCode())) * 31;
        String str11 = this.o;
        int iHashCode14 = (iHashCode13 + (str11 == null ? 0 : str11.hashCode())) * 31;
        String str12 = this.f43168p;
        int iHashCode15 = (iHashCode14 + (str12 == null ? 0 : str12.hashCode())) * 31;
        String str13 = this.f43169q;
        int iHashCode16 = (iHashCode15 + (str13 == null ? 0 : str13.hashCode())) * 31;
        String str14 = this.f43170r;
        int iHashCode17 = (iHashCode16 + (str14 == null ? 0 : str14.hashCode())) * 31;
        String str15 = this.f43171s;
        int iHashCode18 = (iHashCode17 + (str15 == null ? 0 : str15.hashCode())) * 31;
        String str16 = this.f43172t;
        int iHashCode19 = (iHashCode18 + (str16 == null ? 0 : str16.hashCode())) * 31;
        ft.u0 u0Var = this.f43173u;
        return iHashCode19 + (u0Var != null ? u0Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Card(expMonth=");
        sb2.append(this.f43155a);
        sb2.append(", expYear=");
        sb2.append(this.f43156b);
        sb2.append(", name=");
        b.c0.D(sb2, this.f43157c, ", addressLine1=", this.f43158d, ", addressLine1Check=");
        b.c0.D(sb2, this.f43159e, ", addressLine2=", this.f43160f, ", addressCity=");
        b.c0.D(sb2, this.f43161g, ", addressState=", this.f43162h, ", addressZip=");
        b.c0.D(sb2, this.f43163i, ", addressZipCheck=", this.f43164j, ", addressCountry=");
        b.c0.D(sb2, this.f43165k, ", last4=", this.f43166l, ", brand=");
        sb2.append(this.f43167m);
        sb2.append(", funding=");
        sb2.append(this.n);
        sb2.append(", fingerprint=");
        b.c0.D(sb2, this.o, ", country=", this.f43168p, ", currency=");
        b.c0.D(sb2, this.f43169q, ", customerId=", this.f43170r, ", cvcCheck=");
        b.c0.D(sb2, this.f43171s, ", id=", this.f43172t, ", tokenizationMethod=");
        sb2.append(this.f43173u);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Integer num = this.f43155a;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        Integer num2 = this.f43156b;
        if (num2 == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num2);
        }
        dest.writeString(this.f43157c);
        dest.writeString(this.f43158d);
        dest.writeString(this.f43159e);
        dest.writeString(this.f43160f);
        dest.writeString(this.f43161g);
        dest.writeString(this.f43162h);
        dest.writeString(this.f43163i);
        dest.writeString(this.f43164j);
        dest.writeString(this.f43165k);
        dest.writeString(this.f43166l);
        dest.writeString(this.f43167m.name());
        ft.c cVar = this.n;
        if (cVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(cVar.name());
        }
        dest.writeString(this.o);
        dest.writeString(this.f43168p);
        dest.writeString(this.f43169q);
        dest.writeString(this.f43170r);
        dest.writeString(this.f43171s);
        dest.writeString(this.f43172t);
        ft.u0 u0Var = this.f43173u;
        if (u0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(u0Var.name());
        }
    }
}
