package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.PaymentMethod;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001:\u0007\u0002\u0003\u0004\u0005\u0006\u0007\b¨\u0006\t"}, d2 = {"Lcom/stripe/android/model/ElementsSession;", "Lcom/stripe/android/core/model/StripeModel;", "LinkSettings", "ExperimentsData", "CardBrandChoice", "CustomPaymentMethod", "Customer", "ft/v", "ft/u", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class ElementsSession implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<ElementsSession> CREATOR = new w0();

    /* renamed from: a, reason: collision with root package name */
    public final LinkSettings f43386a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43387b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43388c;

    /* renamed from: d, reason: collision with root package name */
    public final StripeIntent f43389d;

    /* renamed from: e, reason: collision with root package name */
    public final List f43390e;

    /* renamed from: f, reason: collision with root package name */
    public final Map f43391f;

    /* renamed from: g, reason: collision with root package name */
    public final ExperimentsData f43392g;

    /* renamed from: h, reason: collision with root package name */
    public final Customer f43393h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43394i;

    /* renamed from: j, reason: collision with root package name */
    public final String f43395j;

    /* renamed from: k, reason: collision with root package name */
    public final CardBrandChoice f43396k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f43397l;

    /* renamed from: m, reason: collision with root package name */
    public final Throwable f43398m;
    public final List n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final PassiveCaptchaParams f43399p;

    /* renamed from: q, reason: collision with root package name */
    public final String f43400q;

    /* renamed from: r, reason: collision with root package name */
    public final String f43401r;

    /* renamed from: s, reason: collision with root package name */
    public final String f43402s;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$CardBrandChoice;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CardBrandChoice implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<CardBrandChoice> CREATOR = new v0();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f43403a;

        /* renamed from: b, reason: collision with root package name */
        public final List f43404b;

        public CardBrandChoice(List preferredNetworks, boolean z11) {
            Intrinsics.g(preferredNetworks, "preferredNetworks");
            this.f43403a = z11;
            this.f43404b = preferredNetworks;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof CardBrandChoice)) {
                return false;
            }
            CardBrandChoice cardBrandChoice = (CardBrandChoice) obj;
            return this.f43403a == cardBrandChoice.f43403a && Intrinsics.b(this.f43404b, cardBrandChoice.f43404b);
        }

        public final int hashCode() {
            return this.f43404b.hashCode() + (Boolean.hashCode(this.f43403a) * 31);
        }

        public final String toString() {
            return "CardBrandChoice(eligible=" + this.f43403a + ", preferredNetworks=" + this.f43404b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f43403a ? 1 : 0);
            dest.writeStringList(this.f43404b);
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod;", "Lcom/stripe/android/core/model/StripeModel;", "Available", "Unavailable", "Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod$Available;", "Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod$Unavailable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface CustomPaymentMethod extends StripeModel {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod$Available;", "Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Available implements CustomPaymentMethod {

            @NotNull
            public static final Parcelable.Creator<Available> CREATOR = new x0();

            /* renamed from: a, reason: collision with root package name */
            public final String f43405a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43406b;

            /* renamed from: c, reason: collision with root package name */
            public final String f43407c;

            public Available(String type, String displayName, String logoUrl) {
                Intrinsics.g(type, "type");
                Intrinsics.g(displayName, "displayName");
                Intrinsics.g(logoUrl, "logoUrl");
                this.f43405a = type;
                this.f43406b = displayName;
                this.f43407c = logoUrl;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Available)) {
                    return false;
                }
                Available available = (Available) obj;
                return Intrinsics.b(this.f43405a, available.f43405a) && Intrinsics.b(this.f43406b, available.f43406b) && Intrinsics.b(this.f43407c, available.f43407c);
            }

            public final int hashCode() {
                return this.f43407c.hashCode() + b.c0.e(this.f43405a.hashCode() * 31, 31, this.f43406b);
            }

            public final String toString() {
                return b.c0.q(b.c0.w("Available(type=", this.f43405a, ", displayName=", this.f43406b, ", logoUrl="), this.f43407c, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43405a);
                dest.writeString(this.f43406b);
                dest.writeString(this.f43407c);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod$Unavailable;", "Lcom/stripe/android/model/ElementsSession$CustomPaymentMethod;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Unavailable implements CustomPaymentMethod {

            @NotNull
            public static final Parcelable.Creator<Unavailable> CREATOR = new y0();

            /* renamed from: a, reason: collision with root package name */
            public final String f43408a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43409b;

            public Unavailable(String type, String error) {
                Intrinsics.g(type, "type");
                Intrinsics.g(error, "error");
                this.f43408a = type;
                this.f43409b = error;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Unavailable)) {
                    return false;
                }
                Unavailable unavailable = (Unavailable) obj;
                return Intrinsics.b(this.f43408a, unavailable.f43408a) && Intrinsics.b(this.f43409b, unavailable.f43409b);
            }

            public final int hashCode() {
                return this.f43409b.hashCode() + (this.f43408a.hashCode() * 31);
            }

            public final String toString() {
                return b.c0.n("Unavailable(type=", this.f43408a, ", error=", this.f43409b, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43408a);
                dest.writeString(this.f43409b);
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer;", "Lcom/stripe/android/core/model/StripeModel;", "Session", "Components", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Customer implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Customer> CREATOR = new g1();

        /* renamed from: a, reason: collision with root package name */
        public final List f43410a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43411b;

        /* renamed from: c, reason: collision with root package name */
        public final Session f43412c;

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components;", "Lcom/stripe/android/core/model/StripeModel;", "MobilePaymentElement", "CustomerSheet", "com/stripe/android/model/e1", "com/stripe/android/model/f1", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Components implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<Components> CREATOR = new z0();

            /* renamed from: a, reason: collision with root package name */
            public final MobilePaymentElement f43413a;

            /* renamed from: b, reason: collision with root package name */
            public final CustomerSheet f43414b;

            @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet;", "Lcom/stripe/android/core/model/StripeModel;", "Disabled", "Enabled", "Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet$Disabled;", "Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet$Enabled;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public interface CustomerSheet extends StripeModel {

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet$Disabled;", "Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final /* data */ class Disabled implements CustomerSheet {

                    /* renamed from: a, reason: collision with root package name */
                    public static final Disabled f43415a = new Disabled();

                    @NotNull
                    public static final Parcelable.Creator<Disabled> CREATOR = new a1();

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        return this == obj || (obj instanceof Disabled);
                    }

                    public final int hashCode() {
                        return -269074152;
                    }

                    public final String toString() {
                        return "Disabled";
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeInt(1);
                    }
                }

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet$Enabled;", "Lcom/stripe/android/model/ElementsSession$Customer$Components$CustomerSheet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final /* data */ class Enabled implements CustomerSheet {

                    @NotNull
                    public static final Parcelable.Creator<Enabled> CREATOR = new b1();

                    /* renamed from: a, reason: collision with root package name */
                    public final e1 f43416a;

                    /* renamed from: b, reason: collision with root package name */
                    public final f1 f43417b;

                    /* renamed from: c, reason: collision with root package name */
                    public final boolean f43418c;

                    public Enabled(e1 paymentMethodRemove, f1 paymentMethodRemoveLast, boolean z11) {
                        Intrinsics.g(paymentMethodRemove, "paymentMethodRemove");
                        Intrinsics.g(paymentMethodRemoveLast, "paymentMethodRemoveLast");
                        this.f43416a = paymentMethodRemove;
                        this.f43417b = paymentMethodRemoveLast;
                        this.f43418c = z11;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof Enabled)) {
                            return false;
                        }
                        Enabled enabled = (Enabled) obj;
                        return this.f43416a == enabled.f43416a && this.f43417b == enabled.f43417b && this.f43418c == enabled.f43418c;
                    }

                    public final int hashCode() {
                        return Boolean.hashCode(this.f43418c) + ((this.f43417b.hashCode() + (this.f43416a.hashCode() * 31)) * 31);
                    }

                    public final String toString() {
                        StringBuilder sb2 = new StringBuilder("Enabled(paymentMethodRemove=");
                        sb2.append(this.f43416a);
                        sb2.append(", paymentMethodRemoveLast=");
                        sb2.append(this.f43417b);
                        sb2.append(", isPaymentMethodSyncDefaultEnabled=");
                        return a80.m.k(sb2, this.f43418c, ")");
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeString(this.f43416a.name());
                        dest.writeString(this.f43417b.name());
                        dest.writeInt(this.f43418c ? 1 : 0);
                    }
                }
            }

            @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement;", "Lcom/stripe/android/core/model/StripeModel;", "Disabled", "Enabled", "Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement$Disabled;", "Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement$Enabled;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public interface MobilePaymentElement extends StripeModel {

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement$Disabled;", "Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final /* data */ class Disabled implements MobilePaymentElement {

                    /* renamed from: a, reason: collision with root package name */
                    public static final Disabled f43419a = new Disabled();

                    @NotNull
                    public static final Parcelable.Creator<Disabled> CREATOR = new c1();

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        return this == obj || (obj instanceof Disabled);
                    }

                    public final int hashCode() {
                        return -1145758141;
                    }

                    public final String toString() {
                        return "Disabled";
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeInt(1);
                    }
                }

                @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement$Enabled;", "Lcom/stripe/android/model/ElementsSession$Customer$Components$MobilePaymentElement;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
                public static final /* data */ class Enabled implements MobilePaymentElement {

                    @NotNull
                    public static final Parcelable.Creator<Enabled> CREATOR = new d1();

                    /* renamed from: a, reason: collision with root package name */
                    public final boolean f43420a;

                    /* renamed from: b, reason: collision with root package name */
                    public final e1 f43421b;

                    /* renamed from: c, reason: collision with root package name */
                    public final f1 f43422c;

                    /* renamed from: d, reason: collision with root package name */
                    public final PaymentMethod.AllowRedisplay f43423d;

                    /* renamed from: e, reason: collision with root package name */
                    public final boolean f43424e;

                    public Enabled(boolean z11, e1 paymentMethodRemove, f1 paymentMethodRemoveLast, PaymentMethod.AllowRedisplay allowRedisplay, boolean z12) {
                        Intrinsics.g(paymentMethodRemove, "paymentMethodRemove");
                        Intrinsics.g(paymentMethodRemoveLast, "paymentMethodRemoveLast");
                        this.f43420a = z11;
                        this.f43421b = paymentMethodRemove;
                        this.f43422c = paymentMethodRemoveLast;
                        this.f43423d = allowRedisplay;
                        this.f43424e = z12;
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final boolean equals(Object obj) {
                        if (this == obj) {
                            return true;
                        }
                        if (!(obj instanceof Enabled)) {
                            return false;
                        }
                        Enabled enabled = (Enabled) obj;
                        return this.f43420a == enabled.f43420a && this.f43421b == enabled.f43421b && this.f43422c == enabled.f43422c && this.f43423d == enabled.f43423d && this.f43424e == enabled.f43424e;
                    }

                    public final int hashCode() {
                        int iHashCode = (this.f43422c.hashCode() + ((this.f43421b.hashCode() + (Boolean.hashCode(this.f43420a) * 31)) * 31)) * 31;
                        PaymentMethod.AllowRedisplay allowRedisplay = this.f43423d;
                        return Boolean.hashCode(this.f43424e) + ((iHashCode + (allowRedisplay == null ? 0 : allowRedisplay.hashCode())) * 31);
                    }

                    public final String toString() {
                        StringBuilder sb2 = new StringBuilder("Enabled(isPaymentMethodSaveEnabled=");
                        sb2.append(this.f43420a);
                        sb2.append(", paymentMethodRemove=");
                        sb2.append(this.f43421b);
                        sb2.append(", paymentMethodRemoveLast=");
                        sb2.append(this.f43422c);
                        sb2.append(", allowRedisplayOverride=");
                        sb2.append(this.f43423d);
                        sb2.append(", isPaymentMethodSetAsDefaultEnabled=");
                        return a80.m.k(sb2, this.f43424e, ")");
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel dest, int i5) {
                        Intrinsics.g(dest, "dest");
                        dest.writeInt(this.f43420a ? 1 : 0);
                        dest.writeString(this.f43421b.name());
                        dest.writeString(this.f43422c.name());
                        PaymentMethod.AllowRedisplay allowRedisplay = this.f43423d;
                        if (allowRedisplay == null) {
                            dest.writeInt(0);
                        } else {
                            dest.writeInt(1);
                            allowRedisplay.writeToParcel(dest, i5);
                        }
                        dest.writeInt(this.f43424e ? 1 : 0);
                    }
                }
            }

            public Components(MobilePaymentElement mobilePaymentElement, CustomerSheet customerSheet) {
                Intrinsics.g(mobilePaymentElement, "mobilePaymentElement");
                Intrinsics.g(customerSheet, "customerSheet");
                this.f43413a = mobilePaymentElement;
                this.f43414b = customerSheet;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Components)) {
                    return false;
                }
                Components components = (Components) obj;
                return Intrinsics.b(this.f43413a, components.f43413a) && Intrinsics.b(this.f43414b, components.f43414b);
            }

            public final int hashCode() {
                return this.f43414b.hashCode() + (this.f43413a.hashCode() * 31);
            }

            public final String toString() {
                return "Components(mobilePaymentElement=" + this.f43413a + ", customerSheet=" + this.f43414b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeParcelable(this.f43413a, i5);
                dest.writeParcelable(this.f43414b, i5);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$Customer$Session;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Session implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<Session> CREATOR = new h1();

            /* renamed from: a, reason: collision with root package name */
            public final String f43425a;

            /* renamed from: b, reason: collision with root package name */
            public final boolean f43426b;

            /* renamed from: c, reason: collision with root package name */
            public final String f43427c;

            /* renamed from: d, reason: collision with root package name */
            public final int f43428d;

            /* renamed from: e, reason: collision with root package name */
            public final String f43429e;

            /* renamed from: f, reason: collision with root package name */
            public final Components f43430f;

            public Session(String id2, boolean z11, String apiKey, int i5, String customerId, Components components) {
                Intrinsics.g(id2, "id");
                Intrinsics.g(apiKey, "apiKey");
                Intrinsics.g(customerId, "customerId");
                Intrinsics.g(components, "components");
                this.f43425a = id2;
                this.f43426b = z11;
                this.f43427c = apiKey;
                this.f43428d = i5;
                this.f43429e = customerId;
                this.f43430f = components;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Session)) {
                    return false;
                }
                Session session = (Session) obj;
                return Intrinsics.b(this.f43425a, session.f43425a) && this.f43426b == session.f43426b && Intrinsics.b(this.f43427c, session.f43427c) && this.f43428d == session.f43428d && Intrinsics.b(this.f43429e, session.f43429e) && Intrinsics.b(this.f43430f, session.f43430f);
            }

            public final int hashCode() {
                return this.f43430f.hashCode() + b.c0.e(b.u4.a(this.f43428d, b.c0.e(c9.f(this.f43425a.hashCode() * 31, 31, this.f43426b), 31, this.f43427c), 31), 31, this.f43429e);
            }

            public final String toString() {
                return "Session(id=" + this.f43425a + ", liveMode=" + this.f43426b + ", apiKey=" + this.f43427c + ", apiKeyExpiry=" + this.f43428d + ", customerId=" + this.f43429e + ", components=" + this.f43430f + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43425a);
                dest.writeInt(this.f43426b ? 1 : 0);
                dest.writeString(this.f43427c);
                dest.writeInt(this.f43428d);
                dest.writeString(this.f43429e);
                this.f43430f.writeToParcel(dest, i5);
            }
        }

        public Customer(List paymentMethods, String str, Session session) {
            Intrinsics.g(paymentMethods, "paymentMethods");
            Intrinsics.g(session, "session");
            this.f43410a = paymentMethods;
            this.f43411b = str;
            this.f43412c = session;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Customer)) {
                return false;
            }
            Customer customer = (Customer) obj;
            return Intrinsics.b(this.f43410a, customer.f43410a) && Intrinsics.b(this.f43411b, customer.f43411b) && Intrinsics.b(this.f43412c, customer.f43412c);
        }

        public final int hashCode() {
            int iHashCode = this.f43410a.hashCode() * 31;
            String str = this.f43411b;
            return this.f43412c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            return "Customer(paymentMethods=" + this.f43410a + ", defaultPaymentMethod=" + this.f43411b + ", session=" + this.f43412c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Iterator itK = fq.c.k(this.f43410a, dest);
            while (itK.hasNext()) {
                ((PaymentMethod) itK.next()).writeToParcel(dest, i5);
            }
            dest.writeString(this.f43411b);
            this.f43412c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$ExperimentsData;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ExperimentsData implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<ExperimentsData> CREATOR = new i1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43431a;

        /* renamed from: b, reason: collision with root package name */
        public final Map f43432b;

        public ExperimentsData(String arbId, Map map) {
            Intrinsics.g(arbId, "arbId");
            this.f43431a = arbId;
            this.f43432b = map;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ExperimentsData)) {
                return false;
            }
            ExperimentsData experimentsData = (ExperimentsData) obj;
            return Intrinsics.b(this.f43431a, experimentsData.f43431a) && Intrinsics.b(this.f43432b, experimentsData.f43432b);
        }

        public final int hashCode() {
            return this.f43432b.hashCode() + (this.f43431a.hashCode() * 31);
        }

        public final String toString() {
            return "ExperimentsData(arbId=" + this.f43431a + ", experimentAssignments=" + this.f43432b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43431a);
            Map map = this.f43432b;
            dest.writeInt(map.size());
            for (Map.Entry entry : map.entrySet()) {
                dest.writeString(((ft.u) entry.getKey()).name());
                dest.writeString((String) entry.getValue());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ElementsSession$LinkSettings;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class LinkSettings implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<LinkSettings> CREATOR = new j1();

        /* renamed from: a, reason: collision with root package name */
        public final List f43433a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f43434b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.d0 f43435c;

        /* renamed from: d, reason: collision with root package name */
        public final Map f43436d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f43437e;

        /* renamed from: f, reason: collision with root package name */
        public final LinkConsumerIncentive f43438f;

        /* renamed from: g, reason: collision with root package name */
        public final boolean f43439g;

        /* renamed from: h, reason: collision with root package name */
        public final boolean f43440h;

        /* renamed from: i, reason: collision with root package name */
        public final boolean f43441i;

        /* renamed from: j, reason: collision with root package name */
        public final boolean f43442j;

        /* renamed from: k, reason: collision with root package name */
        public final boolean f43443k;

        /* renamed from: l, reason: collision with root package name */
        public final boolean f43444l;

        /* renamed from: m, reason: collision with root package name */
        public final boolean f43445m;
        public final List n;

        public LinkSettings(List linkFundingSources, boolean z11, ft.d0 d0Var, Map map, boolean z12, LinkConsumerIncentive linkConsumerIncentive, boolean z13, boolean z14, boolean z15, boolean z16, boolean z17, boolean z18, boolean z19, List linkSupportedPaymentMethodsOnboardingEnabled) {
            Intrinsics.g(linkFundingSources, "linkFundingSources");
            Intrinsics.g(linkSupportedPaymentMethodsOnboardingEnabled, "linkSupportedPaymentMethodsOnboardingEnabled");
            this.f43433a = linkFundingSources;
            this.f43434b = z11;
            this.f43435c = d0Var;
            this.f43436d = map;
            this.f43437e = z12;
            this.f43438f = linkConsumerIncentive;
            this.f43439g = z13;
            this.f43440h = z14;
            this.f43441i = z15;
            this.f43442j = z16;
            this.f43443k = z17;
            this.f43444l = z18;
            this.f43445m = z19;
            this.n = linkSupportedPaymentMethodsOnboardingEnabled;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof LinkSettings)) {
                return false;
            }
            LinkSettings linkSettings = (LinkSettings) obj;
            return Intrinsics.b(this.f43433a, linkSettings.f43433a) && this.f43434b == linkSettings.f43434b && this.f43435c == linkSettings.f43435c && Intrinsics.b(this.f43436d, linkSettings.f43436d) && this.f43437e == linkSettings.f43437e && Intrinsics.b(this.f43438f, linkSettings.f43438f) && this.f43439g == linkSettings.f43439g && this.f43440h == linkSettings.f43440h && this.f43441i == linkSettings.f43441i && this.f43442j == linkSettings.f43442j && this.f43443k == linkSettings.f43443k && this.f43444l == linkSettings.f43444l && this.f43445m == linkSettings.f43445m && Intrinsics.b(this.n, linkSettings.n);
        }

        public final int hashCode() {
            int iF = c9.f(this.f43433a.hashCode() * 31, 31, this.f43434b);
            ft.d0 d0Var = this.f43435c;
            int iF2 = c9.f(x8.h.c(this.f43436d, (iF + (d0Var == null ? 0 : d0Var.hashCode())) * 31, 31), 31, this.f43437e);
            LinkConsumerIncentive linkConsumerIncentive = this.f43438f;
            return this.n.hashCode() + c9.f(c9.f(c9.f(c9.f(c9.f(c9.f(c9.f((iF2 + (linkConsumerIncentive != null ? linkConsumerIncentive.hashCode() : 0)) * 31, 31, this.f43439g), 31, this.f43440h), 31, this.f43441i), 31, this.f43442j), 31, this.f43443k), 31, this.f43444l), 31, this.f43445m);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("LinkSettings(linkFundingSources=");
            sb2.append(this.f43433a);
            sb2.append(", linkPassthroughModeEnabled=");
            sb2.append(this.f43434b);
            sb2.append(", linkMode=");
            sb2.append(this.f43435c);
            sb2.append(", linkFlags=");
            sb2.append(this.f43436d);
            sb2.append(", disableLinkSignup=");
            sb2.append(this.f43437e);
            sb2.append(", linkConsumerIncentive=");
            sb2.append(this.f43438f);
            sb2.append(", useAttestationEndpoints=");
            a80.m.s(sb2, this.f43439g, ", suppress2faModal=", this.f43440h, ", disableLinkRuxInFlowController=");
            a80.m.s(sb2, this.f43441i, ", linkEnableDisplayableDefaultValuesInEce=", this.f43442j, ", linkMobileSkipWalletInFlowController=");
            a80.m.s(sb2, this.f43443k, ", linkSignUpOptInFeatureEnabled=", this.f43444l, ", linkSignUpOptInInitialValue=");
            sb2.append(this.f43445m);
            sb2.append(", linkSupportedPaymentMethodsOnboardingEnabled=");
            sb2.append(this.n);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeStringList(this.f43433a);
            dest.writeInt(this.f43434b ? 1 : 0);
            ft.d0 d0Var = this.f43435c;
            if (d0Var == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(d0Var.name());
            }
            Map map = this.f43436d;
            dest.writeInt(map.size());
            for (Map.Entry entry : map.entrySet()) {
                dest.writeString((String) entry.getKey());
                dest.writeInt(((Boolean) entry.getValue()).booleanValue() ? 1 : 0);
            }
            dest.writeInt(this.f43437e ? 1 : 0);
            dest.writeParcelable(this.f43438f, i5);
            dest.writeInt(this.f43439g ? 1 : 0);
            dest.writeInt(this.f43440h ? 1 : 0);
            dest.writeInt(this.f43441i ? 1 : 0);
            dest.writeInt(this.f43442j ? 1 : 0);
            dest.writeInt(this.f43443k ? 1 : 0);
            dest.writeInt(this.f43444l ? 1 : 0);
            dest.writeInt(this.f43445m ? 1 : 0);
            dest.writeStringList(this.n);
        }
    }

    public ElementsSession(LinkSettings linkSettings, String str, String str2, StripeIntent stripeIntent, List orderedPaymentMethodTypesAndWallets, Map map, ExperimentsData experimentsData, Customer customer, String str3, String str4, CardBrandChoice cardBrandChoice, boolean z11, Throwable th2, List customPaymentMethods, String elementsSessionId, PassiveCaptchaParams passiveCaptchaParams, String str5, String str6, String str7) {
        Intrinsics.g(stripeIntent, "stripeIntent");
        Intrinsics.g(orderedPaymentMethodTypesAndWallets, "orderedPaymentMethodTypesAndWallets");
        Intrinsics.g(customPaymentMethods, "customPaymentMethods");
        Intrinsics.g(elementsSessionId, "elementsSessionId");
        this.f43386a = linkSettings;
        this.f43387b = str;
        this.f43388c = str2;
        this.f43389d = stripeIntent;
        this.f43390e = orderedPaymentMethodTypesAndWallets;
        this.f43391f = map;
        this.f43392g = experimentsData;
        this.f43393h = customer;
        this.f43394i = str3;
        this.f43395j = str4;
        this.f43396k = cardBrandChoice;
        this.f43397l = z11;
        this.f43398m = th2;
        this.n = customPaymentMethods;
        this.o = elementsSessionId;
        this.f43399p = passiveCaptchaParams;
        this.f43400q = str5;
        this.f43401r = str6;
        this.f43402s = str7;
    }

    public final boolean b() {
        boolean z11;
        StripeIntent stripeIntent = this.f43389d;
        List f43772j = stripeIntent.getF43772j();
        z2 z2Var = PaymentMethod.Type.f43637g;
        boolean zContains = f43772j.contains("link");
        List o = stripeIntent.getO();
        if ((o instanceof Collection) && o.isEmpty()) {
            z11 = false;
        } else {
            Iterator it = o.iterator();
            while (it.hasNext()) {
                if (ft.w.f56066a.contains((String) it.next())) {
                    z11 = true;
                    break;
                }
            }
            z11 = false;
        }
        if (!zContains || !z11) {
            LinkSettings linkSettings = this.f43386a;
            if (!(linkSettings != null ? linkSettings.f43434b : false)) {
                return false;
            }
        }
        return true;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ElementsSession)) {
            return false;
        }
        ElementsSession elementsSession = (ElementsSession) obj;
        return Intrinsics.b(this.f43386a, elementsSession.f43386a) && Intrinsics.b(this.f43387b, elementsSession.f43387b) && Intrinsics.b(this.f43388c, elementsSession.f43388c) && Intrinsics.b(this.f43389d, elementsSession.f43389d) && Intrinsics.b(this.f43390e, elementsSession.f43390e) && Intrinsics.b(this.f43391f, elementsSession.f43391f) && Intrinsics.b(this.f43392g, elementsSession.f43392g) && Intrinsics.b(this.f43393h, elementsSession.f43393h) && Intrinsics.b(this.f43394i, elementsSession.f43394i) && Intrinsics.b(this.f43395j, elementsSession.f43395j) && Intrinsics.b(this.f43396k, elementsSession.f43396k) && this.f43397l == elementsSession.f43397l && Intrinsics.b(this.f43398m, elementsSession.f43398m) && Intrinsics.b(this.n, elementsSession.n) && Intrinsics.b(this.o, elementsSession.o) && Intrinsics.b(this.f43399p, elementsSession.f43399p) && Intrinsics.b(this.f43400q, elementsSession.f43400q) && Intrinsics.b(this.f43401r, elementsSession.f43401r) && Intrinsics.b(this.f43402s, elementsSession.f43402s);
    }

    public final int hashCode() {
        LinkSettings linkSettings = this.f43386a;
        int iHashCode = (linkSettings == null ? 0 : linkSettings.hashCode()) * 31;
        String str = this.f43387b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43388c;
        int iC = x8.h.c(this.f43391f, b.u4.c((this.f43389d.hashCode() + ((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31, 31, this.f43390e), 31);
        ExperimentsData experimentsData = this.f43392g;
        int iHashCode3 = (iC + (experimentsData == null ? 0 : experimentsData.hashCode())) * 31;
        Customer customer = this.f43393h;
        int iHashCode4 = (iHashCode3 + (customer == null ? 0 : customer.hashCode())) * 31;
        String str3 = this.f43394i;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43395j;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        CardBrandChoice cardBrandChoice = this.f43396k;
        int iF = c9.f((iHashCode6 + (cardBrandChoice == null ? 0 : cardBrandChoice.hashCode())) * 31, 31, this.f43397l);
        Throwable th2 = this.f43398m;
        int iE = b.c0.e(b.u4.c((iF + (th2 == null ? 0 : th2.hashCode())) * 31, 31, this.n), 31, this.o);
        PassiveCaptchaParams passiveCaptchaParams = this.f43399p;
        int iHashCode7 = (iE + (passiveCaptchaParams == null ? 0 : passiveCaptchaParams.hashCode())) * 31;
        String str5 = this.f43400q;
        int iHashCode8 = (iHashCode7 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f43401r;
        int iHashCode9 = (iHashCode8 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f43402s;
        return iHashCode9 + (str7 != null ? str7.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ElementsSession(linkSettings=");
        sb2.append(this.f43386a);
        sb2.append(", paymentMethodSpecs=");
        sb2.append(this.f43387b);
        sb2.append(", externalPaymentMethodData=");
        sb2.append(this.f43388c);
        sb2.append(", stripeIntent=");
        sb2.append(this.f43389d);
        sb2.append(", orderedPaymentMethodTypesAndWallets=");
        sb2.append(this.f43390e);
        sb2.append(", flags=");
        sb2.append(this.f43391f);
        sb2.append(", experimentsData=");
        sb2.append(this.f43392g);
        sb2.append(", customer=");
        sb2.append(this.f43393h);
        sb2.append(", merchantCountry=");
        b.c0.D(sb2, this.f43394i, ", merchantLogoUrl=", this.f43395j, ", cardBrandChoice=");
        sb2.append(this.f43396k);
        sb2.append(", isGooglePayEnabled=");
        sb2.append(this.f43397l);
        sb2.append(", sessionsError=");
        sb2.append(this.f43398m);
        sb2.append(", customPaymentMethods=");
        sb2.append(this.n);
        sb2.append(", elementsSessionId=");
        sb2.append(this.o);
        sb2.append(", passiveCaptcha=");
        sb2.append(this.f43399p);
        sb2.append(", elementsSessionConfigId=");
        b.c0.D(sb2, this.f43400q, ", accountId=", this.f43401r, ", merchantId=");
        return b.c0.q(sb2, this.f43402s, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        LinkSettings linkSettings = this.f43386a;
        if (linkSettings == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            linkSettings.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43387b);
        dest.writeString(this.f43388c);
        dest.writeParcelable(this.f43389d, i5);
        dest.writeStringList(this.f43390e);
        Map map = this.f43391f;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeString(((ft.v) entry.getKey()).name());
            dest.writeInt(((Boolean) entry.getValue()).booleanValue() ? 1 : 0);
        }
        ExperimentsData experimentsData = this.f43392g;
        if (experimentsData == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            experimentsData.writeToParcel(dest, i5);
        }
        Customer customer = this.f43393h;
        if (customer == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            customer.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43394i);
        dest.writeString(this.f43395j);
        CardBrandChoice cardBrandChoice = this.f43396k;
        if (cardBrandChoice == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            cardBrandChoice.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f43397l ? 1 : 0);
        dest.writeSerializable(this.f43398m);
        Iterator itK = fq.c.k(this.n, dest);
        while (itK.hasNext()) {
            dest.writeParcelable((Parcelable) itK.next(), i5);
        }
        dest.writeString(this.o);
        PassiveCaptchaParams passiveCaptchaParams = this.f43399p;
        if (passiveCaptchaParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            passiveCaptchaParams.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43400q);
        dest.writeString(this.f43401r);
        dest.writeString(this.f43402s);
    }
}
