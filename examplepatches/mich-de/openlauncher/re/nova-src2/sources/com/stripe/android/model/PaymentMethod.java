package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.wallets.Wallet;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\b\u0007\u0018\u00002\u00020\u0001:\u000f\u0002\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010¨\u0006\u0011"}, d2 = {"Lcom/stripe/android/model/PaymentMethod;", "Lcom/stripe/android/core/model/StripeModel;", "Type", "AfterRedirectAction", "BillingDetails", "AllowRedisplay", "TypeData", "Card", "CardPresent", "Ideal", "Fpx", "SepaDebit", "AuBecsDebit", "BacsDebit", "Upi", "Netbanking", "USBankAccount", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentMethod implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<PaymentMethod> CREATOR = new u2();

    /* renamed from: a, reason: collision with root package name */
    public final String f43569a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f43570b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f43571c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43572d;

    /* renamed from: e, reason: collision with root package name */
    public final Type f43573e;

    /* renamed from: f, reason: collision with root package name */
    public final BillingDetails f43574f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43575g;

    /* renamed from: h, reason: collision with root package name */
    public final Card f43576h;

    /* renamed from: i, reason: collision with root package name */
    public final CardPresent f43577i;

    /* renamed from: j, reason: collision with root package name */
    public final Fpx f43578j;

    /* renamed from: k, reason: collision with root package name */
    public final Ideal f43579k;

    /* renamed from: l, reason: collision with root package name */
    public final SepaDebit f43580l;

    /* renamed from: m, reason: collision with root package name */
    public final AuBecsDebit f43581m;
    public final BacsDebit n;
    public final Upi o;

    /* renamed from: p, reason: collision with root package name */
    public final Netbanking f43582p;

    /* renamed from: q, reason: collision with root package name */
    public final USBankAccount f43583q;

    /* renamed from: r, reason: collision with root package name */
    public final LinkPaymentDetails f43584r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f43585s;

    /* renamed from: t, reason: collision with root package name */
    public final AllowRedisplay f43586t;

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction;", "Landroid/os/Parcelable;", "None", "Poll", "Refresh", "Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction$None;", "Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction$Poll;", "Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction$Refresh;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface AfterRedirectAction extends Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction$None;", "Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class None implements AfterRedirectAction {

            /* renamed from: a, reason: collision with root package name */
            public static final None f43587a = new None();

            @NotNull
            public static final Parcelable.Creator<None> CREATOR = new i2();

            @Override // com.stripe.android.model.PaymentMethod.AfterRedirectAction
            public final boolean O() {
                return false;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(1);
            }

            @Override // com.stripe.android.model.PaymentMethod.AfterRedirectAction
            /* renamed from: z */
            public final long getF43588a() {
                return 15000L;
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction$Poll;", "Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Poll implements AfterRedirectAction {

            @NotNull
            public static final Parcelable.Creator<Poll> CREATOR = new j2();

            /* renamed from: a, reason: collision with root package name */
            public final long f43588a;

            public Poll(long j11) {
                this.f43588a = j11;
            }

            @Override // com.stripe.android.model.PaymentMethod.AfterRedirectAction
            public final boolean O() {
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
                return (obj instanceof Poll) && this.f43588a == ((Poll) obj).f43588a;
            }

            public final int hashCode() {
                return Long.hashCode(this.f43588a);
            }

            public final String toString() {
                return h6.c1.o(this.f43588a, "Poll(pollingDuration=", ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeLong(this.f43588a);
            }

            @Override // com.stripe.android.model.PaymentMethod.AfterRedirectAction
            /* renamed from: z, reason: from getter */
            public final long getF43588a() {
                return this.f43588a;
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction$Refresh;", "Lcom/stripe/android/model/PaymentMethod$AfterRedirectAction;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Refresh implements AfterRedirectAction {

            /* renamed from: a, reason: collision with root package name */
            public static final Refresh f43589a = new Refresh();

            @NotNull
            public static final Parcelable.Creator<Refresh> CREATOR = new k2();

            @Override // com.stripe.android.model.PaymentMethod.AfterRedirectAction
            public final boolean O() {
                return true;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                return this == obj || (obj instanceof Refresh);
            }

            public final int hashCode() {
                return 436825404;
            }

            public final String toString() {
                return "Refresh";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(1);
            }

            @Override // com.stripe.android.model.PaymentMethod.AfterRedirectAction
            /* renamed from: z */
            public final long getF43588a() {
                return 0L;
            }
        }

        boolean O();

        /* renamed from: z */
        long getF43588a();
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$AllowRedisplay;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AllowRedisplay implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<AllowRedisplay> CREATOR;

        /* renamed from: b, reason: collision with root package name */
        public static final AllowRedisplay f43590b;

        /* renamed from: c, reason: collision with root package name */
        public static final AllowRedisplay f43591c;

        /* renamed from: d, reason: collision with root package name */
        public static final AllowRedisplay f43592d;

        /* renamed from: e, reason: collision with root package name */
        public static final /* synthetic */ AllowRedisplay[] f43593e;

        /* renamed from: f, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43594f;

        /* renamed from: a, reason: collision with root package name */
        public final String f43595a;

        static {
            AllowRedisplay allowRedisplay = new AllowRedisplay("UNSPECIFIED", 0, "unspecified");
            f43590b = allowRedisplay;
            AllowRedisplay allowRedisplay2 = new AllowRedisplay("LIMITED", 1, "limited");
            f43591c = allowRedisplay2;
            AllowRedisplay allowRedisplay3 = new AllowRedisplay("ALWAYS", 2, "always");
            f43592d = allowRedisplay3;
            AllowRedisplay[] allowRedisplayArr = {allowRedisplay, allowRedisplay2, allowRedisplay3};
            f43593e = allowRedisplayArr;
            f43594f = EnumEntriesKt.a(allowRedisplayArr);
            CREATOR = new l2();
        }

        public AllowRedisplay(String str, int i5, String str2) {
            this.f43595a = str2;
        }

        public static AllowRedisplay valueOf(String str) {
            return (AllowRedisplay) Enum.valueOf(AllowRedisplay.class, str);
        }

        public static AllowRedisplay[] values() {
            return (AllowRedisplay[]) f43593e.clone();
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$AuBecsDebit;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AuBecsDebit extends TypeData {

        @NotNull
        public static final Parcelable.Creator<AuBecsDebit> CREATOR = new m2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43596a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43597b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43598c;

        public AuBecsDebit(String str, String str2, String str3) {
            this.f43596a = str;
            this.f43597b = str2;
            this.f43598c = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof AuBecsDebit)) {
                return false;
            }
            AuBecsDebit auBecsDebit = (AuBecsDebit) obj;
            return Intrinsics.b(this.f43596a, auBecsDebit.f43596a) && Intrinsics.b(this.f43597b, auBecsDebit.f43597b) && Intrinsics.b(this.f43598c, auBecsDebit.f43598c);
        }

        public final int hashCode() {
            String str = this.f43596a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43597b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43598c;
            return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
        }

        public final String toString() {
            return b.c0.q(b.c0.w("AuBecsDebit(bsbNumber=", this.f43596a, ", fingerprint=", this.f43597b, ", last4="), this.f43598c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43596a);
            dest.writeString(this.f43597b);
            dest.writeString(this.f43598c);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$BacsDebit;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class BacsDebit extends TypeData {

        @NotNull
        public static final Parcelable.Creator<BacsDebit> CREATOR = new n2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43599a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43600b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43601c;

        public BacsDebit(String str, String str2, String str3) {
            this.f43599a = str;
            this.f43600b = str2;
            this.f43601c = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BacsDebit)) {
                return false;
            }
            BacsDebit bacsDebit = (BacsDebit) obj;
            return Intrinsics.b(this.f43599a, bacsDebit.f43599a) && Intrinsics.b(this.f43600b, bacsDebit.f43600b) && Intrinsics.b(this.f43601c, bacsDebit.f43601c);
        }

        public final int hashCode() {
            String str = this.f43599a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43600b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43601c;
            return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
        }

        public final String toString() {
            return b.c0.q(b.c0.w("BacsDebit(fingerprint=", this.f43599a, ", last4=", this.f43600b, ", sortCode="), this.f43601c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43599a);
            dest.writeString(this.f43600b);
            dest.writeString(this.f43601c);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$CardPresent;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class CardPresent extends TypeData {

        @NotNull
        public static final Parcelable.Creator<CardPresent> CREATOR = new t2();

        /* renamed from: b, reason: collision with root package name */
        public static final /* synthetic */ CardPresent f43625b = new CardPresent(true);

        /* renamed from: a, reason: collision with root package name */
        public final boolean f43626a;

        public CardPresent(boolean z11) {
            this.f43626a = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof CardPresent) && this.f43626a == ((CardPresent) obj).f43626a;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f43626a);
        }

        public final String toString() {
            return a80.m.i("CardPresent(ignore=", ")", this.f43626a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f43626a ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Fpx;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Fpx extends TypeData {

        @NotNull
        public static final Parcelable.Creator<Fpx> CREATOR = new v2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43627a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43628b;

        public Fpx(String str, String str2) {
            this.f43627a = str;
            this.f43628b = str2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Fpx)) {
                return false;
            }
            Fpx fpx = (Fpx) obj;
            return Intrinsics.b(this.f43627a, fpx.f43627a) && Intrinsics.b(this.f43628b, fpx.f43628b);
        }

        public final int hashCode() {
            String str = this.f43627a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43628b;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            return b.c0.n("Fpx(bank=", this.f43627a, ", accountHolderType=", this.f43628b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43627a);
            dest.writeString(this.f43628b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Ideal;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Ideal extends TypeData {

        @NotNull
        public static final Parcelable.Creator<Ideal> CREATOR = new w2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43629a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43630b;

        public Ideal(String str, String str2) {
            this.f43629a = str;
            this.f43630b = str2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Ideal)) {
                return false;
            }
            Ideal ideal = (Ideal) obj;
            return Intrinsics.b(this.f43629a, ideal.f43629a) && Intrinsics.b(this.f43630b, ideal.f43630b);
        }

        public final int hashCode() {
            String str = this.f43629a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43630b;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            return b.c0.n("Ideal(bank=", this.f43629a, ", bankIdentifierCode=", this.f43630b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43629a);
            dest.writeString(this.f43630b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Netbanking;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Netbanking extends TypeData {

        @NotNull
        public static final Parcelable.Creator<Netbanking> CREATOR = new x2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43631a;

        public Netbanking(String str) {
            this.f43631a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Netbanking) && Intrinsics.b(this.f43631a, ((Netbanking) obj).f43631a);
        }

        public final int hashCode() {
            String str = this.f43631a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return b.c0.l("Netbanking(bank=", this.f43631a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43631a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$SepaDebit;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SepaDebit extends TypeData {

        @NotNull
        public static final Parcelable.Creator<SepaDebit> CREATOR = new y2();

        /* renamed from: a, reason: collision with root package name */
        public final String f43632a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43633b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43634c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43635d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43636e;

        public SepaDebit(String str, String str2, String str3, String str4, String str5) {
            this.f43632a = str;
            this.f43633b = str2;
            this.f43634c = str3;
            this.f43635d = str4;
            this.f43636e = str5;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SepaDebit)) {
                return false;
            }
            SepaDebit sepaDebit = (SepaDebit) obj;
            return Intrinsics.b(this.f43632a, sepaDebit.f43632a) && Intrinsics.b(this.f43633b, sepaDebit.f43633b) && Intrinsics.b(this.f43634c, sepaDebit.f43634c) && Intrinsics.b(this.f43635d, sepaDebit.f43635d) && Intrinsics.b(this.f43636e, sepaDebit.f43636e);
        }

        public final int hashCode() {
            String str = this.f43632a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43633b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43634c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43635d;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43636e;
            return iHashCode4 + (str5 != null ? str5.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("SepaDebit(bankCode=", this.f43632a, ", branchCode=", this.f43633b, ", country=");
            b.c0.D(sbW, this.f43634c, ", fingerprint=", this.f43635d, ", last4=");
            return b.c0.q(sbW, this.f43636e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43632a);
            dest.writeString(this.f43633b);
            dest.writeString(this.f43634c);
            dest.writeString(this.f43635d);
            dest.writeString(this.f43636e);
        }
    }

    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001\u0082\u0001\n\u0002\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$TypeData;", "Lcom/stripe/android/core/model/StripeModel;", "Lcom/stripe/android/model/PaymentMethod$AuBecsDebit;", "Lcom/stripe/android/model/PaymentMethod$BacsDebit;", "Lcom/stripe/android/model/PaymentMethod$Card;", "Lcom/stripe/android/model/PaymentMethod$CardPresent;", "Lcom/stripe/android/model/PaymentMethod$Fpx;", "Lcom/stripe/android/model/PaymentMethod$Ideal;", "Lcom/stripe/android/model/PaymentMethod$Netbanking;", "Lcom/stripe/android/model/PaymentMethod$SepaDebit;", "Lcom/stripe/android/model/PaymentMethod$USBankAccount;", "Lcom/stripe/android/model/PaymentMethod$Upi;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class TypeData implements StripeModel {
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$USBankAccount;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "USBankAccountHolderType", "USBankAccountType", "USBankNetworks", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class USBankAccount extends TypeData {

        @NotNull
        public static final Parcelable.Creator<USBankAccount> CREATOR = new b3();

        /* renamed from: a, reason: collision with root package name */
        public final USBankAccountHolderType f43661a;

        /* renamed from: b, reason: collision with root package name */
        public final USBankAccountType f43662b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43663c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43664d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43665e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43666f;

        /* renamed from: g, reason: collision with root package name */
        public final USBankNetworks f43667g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43668h;

        /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
        /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$USBankAccount$USBankAccountHolderType;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class USBankAccountHolderType implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<USBankAccountHolderType> CREATOR;

            /* renamed from: b, reason: collision with root package name */
            public static final USBankAccountHolderType f43669b;

            /* renamed from: c, reason: collision with root package name */
            public static final /* synthetic */ USBankAccountHolderType[] f43670c;

            /* renamed from: d, reason: collision with root package name */
            public static final /* synthetic */ i70.a f43671d;

            /* renamed from: a, reason: collision with root package name */
            public final String f43672a;

            static {
                USBankAccountHolderType uSBankAccountHolderType = new USBankAccountHolderType("UNKNOWN", 0, "unknown");
                f43669b = uSBankAccountHolderType;
                USBankAccountHolderType[] uSBankAccountHolderTypeArr = {uSBankAccountHolderType, new USBankAccountHolderType("INDIVIDUAL", 1, "individual"), new USBankAccountHolderType("COMPANY", 2, "company")};
                f43670c = uSBankAccountHolderTypeArr;
                f43671d = EnumEntriesKt.a(uSBankAccountHolderTypeArr);
                CREATOR = new c3();
            }

            public USBankAccountHolderType(String str, int i5, String str2) {
                this.f43672a = str2;
            }

            public static USBankAccountHolderType valueOf(String str) {
                return (USBankAccountHolderType) Enum.valueOf(USBankAccountHolderType.class, str);
            }

            public static USBankAccountHolderType[] values() {
                return (USBankAccountHolderType[]) f43670c.clone();
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

        /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
        /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$USBankAccount$USBankAccountType;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class USBankAccountType implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<USBankAccountType> CREATOR;

            /* renamed from: b, reason: collision with root package name */
            public static final USBankAccountType f43673b;

            /* renamed from: c, reason: collision with root package name */
            public static final /* synthetic */ USBankAccountType[] f43674c;

            /* renamed from: d, reason: collision with root package name */
            public static final /* synthetic */ i70.a f43675d;

            /* renamed from: a, reason: collision with root package name */
            public final String f43676a;

            static {
                USBankAccountType uSBankAccountType = new USBankAccountType("UNKNOWN", 0, "unknown");
                f43673b = uSBankAccountType;
                USBankAccountType[] uSBankAccountTypeArr = {uSBankAccountType, new USBankAccountType("CHECKING", 1, "checking"), new USBankAccountType("SAVINGS", 2, "savings")};
                f43674c = uSBankAccountTypeArr;
                f43675d = EnumEntriesKt.a(uSBankAccountTypeArr);
                CREATOR = new d3();
            }

            public USBankAccountType(String str, int i5, String str2) {
                this.f43676a = str2;
            }

            public static USBankAccountType valueOf(String str) {
                return (USBankAccountType) Enum.valueOf(USBankAccountType.class, str);
            }

            public static USBankAccountType[] values() {
                return (USBankAccountType[]) f43674c.clone();
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

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$USBankAccount$USBankNetworks;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class USBankNetworks implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<USBankNetworks> CREATOR = new e3();

            /* renamed from: a, reason: collision with root package name */
            public final String f43677a;

            /* renamed from: b, reason: collision with root package name */
            public final List f43678b;

            public USBankNetworks(String str, ArrayList supported) {
                Intrinsics.g(supported, "supported");
                this.f43677a = str;
                this.f43678b = supported;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof USBankNetworks)) {
                    return false;
                }
                USBankNetworks uSBankNetworks = (USBankNetworks) obj;
                return Intrinsics.b(this.f43677a, uSBankNetworks.f43677a) && Intrinsics.b(this.f43678b, uSBankNetworks.f43678b);
            }

            public final int hashCode() {
                String str = this.f43677a;
                return this.f43678b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
            }

            public final String toString() {
                return "USBankNetworks(preferred=" + this.f43677a + ", supported=" + this.f43678b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43677a);
                dest.writeStringList(this.f43678b);
            }
        }

        public USBankAccount(USBankAccountHolderType accountHolderType, USBankAccountType accountType, String str, String str2, String str3, String str4, USBankNetworks uSBankNetworks, String str5) {
            Intrinsics.g(accountHolderType, "accountHolderType");
            Intrinsics.g(accountType, "accountType");
            this.f43661a = accountHolderType;
            this.f43662b = accountType;
            this.f43663c = str;
            this.f43664d = str2;
            this.f43665e = str3;
            this.f43666f = str4;
            this.f43667g = uSBankNetworks;
            this.f43668h = str5;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof USBankAccount)) {
                return false;
            }
            USBankAccount uSBankAccount = (USBankAccount) obj;
            return this.f43661a == uSBankAccount.f43661a && this.f43662b == uSBankAccount.f43662b && Intrinsics.b(this.f43663c, uSBankAccount.f43663c) && Intrinsics.b(this.f43664d, uSBankAccount.f43664d) && Intrinsics.b(this.f43665e, uSBankAccount.f43665e) && Intrinsics.b(this.f43666f, uSBankAccount.f43666f) && Intrinsics.b(this.f43667g, uSBankAccount.f43667g) && Intrinsics.b(this.f43668h, uSBankAccount.f43668h);
        }

        public final int hashCode() {
            int iHashCode = (this.f43662b.hashCode() + (this.f43661a.hashCode() * 31)) * 31;
            String str = this.f43663c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43664d;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43665e;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43666f;
            int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
            USBankNetworks uSBankNetworks = this.f43667g;
            int iHashCode6 = (iHashCode5 + (uSBankNetworks == null ? 0 : uSBankNetworks.hashCode())) * 31;
            String str5 = this.f43668h;
            return iHashCode6 + (str5 != null ? str5.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("USBankAccount(accountHolderType=");
            sb2.append(this.f43661a);
            sb2.append(", accountType=");
            sb2.append(this.f43662b);
            sb2.append(", bankName=");
            b.c0.D(sb2, this.f43663c, ", fingerprint=", this.f43664d, ", last4=");
            b.c0.D(sb2, this.f43665e, ", financialConnectionsAccount=", this.f43666f, ", networks=");
            sb2.append(this.f43667g);
            sb2.append(", routingNumber=");
            sb2.append(this.f43668h);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f43661a.writeToParcel(dest, i5);
            this.f43662b.writeToParcel(dest, i5);
            dest.writeString(this.f43663c);
            dest.writeString(this.f43664d);
            dest.writeString(this.f43665e);
            dest.writeString(this.f43666f);
            USBankNetworks uSBankNetworks = this.f43667g;
            if (uSBankNetworks == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                uSBankNetworks.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43668h);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Upi;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Upi extends TypeData {

        @NotNull
        public static final Parcelable.Creator<Upi> CREATOR = new f3();

        /* renamed from: a, reason: collision with root package name */
        public final String f43679a;

        public Upi(String str) {
            this.f43679a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Upi) && Intrinsics.b(this.f43679a, ((Upi) obj).f43679a);
        }

        public final int hashCode() {
            String str = this.f43679a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return b.c0.l("Upi(vpa=", this.f43679a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43679a);
        }
    }

    public /* synthetic */ PaymentMethod(String str, Long l9, boolean z11, String str2, Type type, BillingDetails billingDetails, String str3, Card card, CardPresent cardPresent, Fpx fpx, Ideal ideal, SepaDebit sepaDebit, AuBecsDebit auBecsDebit, BacsDebit bacsDebit, Netbanking netbanking, USBankAccount uSBankAccount, AllowRedisplay allowRedisplay, int i5) {
        this(str, l9, z11, str2, type, (i5 & 32) != 0 ? null : billingDetails, (i5 & 64) != 0 ? null : str3, (i5 & 128) != 0 ? null : card, (i5 & 256) != 0 ? null : cardPresent, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : fpx, (i5 & 1024) != 0 ? null : ideal, (i5 & 2048) != 0 ? null : sepaDebit, (i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : auBecsDebit, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : bacsDebit, null, (32768 & i5) != 0 ? null : netbanking, (65536 & i5) != 0 ? null : uSBankAccount, null, false, (i5 & 524288) != 0 ? null : allowRedisplay);
    }

    public static PaymentMethod a(PaymentMethod paymentMethod, BillingDetails billingDetails, LinkPaymentDetails linkPaymentDetails, boolean z11, int i5) {
        USBankAccount uSBankAccount;
        LinkPaymentDetails linkPaymentDetails2;
        String id2 = paymentMethod.f43569a;
        Long l9 = paymentMethod.f43570b;
        boolean z12 = paymentMethod.f43571c;
        String str = paymentMethod.f43572d;
        Type type = paymentMethod.f43573e;
        BillingDetails billingDetails2 = (i5 & 32) != 0 ? paymentMethod.f43574f : billingDetails;
        String str2 = paymentMethod.f43575g;
        Card card = paymentMethod.f43576h;
        CardPresent cardPresent = paymentMethod.f43577i;
        Fpx fpx = paymentMethod.f43578j;
        Ideal ideal = paymentMethod.f43579k;
        SepaDebit sepaDebit = paymentMethod.f43580l;
        AuBecsDebit auBecsDebit = paymentMethod.f43581m;
        BacsDebit bacsDebit = paymentMethod.n;
        Upi upi = paymentMethod.o;
        Netbanking netbanking = paymentMethod.f43582p;
        USBankAccount uSBankAccount2 = paymentMethod.f43583q;
        if ((i5 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
            uSBankAccount = uSBankAccount2;
            linkPaymentDetails2 = paymentMethod.f43584r;
        } else {
            uSBankAccount = uSBankAccount2;
            linkPaymentDetails2 = linkPaymentDetails;
        }
        LinkPaymentDetails linkPaymentDetails3 = linkPaymentDetails2;
        boolean z13 = (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? paymentMethod.f43585s : z11;
        AllowRedisplay allowRedisplay = paymentMethod.f43586t;
        paymentMethod.getClass();
        Intrinsics.g(id2, "id");
        return new PaymentMethod(id2, l9, z12, str, type, billingDetails2, str2, card, cardPresent, fpx, ideal, sepaDebit, auBecsDebit, bacsDebit, upi, netbanking, uSBankAccount, linkPaymentDetails3, z13, allowRedisplay);
    }

    public final boolean b() {
        return this.f43584r != null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentMethod)) {
            return false;
        }
        PaymentMethod paymentMethod = (PaymentMethod) obj;
        return Intrinsics.b(this.f43569a, paymentMethod.f43569a) && Intrinsics.b(this.f43570b, paymentMethod.f43570b) && this.f43571c == paymentMethod.f43571c && Intrinsics.b(this.f43572d, paymentMethod.f43572d) && this.f43573e == paymentMethod.f43573e && Intrinsics.b(this.f43574f, paymentMethod.f43574f) && Intrinsics.b(this.f43575g, paymentMethod.f43575g) && Intrinsics.b(this.f43576h, paymentMethod.f43576h) && Intrinsics.b(this.f43577i, paymentMethod.f43577i) && Intrinsics.b(this.f43578j, paymentMethod.f43578j) && Intrinsics.b(this.f43579k, paymentMethod.f43579k) && Intrinsics.b(this.f43580l, paymentMethod.f43580l) && Intrinsics.b(this.f43581m, paymentMethod.f43581m) && Intrinsics.b(this.n, paymentMethod.n) && Intrinsics.b(this.o, paymentMethod.o) && Intrinsics.b(this.f43582p, paymentMethod.f43582p) && Intrinsics.b(this.f43583q, paymentMethod.f43583q) && Intrinsics.b(this.f43584r, paymentMethod.f43584r) && this.f43585s == paymentMethod.f43585s && this.f43586t == paymentMethod.f43586t;
    }

    public final int hashCode() {
        int iHashCode = this.f43569a.hashCode() * 31;
        Long l9 = this.f43570b;
        int iF = c9.f((iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31, 31, this.f43571c);
        String str = this.f43572d;
        int iHashCode2 = (iF + (str == null ? 0 : str.hashCode())) * 31;
        Type type = this.f43573e;
        int iHashCode3 = (iHashCode2 + (type == null ? 0 : type.hashCode())) * 31;
        BillingDetails billingDetails = this.f43574f;
        int iHashCode4 = (iHashCode3 + (billingDetails == null ? 0 : billingDetails.hashCode())) * 31;
        String str2 = this.f43575g;
        int iHashCode5 = (iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Card card = this.f43576h;
        int iHashCode6 = (iHashCode5 + (card == null ? 0 : card.hashCode())) * 31;
        CardPresent cardPresent = this.f43577i;
        int iHashCode7 = (iHashCode6 + (cardPresent == null ? 0 : Boolean.hashCode(cardPresent.f43626a))) * 31;
        Fpx fpx = this.f43578j;
        int iHashCode8 = (iHashCode7 + (fpx == null ? 0 : fpx.hashCode())) * 31;
        Ideal ideal = this.f43579k;
        int iHashCode9 = (iHashCode8 + (ideal == null ? 0 : ideal.hashCode())) * 31;
        SepaDebit sepaDebit = this.f43580l;
        int iHashCode10 = (iHashCode9 + (sepaDebit == null ? 0 : sepaDebit.hashCode())) * 31;
        AuBecsDebit auBecsDebit = this.f43581m;
        int iHashCode11 = (iHashCode10 + (auBecsDebit == null ? 0 : auBecsDebit.hashCode())) * 31;
        BacsDebit bacsDebit = this.n;
        int iHashCode12 = (iHashCode11 + (bacsDebit == null ? 0 : bacsDebit.hashCode())) * 31;
        Upi upi = this.o;
        int iHashCode13 = (iHashCode12 + (upi == null ? 0 : upi.hashCode())) * 31;
        Netbanking netbanking = this.f43582p;
        int iHashCode14 = (iHashCode13 + (netbanking == null ? 0 : netbanking.hashCode())) * 31;
        USBankAccount uSBankAccount = this.f43583q;
        int iHashCode15 = (iHashCode14 + (uSBankAccount == null ? 0 : uSBankAccount.hashCode())) * 31;
        LinkPaymentDetails linkPaymentDetails = this.f43584r;
        int iF2 = c9.f((iHashCode15 + (linkPaymentDetails == null ? 0 : linkPaymentDetails.hashCode())) * 31, 31, this.f43585s);
        AllowRedisplay allowRedisplay = this.f43586t;
        return iF2 + (allowRedisplay != null ? allowRedisplay.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PaymentMethod(id=");
        sb2.append(this.f43569a);
        sb2.append(", created=");
        sb2.append(this.f43570b);
        sb2.append(", liveMode=");
        c9.s(", code=", this.f43572d, ", type=", sb2, this.f43571c);
        sb2.append(this.f43573e);
        sb2.append(", billingDetails=");
        sb2.append(this.f43574f);
        sb2.append(", customerId=");
        sb2.append(this.f43575g);
        sb2.append(", card=");
        sb2.append(this.f43576h);
        sb2.append(", cardPresent=");
        sb2.append(this.f43577i);
        sb2.append(", fpx=");
        sb2.append(this.f43578j);
        sb2.append(", ideal=");
        sb2.append(this.f43579k);
        sb2.append(", sepaDebit=");
        sb2.append(this.f43580l);
        sb2.append(", auBecsDebit=");
        sb2.append(this.f43581m);
        sb2.append(", bacsDebit=");
        sb2.append(this.n);
        sb2.append(", upi=");
        sb2.append(this.o);
        sb2.append(", netbanking=");
        sb2.append(this.f43582p);
        sb2.append(", usBankAccount=");
        sb2.append(this.f43583q);
        sb2.append(", linkPaymentDetails=");
        sb2.append(this.f43584r);
        sb2.append(", isLinkPassthroughMode=");
        sb2.append(this.f43585s);
        sb2.append(", allowRedisplay=");
        sb2.append(this.f43586t);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43569a);
        Long l9 = this.f43570b;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeInt(this.f43571c ? 1 : 0);
        dest.writeString(this.f43572d);
        Type type = this.f43573e;
        if (type == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            type.writeToParcel(dest, i5);
        }
        BillingDetails billingDetails = this.f43574f;
        if (billingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            billingDetails.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43575g);
        Card card = this.f43576h;
        if (card == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            card.writeToParcel(dest, i5);
        }
        CardPresent cardPresent = this.f43577i;
        if (cardPresent == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            cardPresent.writeToParcel(dest, i5);
        }
        Fpx fpx = this.f43578j;
        if (fpx == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            fpx.writeToParcel(dest, i5);
        }
        Ideal ideal = this.f43579k;
        if (ideal == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            ideal.writeToParcel(dest, i5);
        }
        SepaDebit sepaDebit = this.f43580l;
        if (sepaDebit == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sepaDebit.writeToParcel(dest, i5);
        }
        AuBecsDebit auBecsDebit = this.f43581m;
        if (auBecsDebit == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            auBecsDebit.writeToParcel(dest, i5);
        }
        BacsDebit bacsDebit = this.n;
        if (bacsDebit == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            bacsDebit.writeToParcel(dest, i5);
        }
        Upi upi = this.o;
        if (upi == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            upi.writeToParcel(dest, i5);
        }
        Netbanking netbanking = this.f43582p;
        if (netbanking == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            netbanking.writeToParcel(dest, i5);
        }
        USBankAccount uSBankAccount = this.f43583q;
        if (uSBankAccount == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            uSBankAccount.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f43584r, i5);
        dest.writeInt(this.f43585s ? 1 : 0);
        AllowRedisplay allowRedisplay = this.f43586t;
        if (allowRedisplay == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            allowRedisplay.writeToParcel(dest, i5);
        }
    }

    public PaymentMethod(String id2, Long l9, boolean z11, String str, Type type, BillingDetails billingDetails, String str2, Card card, CardPresent cardPresent, Fpx fpx, Ideal ideal, SepaDebit sepaDebit, AuBecsDebit auBecsDebit, BacsDebit bacsDebit, Upi upi, Netbanking netbanking, USBankAccount uSBankAccount, LinkPaymentDetails linkPaymentDetails, boolean z12, AllowRedisplay allowRedisplay) {
        Intrinsics.g(id2, "id");
        this.f43569a = id2;
        this.f43570b = l9;
        this.f43571c = z11;
        this.f43572d = str;
        this.f43573e = type;
        this.f43574f = billingDetails;
        this.f43575g = str2;
        this.f43576h = card;
        this.f43577i = cardPresent;
        this.f43578j = fpx;
        this.f43579k = ideal;
        this.f43580l = sepaDebit;
        this.f43581m = auBecsDebit;
        this.n = bacsDebit;
        this.o = upi;
        this.f43582p = netbanking;
        this.f43583q = uSBankAccount;
        this.f43584r = linkPaymentDetails;
        this.f43585s = z12;
        this.f43586t = allowRedisplay;
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$BillingDetails;", "Lcom/stripe/android/core/model/StripeModel;", "Lcom/stripe/android/model/StripeParamsModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class BillingDetails implements StripeModel, StripeParamsModel {

        @NotNull
        public static final Parcelable.Creator<BillingDetails> CREATOR = new o2();

        /* renamed from: a, reason: collision with root package name */
        public final Address f43602a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43603b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43604c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43605d;

        public BillingDetails(Address address, String str, String str2, String str3) {
            this.f43602a = address;
            this.f43603b = str;
            this.f43604c = str2;
            this.f43605d = str3;
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
            return Intrinsics.b(this.f43602a, billingDetails.f43602a) && Intrinsics.b(this.f43603b, billingDetails.f43603b) && Intrinsics.b(this.f43604c, billingDetails.f43604c) && Intrinsics.b(this.f43605d, billingDetails.f43605d);
        }

        public final int hashCode() {
            Address address = this.f43602a;
            int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
            String str = this.f43603b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43604c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43605d;
            return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            Address address = this.f43602a;
            Map mapO = address != null ? com.google.android.gms.internal.measurement.k2.o(PlaceTypes.ADDRESS, address.k0()) : null;
            Map map = b70.h.f17594a;
            if (mapO == null) {
                mapO = map;
            }
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(map, mapO);
            String str = this.f43603b;
            Map mapN = str != null ? a80.m.n(ActionCategory.EMAIL, str) : null;
            if (mapN == null) {
                mapN = map;
            }
            LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN);
            String str2 = this.f43604c;
            Map mapN2 = str2 != null ? a80.m.n(PendingUpgradeStore.KEY_NAME, str2) : null;
            if (mapN2 == null) {
                mapN2 = map;
            }
            LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapN2);
            String str3 = this.f43605d;
            Map mapN3 = str3 != null ? a80.m.n("phone", str3) : null;
            if (mapN3 != null) {
                map = mapN3;
            }
            return MapsKt.m0(linkedHashMapM03, map);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("BillingDetails(address=");
            sb2.append(this.f43602a);
            sb2.append(", email=");
            sb2.append(this.f43603b);
            sb2.append(", name=");
            return b.c0.s(sb2, this.f43604c, ", phone=", this.f43605d, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f43602a, i5);
            dest.writeString(this.f43603b);
            dest.writeString(this.f43604c);
            dest.writeString(this.f43605d);
        }

        public /* synthetic */ BillingDetails(String str, String str2, int i5) {
            this(null, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? null : str2, null);
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0002\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Type;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "com/stripe/android/model/z2", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Type implements Parcelable {
        public static final Type A;
        public static final Type B;
        public static final Type C;

        @NotNull
        public static final Parcelable.Creator<Type> CREATOR;
        public static final Type D;
        public static final Type E;
        public static final Type F;
        public static final Type G;
        public static final Type H;
        public static final Type I;
        public static final Type J;
        public static final Type K;
        public static final Type L;
        public static final Type M;
        public static final Type N;
        public static final Type O;
        public static final Type P;
        public static final Type Q;
        public static final Type R;
        public static final Type S;
        public static final Type T;
        public static final /* synthetic */ Type[] U;
        public static final /* synthetic */ i70.a V;

        /* renamed from: g, reason: collision with root package name */
        public static final z2 f43637g;

        /* renamed from: h, reason: collision with root package name */
        public static final Type f43638h;

        /* renamed from: i, reason: collision with root package name */
        public static final Type f43639i;

        /* renamed from: j, reason: collision with root package name */
        public static final Type f43640j;

        /* renamed from: k, reason: collision with root package name */
        public static final Type f43641k;

        /* renamed from: l, reason: collision with root package name */
        public static final Type f43642l;

        /* renamed from: m, reason: collision with root package name */
        public static final Type f43643m;
        public static final Type n;
        public static final Type o;

        /* renamed from: p, reason: collision with root package name */
        public static final Type f43644p;

        /* renamed from: q, reason: collision with root package name */
        public static final Type f43645q;

        /* renamed from: r, reason: collision with root package name */
        public static final Type f43646r;

        /* renamed from: s, reason: collision with root package name */
        public static final Type f43647s;

        /* renamed from: t, reason: collision with root package name */
        public static final Type f43648t;

        /* renamed from: u, reason: collision with root package name */
        public static final Type f43649u;

        /* renamed from: v, reason: collision with root package name */
        public static final Type f43650v;

        /* renamed from: w, reason: collision with root package name */
        public static final Type f43651w;

        /* renamed from: x, reason: collision with root package name */
        public static final Type f43652x;

        /* renamed from: y, reason: collision with root package name */
        public static final Type f43653y;

        /* renamed from: z, reason: collision with root package name */
        public static final Type f43654z;

        /* renamed from: a, reason: collision with root package name */
        public final String f43655a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f43656b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f43657c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f43658d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f43659e;

        /* renamed from: f, reason: collision with root package name */
        public final AfterRedirectAction f43660f;

        static {
            boolean z11 = false;
            Type type = new Type("Link", 0, "link", false, true, true, z11);
            f43638h = type;
            boolean z12 = false;
            boolean z13 = false;
            Type type2 = new Type("Card", 1, "card", false, z13, z11, z12);
            f43639i = type2;
            boolean z14 = false;
            Type type3 = new Type("CardPresent", 2, "card_present", z13, z11, z12, z14);
            boolean z15 = false;
            Type type4 = new Type("Fpx", 3, "fpx", z11, z12, z14, z15);
            f43640j = type4;
            Type type5 = new Type("Ideal", 4, "ideal", z12, true, z15, false);
            f43641k = type5;
            boolean z16 = true;
            boolean z17 = true;
            Type type6 = new Type("SepaDebit", 5, "sepa_debit", false, true, z16, z17);
            f43642l = type6;
            boolean z18 = true;
            Type type7 = new Type("AuBecsDebit", 6, "au_becs_debit", false, z16, z17, z18);
            f43643m = type7;
            Type type8 = new Type("BacsDebit", 7, "bacs_debit", false, z17, z18, true);
            n = type8;
            AfterRedirectAction.Refresh refresh = AfterRedirectAction.Refresh.f43589a;
            Type type9 = new Type("Upi", 8, "upi", false, false, false, false, refresh);
            o = type9;
            Type type10 = new Type("P24", 9, "p24", false, false, false, false, new AfterRedirectAction.Poll(5000L));
            f43644p = type10;
            boolean z19 = false;
            Type type11 = new Type("Bancontact", 10, "bancontact", false, true, true, z19);
            f43645q = type11;
            boolean z21 = false;
            Type type12 = new Type("Eps", 11, "eps", false, false, z19, z21);
            f43646r = type12;
            Type type13 = new Type("Oxxo", 12, "oxxo", true, z19, z21, true);
            f43647s = type13;
            boolean z22 = false;
            boolean z23 = false;
            Type type14 = new Type("Alipay", 13, "alipay", z19, z21, z22, z23);
            f43648t = type14;
            boolean z24 = false;
            Type type15 = new Type("GrabPay", 14, "grabpay", z21, z22, z23, z24);
            f43649u = type15;
            boolean z25 = false;
            Type type16 = new Type("PayPal", 15, "paypal", z22, true, z24, z25);
            f43650v = type16;
            boolean z26 = false;
            boolean z27 = false;
            Type type17 = new Type("AfterpayClearpay", 16, "afterpay_clearpay", z27, z24, z25, z26);
            f43651w = type17;
            Type type18 = new Type("Netbanking", 17, "netbanking", z27, z24, z25, z26);
            Type type19 = new Type("Blik", 18, "blik", z27, z24, z25, z26);
            f43652x = type19;
            Type type20 = new Type("WeChatPay", 19, "wechat_pay", false, false, false, false, new AfterRedirectAction.Poll(15000L));
            f43653y = type20;
            boolean z28 = false;
            Type type21 = new Type("Klarna", 20, "klarna", false, true, false, false, refresh);
            f43654z = type21;
            boolean z29 = false;
            Type type22 = new Type("Affirm", 21, "affirm", z28, z29, z25, z26);
            A = type22;
            Type type23 = new Type("RevolutPay", 22, "revolut_pay", false, true, false, false, new AfterRedirectAction.Poll(5000L));
            B = type23;
            boolean z31 = false;
            Type type24 = new Type("Sunbit", 23, "sunbit", z28, z29, z25, z31);
            C = type24;
            Type type25 = new Type("Billie", 24, "billie", z28, z29, z25, z31);
            D = type25;
            Type type26 = new Type("Satispay", 25, "satispay", z28, true, z25, z31);
            E = type26;
            boolean z32 = false;
            Type type27 = new Type("Crypto", 26, "crypto", z28, z32, z25, z31);
            F = type27;
            Type type28 = new Type("AmazonPay", 27, "amazon_pay", false, true, false, false, new AfterRedirectAction.Poll(5000L));
            G = type28;
            Type type29 = new Type("Alma", 28, "alma", z28, z32, z25, z31);
            H = type29;
            Type type30 = new Type("MobilePay", 29, "mobilepay", z28, z32, z25, z31);
            I = type30;
            Type type31 = new Type("Multibanco", 30, "multibanco", true, z32, z25, true);
            J = type31;
            boolean z33 = false;
            Type type32 = new Type("Zip", 31, "zip", z33, z32, z25, false);
            K = type32;
            boolean z34 = true;
            Type type33 = new Type("USBankAccount", 32, "us_bank_account", z33, z34, true, true);
            L = type33;
            Type type34 = new Type("CashAppPay", 33, "cashapp", false, true, false, false, refresh);
            M = type34;
            Type type35 = new Type("Boleto", 34, "boleto", z34, false, false, true);
            N = type35;
            String str = "Konbini";
            int i5 = 35;
            String str2 = "konbini";
            Type type36 = new Type(str, i5, str2, true, false, false, true);
            O = type36;
            Type type37 = new Type("Swish", 36, "swish", false, false, false, false, new AfterRedirectAction.Poll(5000L));
            P = type37;
            boolean z35 = false;
            Type type38 = new Type("Twint", 37, "twint", false, false, false, false, new AfterRedirectAction.Poll(5000L));
            Q = type38;
            boolean z36 = false;
            Type type39 = new Type("ShopPay", 38, "shop_pay", false, false, z35, z36);
            boolean z37 = false;
            Type type40 = new Type("PayNow", 39, "paynow", true, z35, z36, z37);
            R = type40;
            Type type41 = new Type("PayPay", 40, "paypay", false, false, false, false, new AfterRedirectAction.Poll(5000L));
            S = type41;
            Type type42 = new Type("PromptPay", 41, "promptpay", true, z37, false, false);
            T = type42;
            Type[] typeArr = {type, type2, type3, type4, type5, type6, type7, type8, type9, type10, type11, type12, type13, type14, type15, type16, type17, type18, type19, type20, type21, type22, type23, type24, type25, type26, type27, type28, type29, type30, type31, type32, type33, type34, type35, type36, type37, type38, type39, type40, type41, type42};
            U = typeArr;
            V = EnumEntriesKt.a(typeArr);
            f43637g = new z2();
            CREATOR = new a3();
        }

        public Type(String str, int i5, String str2, boolean z11, boolean z12, boolean z13, boolean z14, AfterRedirectAction afterRedirectAction) {
            this.f43655a = str2;
            this.f43656b = z11;
            this.f43657c = z12;
            this.f43658d = z13;
            this.f43659e = z14;
            this.f43660f = afterRedirectAction;
        }

        public static Type valueOf(String str) {
            return (Type) Enum.valueOf(Type.class, str);
        }

        public static Type[] values() {
            return (Type[]) U.clone();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // java.lang.Enum
        public final String toString() {
            return this.f43655a;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(name());
        }

        public /* synthetic */ Type(String str, int i5, String str2, boolean z11, boolean z12, boolean z13, boolean z14) {
            this(str, i5, str2, z11, z12, z13, z14, AfterRedirectAction.None.f43587a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Card;", "Lcom/stripe/android/model/PaymentMethod$TypeData;", "Checks", "ThreeDSecureUsage", "Networks", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Card extends TypeData {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new q2();

        /* renamed from: a, reason: collision with root package name */
        public final ft.b f43606a;

        /* renamed from: b, reason: collision with root package name */
        public final Checks f43607b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43608c;

        /* renamed from: d, reason: collision with root package name */
        public final Integer f43609d;

        /* renamed from: e, reason: collision with root package name */
        public final Integer f43610e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43611f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43612g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43613h;

        /* renamed from: i, reason: collision with root package name */
        public final ThreeDSecureUsage f43614i;

        /* renamed from: j, reason: collision with root package name */
        public final Wallet f43615j;

        /* renamed from: k, reason: collision with root package name */
        public final Networks f43616k;

        /* renamed from: l, reason: collision with root package name */
        public final String f43617l;

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Card$Checks;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Checks implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<Checks> CREATOR = new p2();

            /* renamed from: a, reason: collision with root package name */
            public final String f43618a;

            /* renamed from: b, reason: collision with root package name */
            public final String f43619b;

            /* renamed from: c, reason: collision with root package name */
            public final String f43620c;

            public Checks(String str, String str2, String str3) {
                this.f43618a = str;
                this.f43619b = str2;
                this.f43620c = str3;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Checks)) {
                    return false;
                }
                Checks checks = (Checks) obj;
                return Intrinsics.b(this.f43618a, checks.f43618a) && Intrinsics.b(this.f43619b, checks.f43619b) && Intrinsics.b(this.f43620c, checks.f43620c);
            }

            public final int hashCode() {
                String str = this.f43618a;
                int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
                String str2 = this.f43619b;
                int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
                String str3 = this.f43620c;
                return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
            }

            public final String toString() {
                return b.c0.q(b.c0.w("Checks(addressLine1Check=", this.f43618a, ", addressPostalCodeCheck=", this.f43619b, ", cvcCheck="), this.f43620c, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43618a);
                dest.writeString(this.f43619b);
                dest.writeString(this.f43620c);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Card$Networks;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Networks implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<Networks> CREATOR = new r2();

            /* renamed from: a, reason: collision with root package name */
            public final Set f43621a;

            /* renamed from: b, reason: collision with root package name */
            public final boolean f43622b;

            /* renamed from: c, reason: collision with root package name */
            public final String f43623c;

            public Networks(Set available, boolean z11, String str) {
                Intrinsics.g(available, "available");
                this.f43621a = available;
                this.f43622b = z11;
                this.f43623c = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Networks)) {
                    return false;
                }
                Networks networks = (Networks) obj;
                return Intrinsics.b(this.f43621a, networks.f43621a) && this.f43622b == networks.f43622b && Intrinsics.b(this.f43623c, networks.f43623c);
            }

            public final int hashCode() {
                int iF = c9.f(this.f43621a.hashCode() * 31, 31, this.f43622b);
                String str = this.f43623c;
                return iF + (str == null ? 0 : str.hashCode());
            }

            public final String toString() {
                StringBuilder sb2 = new StringBuilder("Networks(available=");
                sb2.append(this.f43621a);
                sb2.append(", selectionMandatory=");
                sb2.append(this.f43622b);
                sb2.append(", preferred=");
                return b.c0.q(sb2, this.f43623c, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                Set set = this.f43621a;
                dest.writeInt(set.size());
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
                dest.writeInt(this.f43622b ? 1 : 0);
                dest.writeString(this.f43623c);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethod$Card$ThreeDSecureUsage;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class ThreeDSecureUsage implements StripeModel {

            @NotNull
            public static final Parcelable.Creator<ThreeDSecureUsage> CREATOR = new s2();

            /* renamed from: a, reason: collision with root package name */
            public final boolean f43624a;

            public ThreeDSecureUsage(boolean z11) {
                this.f43624a = z11;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof ThreeDSecureUsage) && this.f43624a == ((ThreeDSecureUsage) obj).f43624a;
            }

            public final int hashCode() {
                return Boolean.hashCode(this.f43624a);
            }

            public final String toString() {
                return a80.m.i("ThreeDSecureUsage(isSupported=", ")", this.f43624a);
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(this.f43624a ? 1 : 0);
            }
        }

        public Card(ft.b brand, Checks checks, String str, Integer num, Integer num2, String str2, String str3, String str4, ThreeDSecureUsage threeDSecureUsage, Wallet wallet, Networks networks, String str5) {
            Intrinsics.g(brand, "brand");
            this.f43606a = brand;
            this.f43607b = checks;
            this.f43608c = str;
            this.f43609d = num;
            this.f43610e = num2;
            this.f43611f = str2;
            this.f43612g = str3;
            this.f43613h = str4;
            this.f43614i = threeDSecureUsage;
            this.f43615j = wallet;
            this.f43616k = networks;
            this.f43617l = str5;
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
            return this.f43606a == card.f43606a && Intrinsics.b(this.f43607b, card.f43607b) && Intrinsics.b(this.f43608c, card.f43608c) && Intrinsics.b(this.f43609d, card.f43609d) && Intrinsics.b(this.f43610e, card.f43610e) && Intrinsics.b(this.f43611f, card.f43611f) && Intrinsics.b(this.f43612g, card.f43612g) && Intrinsics.b(this.f43613h, card.f43613h) && Intrinsics.b(this.f43614i, card.f43614i) && Intrinsics.b(this.f43615j, card.f43615j) && Intrinsics.b(this.f43616k, card.f43616k) && Intrinsics.b(this.f43617l, card.f43617l);
        }

        public final int hashCode() {
            int iHashCode = this.f43606a.hashCode() * 31;
            Checks checks = this.f43607b;
            int iHashCode2 = (iHashCode + (checks == null ? 0 : checks.hashCode())) * 31;
            String str = this.f43608c;
            int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
            Integer num = this.f43609d;
            int iHashCode4 = (iHashCode3 + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.f43610e;
            int iHashCode5 = (iHashCode4 + (num2 == null ? 0 : num2.hashCode())) * 31;
            String str2 = this.f43611f;
            int iHashCode6 = (iHashCode5 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43612g;
            int iHashCode7 = (iHashCode6 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43613h;
            int iHashCode8 = (iHashCode7 + (str4 == null ? 0 : str4.hashCode())) * 31;
            ThreeDSecureUsage threeDSecureUsage = this.f43614i;
            int iHashCode9 = (iHashCode8 + (threeDSecureUsage == null ? 0 : Boolean.hashCode(threeDSecureUsage.f43624a))) * 31;
            Wallet wallet = this.f43615j;
            int iHashCode10 = (iHashCode9 + (wallet == null ? 0 : wallet.hashCode())) * 31;
            Networks networks = this.f43616k;
            int iHashCode11 = (iHashCode10 + (networks == null ? 0 : networks.hashCode())) * 31;
            String str5 = this.f43617l;
            return iHashCode11 + (str5 != null ? str5.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Card(brand=");
            sb2.append(this.f43606a);
            sb2.append(", checks=");
            sb2.append(this.f43607b);
            sb2.append(", country=");
            sb2.append(this.f43608c);
            sb2.append(", expiryMonth=");
            sb2.append(this.f43609d);
            sb2.append(", expiryYear=");
            sb2.append(this.f43610e);
            sb2.append(", fingerprint=");
            sb2.append(this.f43611f);
            sb2.append(", funding=");
            b.c0.D(sb2, this.f43612g, ", last4=", this.f43613h, ", threeDSecureUsage=");
            sb2.append(this.f43614i);
            sb2.append(", wallet=");
            sb2.append(this.f43615j);
            sb2.append(", networks=");
            sb2.append(this.f43616k);
            sb2.append(", displayBrand=");
            sb2.append(this.f43617l);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43606a.name());
            Checks checks = this.f43607b;
            if (checks == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                checks.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43608c);
            Integer num = this.f43609d;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            Integer num2 = this.f43610e;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
            dest.writeString(this.f43611f);
            dest.writeString(this.f43612g);
            dest.writeString(this.f43613h);
            ThreeDSecureUsage threeDSecureUsage = this.f43614i;
            if (threeDSecureUsage == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                threeDSecureUsage.writeToParcel(dest, i5);
            }
            dest.writeParcelable(this.f43615j, i5);
            Networks networks = this.f43616k;
            if (networks == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                networks.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43617l);
        }

        public /* synthetic */ Card(ft.b bVar) {
            this(bVar, null, null, null, null, null, null, "4242", null, null, null, null);
        }
    }
}
