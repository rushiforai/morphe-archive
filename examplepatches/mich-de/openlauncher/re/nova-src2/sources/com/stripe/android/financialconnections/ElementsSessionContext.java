package com.stripe.android.financialconnections;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.IncentiveEligibilitySession;
import ft.d0;
import java.io.Serializable;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/financialconnections/ElementsSessionContext;", "Landroid/os/Parcelable;", "BillingDetails", "PrefillDetails", "AllowRedisplay", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ElementsSessionContext implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ElementsSessionContext> CREATOR = new d();

    /* renamed from: a, reason: collision with root package name */
    public final Long f42633a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42634b;

    /* renamed from: c, reason: collision with root package name */
    public final d0 f42635c;

    /* renamed from: d, reason: collision with root package name */
    public final AllowRedisplay f42636d;

    /* renamed from: e, reason: collision with root package name */
    public final BillingDetails f42637e;

    /* renamed from: f, reason: collision with root package name */
    public final PrefillDetails f42638f;

    /* renamed from: g, reason: collision with root package name */
    public final IncentiveEligibilitySession f42639g;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/financialconnections/ElementsSessionContext$AllowRedisplay;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AllowRedisplay implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<AllowRedisplay> CREATOR;

        /* renamed from: b, reason: collision with root package name */
        public static final AllowRedisplay f42640b;

        /* renamed from: c, reason: collision with root package name */
        public static final AllowRedisplay f42641c;

        /* renamed from: d, reason: collision with root package name */
        public static final AllowRedisplay f42642d;

        /* renamed from: e, reason: collision with root package name */
        public static final /* synthetic */ AllowRedisplay[] f42643e;

        /* renamed from: a, reason: collision with root package name */
        public final String f42644a;

        static {
            AllowRedisplay allowRedisplay = new AllowRedisplay("Unspecified", 0, "unspecified");
            f42640b = allowRedisplay;
            AllowRedisplay allowRedisplay2 = new AllowRedisplay("Limited", 1, "limited");
            f42641c = allowRedisplay2;
            AllowRedisplay allowRedisplay3 = new AllowRedisplay("Always", 2, "always");
            f42642d = allowRedisplay3;
            AllowRedisplay[] allowRedisplayArr = {allowRedisplay, allowRedisplay2, allowRedisplay3};
            f42643e = allowRedisplayArr;
            EnumEntriesKt.a(allowRedisplayArr);
            CREATOR = new a();
        }

        public AllowRedisplay(String str, int i5, String str2) {
            this.f42644a = str2;
        }

        public static AllowRedisplay valueOf(String str) {
            return (AllowRedisplay) Enum.valueOf(AllowRedisplay.class, str);
        }

        public static AllowRedisplay[] values() {
            return (AllowRedisplay[]) f42643e.clone();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(name());
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/financialconnections/ElementsSessionContext$BillingDetails;", "Landroid/os/Parcelable;", "Address", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class BillingDetails implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<BillingDetails> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f42645a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42646b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42647c;

        /* renamed from: d, reason: collision with root package name */
        public final Address f42648d;

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/ElementsSessionContext$BillingDetails$Address;", "Landroid/os/Parcelable;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Address implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<Address> CREATOR = new b();

            /* renamed from: a, reason: collision with root package name */
            public final String f42649a;

            /* renamed from: b, reason: collision with root package name */
            public final String f42650b;

            /* renamed from: c, reason: collision with root package name */
            public final String f42651c;

            /* renamed from: d, reason: collision with root package name */
            public final String f42652d;

            /* renamed from: e, reason: collision with root package name */
            public final String f42653e;

            /* renamed from: f, reason: collision with root package name */
            public final String f42654f;

            public Address(String str, String str2, String str3, String str4, String str5, String str6) {
                this.f42649a = str;
                this.f42650b = str2;
                this.f42651c = str3;
                this.f42652d = str4;
                this.f42653e = str5;
                this.f42654f = str6;
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
                return Intrinsics.b(this.f42649a, address.f42649a) && Intrinsics.b(this.f42650b, address.f42650b) && Intrinsics.b(this.f42651c, address.f42651c) && Intrinsics.b(this.f42652d, address.f42652d) && Intrinsics.b(this.f42653e, address.f42653e) && Intrinsics.b(this.f42654f, address.f42654f);
            }

            public final int hashCode() {
                String str = this.f42649a;
                int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
                String str2 = this.f42650b;
                int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
                String str3 = this.f42651c;
                int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
                String str4 = this.f42652d;
                int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
                String str5 = this.f42653e;
                int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
                String str6 = this.f42654f;
                return iHashCode5 + (str6 != null ? str6.hashCode() : 0);
            }

            public final String toString() {
                StringBuilder sbW = c0.w("Address(line1=", this.f42649a, ", line2=", this.f42650b, ", postalCode=");
                c0.D(sbW, this.f42651c, ", city=", this.f42652d, ", state=");
                return c0.s(sbW, this.f42653e, ", country=", this.f42654f, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f42649a);
                dest.writeString(this.f42650b);
                dest.writeString(this.f42651c);
                dest.writeString(this.f42652d);
                dest.writeString(this.f42653e);
                dest.writeString(this.f42654f);
            }
        }

        public BillingDetails(String str, String str2, String str3, Address address) {
            this.f42645a = str;
            this.f42646b = str2;
            this.f42647c = str3;
            this.f42648d = address;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BillingDetails)) {
                return false;
            }
            BillingDetails billingDetails = (BillingDetails) obj;
            return Intrinsics.b(this.f42645a, billingDetails.f42645a) && Intrinsics.b(this.f42646b, billingDetails.f42646b) && Intrinsics.b(this.f42647c, billingDetails.f42647c) && Intrinsics.b(this.f42648d, billingDetails.f42648d);
        }

        public final int hashCode() {
            String str = this.f42645a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f42646b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f42647c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            Address address = this.f42648d;
            return iHashCode3 + (address != null ? address.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = c0.w("BillingDetails(name=", this.f42645a, ", phone=", this.f42646b, ", email=");
            sbW.append(this.f42647c);
            sbW.append(", address=");
            sbW.append(this.f42648d);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42645a);
            dest.writeString(this.f42646b);
            dest.writeString(this.f42647c);
            Address address = this.f42648d;
            if (address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/financialconnections/ElementsSessionContext$PrefillDetails;", "Landroid/os/Parcelable;", "Ljava/io/Serializable;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PrefillDetails implements Parcelable, Serializable {

        @NotNull
        public static final Parcelable.Creator<PrefillDetails> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final String f42655a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42656b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42657c;

        public PrefillDetails(String str, String str2, String str3) {
            this.f42655a = str;
            this.f42656b = str2;
            this.f42657c = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PrefillDetails)) {
                return false;
            }
            PrefillDetails prefillDetails = (PrefillDetails) obj;
            return Intrinsics.b(this.f42655a, prefillDetails.f42655a) && Intrinsics.b(this.f42656b, prefillDetails.f42656b) && Intrinsics.b(this.f42657c, prefillDetails.f42657c);
        }

        public final int hashCode() {
            String str = this.f42655a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f42656b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f42657c;
            return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
        }

        public final String toString() {
            return c0.q(c0.w("PrefillDetails(email=", this.f42655a, ", phone=", this.f42656b, ", phoneCountryCode="), this.f42657c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42655a);
            dest.writeString(this.f42656b);
            dest.writeString(this.f42657c);
        }
    }

    public ElementsSessionContext(Long l9, String str, d0 d0Var, AllowRedisplay allowRedisplay, BillingDetails billingDetails, PrefillDetails prefillDetails, IncentiveEligibilitySession incentiveEligibilitySession) {
        Intrinsics.g(prefillDetails, "prefillDetails");
        this.f42633a = l9;
        this.f42634b = str;
        this.f42635c = d0Var;
        this.f42636d = allowRedisplay;
        this.f42637e = billingDetails;
        this.f42638f = prefillDetails;
        this.f42639g = incentiveEligibilitySession;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ElementsSessionContext)) {
            return false;
        }
        ElementsSessionContext elementsSessionContext = (ElementsSessionContext) obj;
        return Intrinsics.b(this.f42633a, elementsSessionContext.f42633a) && Intrinsics.b(this.f42634b, elementsSessionContext.f42634b) && this.f42635c == elementsSessionContext.f42635c && this.f42636d == elementsSessionContext.f42636d && Intrinsics.b(this.f42637e, elementsSessionContext.f42637e) && Intrinsics.b(this.f42638f, elementsSessionContext.f42638f) && Intrinsics.b(this.f42639g, elementsSessionContext.f42639g);
    }

    public final int hashCode() {
        Long l9 = this.f42633a;
        int iHashCode = (l9 == null ? 0 : l9.hashCode()) * 31;
        String str = this.f42634b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        d0 d0Var = this.f42635c;
        int iHashCode3 = (iHashCode2 + (d0Var == null ? 0 : d0Var.hashCode())) * 31;
        AllowRedisplay allowRedisplay = this.f42636d;
        int iHashCode4 = (iHashCode3 + (allowRedisplay == null ? 0 : allowRedisplay.hashCode())) * 31;
        BillingDetails billingDetails = this.f42637e;
        int iHashCode5 = (this.f42638f.hashCode() + ((iHashCode4 + (billingDetails == null ? 0 : billingDetails.hashCode())) * 31)) * 31;
        IncentiveEligibilitySession incentiveEligibilitySession = this.f42639g;
        return iHashCode5 + (incentiveEligibilitySession != null ? incentiveEligibilitySession.hashCode() : 0);
    }

    public final String toString() {
        return "ElementsSessionContext(amount=" + this.f42633a + ", currency=" + this.f42634b + ", linkMode=" + this.f42635c + ", allowRedisplay=" + this.f42636d + ", billingDetails=" + this.f42637e + ", prefillDetails=" + this.f42638f + ", incentiveEligibilitySession=" + this.f42639g + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Long l9 = this.f42633a;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeString(this.f42634b);
        d0 d0Var = this.f42635c;
        if (d0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(d0Var.name());
        }
        AllowRedisplay allowRedisplay = this.f42636d;
        if (allowRedisplay == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            allowRedisplay.writeToParcel(dest, i5);
        }
        BillingDetails billingDetails = this.f42637e;
        if (billingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            billingDetails.writeToParcel(dest, i5);
        }
        this.f42638f.writeToParcel(dest, i5);
        dest.writeParcelable(this.f42639g, i5);
    }
}
