package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0004\u0004\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsSession;", "Lcom/stripe/android/core/model/StripeModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Status", "StatusDetails", "com/stripe/android/financialconnections/model/s", "xr/l", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class FinancialConnectionsSession implements StripeModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f42735a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42736b;

    /* renamed from: c, reason: collision with root package name */
    public final FinancialConnectionsAccountList f42737c;

    /* renamed from: d, reason: collision with root package name */
    public final FinancialConnectionsAccountList f42738d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f42739e;

    /* renamed from: f, reason: collision with root package name */
    public final PaymentAccount f42740f;

    /* renamed from: g, reason: collision with root package name */
    public final String f42741g;

    /* renamed from: h, reason: collision with root package name */
    public final String f42742h;

    /* renamed from: i, reason: collision with root package name */
    public final ManualEntry f42743i;

    /* renamed from: j, reason: collision with root package name */
    public final Status f42744j;

    /* renamed from: k, reason: collision with root package name */
    public final StatusDetails f42745k;

    @NotNull
    public static final xr.l Companion = new xr.l();

    @NotNull
    public static final Parcelable.Creator<FinancialConnectionsSession> CREATOR = new t();

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u000f\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsSession$Status;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/v", "com/stripe/android/financialconnections/model/u", "PENDING", "SUCCEEDED", "CANCELED", "FAILED", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable(with = v.class)
    public static final class Status {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Status[] $VALUES;

        @NotNull
        public static final u Companion;

        @NotNull
        private final String value;

        @SerialName("pending")
        public static final Status PENDING = new Status("PENDING", 0, "pending");

        @SerialName("succeeded")
        public static final Status SUCCEEDED = new Status("SUCCEEDED", 1, "succeeded");

        @SerialName("canceled")
        public static final Status CANCELED = new Status("CANCELED", 2, "canceled");

        @SerialName("failed")
        public static final Status FAILED = new Status("FAILED", 3, "failed");

        @SerialName("unknown")
        public static final Status UNKNOWN = new Status("UNKNOWN", 4, "unknown");

        private static final /* synthetic */ Status[] $values() {
            return new Status[]{PENDING, SUCCEEDED, CANCELED, FAILED, UNKNOWN};
        }

        static {
            Status[] statusArr$values = $values();
            $VALUES = statusArr$values;
            $ENTRIES = EnumEntriesKt.a(statusArr$values);
            Companion = new u();
        }

        private Status(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<Status> getEntries() {
            return $ENTRIES;
        }

        public static Status valueOf(String str) {
            return (Status) Enum.valueOf(Status.class, str);
        }

        public static Status[] values() {
            return (Status[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsSession$StatusDetails;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Cancelled", "com/stripe/android/financialconnections/model/w", "com/stripe/android/financialconnections/model/c0", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final /* data */ class StatusDetails implements Parcelable {

        /* renamed from: a, reason: collision with root package name */
        public final Cancelled f42746a;

        @NotNull
        public static final c0 Companion = new c0();

        @NotNull
        public static final Parcelable.Creator<StatusDetails> CREATOR = new d0();

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsSession$StatusDetails$Cancelled;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Reason", "com/stripe/android/financialconnections/model/x", "com/stripe/android/financialconnections/model/y", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        @Serializable
        public static final /* data */ class Cancelled implements Parcelable {

            /* renamed from: a, reason: collision with root package name */
            public final Reason f42747a;

            @NotNull
            public static final y Companion = new y();

            @NotNull
            public static final Parcelable.Creator<Cancelled> CREATOR = new z();

            /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
            /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
            @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\r\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsSession$StatusDetails$Cancelled$Reason;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/b0", "com/stripe/android/financialconnections/model/a0", "CUSTOM_MANUAL_ENTRY", NativeAdContent.ViewTag.OTHER, "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            @Serializable(with = b0.class)
            public static final class Reason {
                private static final /* synthetic */ EnumEntries $ENTRIES;
                private static final /* synthetic */ Reason[] $VALUES;

                @NotNull
                public static final a0 Companion;

                @NotNull
                private final String value;

                @SerialName("custom_manual_entry")
                public static final Reason CUSTOM_MANUAL_ENTRY = new Reason("CUSTOM_MANUAL_ENTRY", 0, "custom_manual_entry");

                @SerialName(InneractiveMediationNameConsts.OTHER)
                public static final Reason OTHER = new Reason(NativeAdContent.ViewTag.OTHER, 1, InneractiveMediationNameConsts.OTHER);

                @SerialName("unknown")
                public static final Reason UNKNOWN = new Reason("UNKNOWN", 2, "unknown");

                private static final /* synthetic */ Reason[] $values() {
                    return new Reason[]{CUSTOM_MANUAL_ENTRY, OTHER, UNKNOWN};
                }

                static {
                    Reason[] reasonArr$values = $values();
                    $VALUES = reasonArr$values;
                    $ENTRIES = EnumEntriesKt.a(reasonArr$values);
                    Companion = new a0();
                }

                private Reason(String str, int i5, String str2) {
                    this.value = str2;
                }

                @NotNull
                public static EnumEntries<Reason> getEntries() {
                    return $ENTRIES;
                }

                public static Reason valueOf(String str) {
                    return (Reason) Enum.valueOf(Reason.class, str);
                }

                public static Reason[] values() {
                    return (Reason[]) $VALUES.clone();
                }

                @NotNull
                public final String getValue() {
                    return this.value;
                }
            }

            public /* synthetic */ Cancelled(int i5, Reason reason) {
                if (1 != (i5 & 1)) {
                    PluginExceptionsKt.throwMissingFieldException(i5, 1, x.f42765a.getDescriptor());
                }
                this.f42747a = reason;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof Cancelled) && this.f42747a == ((Cancelled) obj).f42747a;
            }

            public final int hashCode() {
                return this.f42747a.hashCode();
            }

            public final String toString() {
                return "Cancelled(reason=" + this.f42747a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f42747a.name());
            }

            public Cancelled(Reason reason) {
                Intrinsics.g(reason, "reason");
                this.f42747a = reason;
            }
        }

        public /* synthetic */ StatusDetails(int i5, Cancelled cancelled) {
            if ((i5 & 1) == 0) {
                this.f42746a = null;
            } else {
                this.f42746a = cancelled;
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
            return (obj instanceof StatusDetails) && Intrinsics.b(this.f42746a, ((StatusDetails) obj).f42746a);
        }

        public final int hashCode() {
            Cancelled cancelled = this.f42746a;
            if (cancelled == null) {
                return 0;
            }
            return cancelled.f42747a.hashCode();
        }

        public final String toString() {
            return "StatusDetails(cancelled=" + this.f42746a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Cancelled cancelled = this.f42746a;
            if (cancelled == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                cancelled.writeToParcel(dest, i5);
            }
        }

        public StatusDetails(Cancelled cancelled) {
            this.f42746a = cancelled;
        }
    }

    public /* synthetic */ FinancialConnectionsSession(int i5, String str, String str2, FinancialConnectionsAccountList financialConnectionsAccountList, FinancialConnectionsAccountList financialConnectionsAccountList2, boolean z11, PaymentAccount paymentAccount, String str3, String str4, ManualEntry manualEntry, Status status, StatusDetails statusDetails) {
        if (19 != (i5 & 19)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 19, s.f42762a.getDescriptor());
        }
        this.f42735a = str;
        this.f42736b = str2;
        if ((i5 & 4) == 0) {
            this.f42737c = null;
        } else {
            this.f42737c = financialConnectionsAccountList;
        }
        if ((i5 & 8) == 0) {
            this.f42738d = null;
        } else {
            this.f42738d = financialConnectionsAccountList2;
        }
        this.f42739e = z11;
        if ((i5 & 32) == 0) {
            this.f42740f = null;
        } else {
            this.f42740f = paymentAccount;
        }
        if ((i5 & 64) == 0) {
            this.f42741g = null;
        } else {
            this.f42741g = str3;
        }
        if ((i5 & 128) == 0) {
            this.f42742h = null;
        } else {
            this.f42742h = str4;
        }
        if ((i5 & 256) == 0) {
            this.f42743i = null;
        } else {
            this.f42743i = manualEntry;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f42744j = null;
        } else {
            this.f42744j = status;
        }
        if ((i5 & 1024) == 0) {
            this.f42745k = null;
        } else {
            this.f42745k = statusDetails;
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
        if (!(obj instanceof FinancialConnectionsSession)) {
            return false;
        }
        FinancialConnectionsSession financialConnectionsSession = (FinancialConnectionsSession) obj;
        return Intrinsics.b(this.f42735a, financialConnectionsSession.f42735a) && Intrinsics.b(this.f42736b, financialConnectionsSession.f42736b) && Intrinsics.b(this.f42737c, financialConnectionsSession.f42737c) && Intrinsics.b(this.f42738d, financialConnectionsSession.f42738d) && this.f42739e == financialConnectionsSession.f42739e && Intrinsics.b(this.f42740f, financialConnectionsSession.f42740f) && Intrinsics.b(this.f42741g, financialConnectionsSession.f42741g) && Intrinsics.b(this.f42742h, financialConnectionsSession.f42742h) && Intrinsics.b(this.f42743i, financialConnectionsSession.f42743i) && this.f42744j == financialConnectionsSession.f42744j && Intrinsics.b(this.f42745k, financialConnectionsSession.f42745k);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f42735a.hashCode() * 31, 31, this.f42736b);
        FinancialConnectionsAccountList financialConnectionsAccountList = this.f42737c;
        int iHashCode = (iE + (financialConnectionsAccountList == null ? 0 : financialConnectionsAccountList.hashCode())) * 31;
        FinancialConnectionsAccountList financialConnectionsAccountList2 = this.f42738d;
        int iF = c9.f((iHashCode + (financialConnectionsAccountList2 == null ? 0 : financialConnectionsAccountList2.hashCode())) * 31, 31, this.f42739e);
        PaymentAccount paymentAccount = this.f42740f;
        int iHashCode2 = (iF + (paymentAccount == null ? 0 : paymentAccount.hashCode())) * 31;
        String str = this.f42741g;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42742h;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        ManualEntry manualEntry = this.f42743i;
        int iHashCode5 = (iHashCode4 + (manualEntry == null ? 0 : manualEntry.f42748a.hashCode())) * 31;
        Status status = this.f42744j;
        int iHashCode6 = (iHashCode5 + (status == null ? 0 : status.hashCode())) * 31;
        StatusDetails statusDetails = this.f42745k;
        return iHashCode6 + (statusDetails != null ? statusDetails.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("FinancialConnectionsSession(clientSecret=", this.f42735a, ", id=", this.f42736b, ", accountsOld=");
        sbW.append(this.f42737c);
        sbW.append(", accountsNew=");
        sbW.append(this.f42738d);
        sbW.append(", livemode=");
        sbW.append(this.f42739e);
        sbW.append(", paymentAccount=");
        sbW.append(this.f42740f);
        sbW.append(", returnUrl=");
        b.c0.D(sbW, this.f42741g, ", bankAccountToken=", this.f42742h, ", manualEntry=");
        sbW.append(this.f42743i);
        sbW.append(", status=");
        sbW.append(this.f42744j);
        sbW.append(", statusDetails=");
        sbW.append(this.f42745k);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42735a);
        dest.writeString(this.f42736b);
        FinancialConnectionsAccountList financialConnectionsAccountList = this.f42737c;
        if (financialConnectionsAccountList == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            financialConnectionsAccountList.writeToParcel(dest, i5);
        }
        FinancialConnectionsAccountList financialConnectionsAccountList2 = this.f42738d;
        if (financialConnectionsAccountList2 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            financialConnectionsAccountList2.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f42739e ? 1 : 0);
        dest.writeParcelable(this.f42740f, i5);
        dest.writeString(this.f42741g);
        dest.writeString(this.f42742h);
        ManualEntry manualEntry = this.f42743i;
        if (manualEntry == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            manualEntry.writeToParcel(dest, i5);
        }
        Status status = this.f42744j;
        if (status == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(status.name());
        }
        StatusDetails statusDetails = this.f42745k;
        if (statusDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            statusDetails.writeToParcel(dest, i5);
        }
    }

    public FinancialConnectionsSession(String clientSecret, String id2, FinancialConnectionsAccountList financialConnectionsAccountList, FinancialConnectionsAccountList financialConnectionsAccountList2, boolean z11, PaymentAccount paymentAccount, String str, String str2, ManualEntry manualEntry, Status status, StatusDetails statusDetails) {
        Intrinsics.g(clientSecret, "clientSecret");
        Intrinsics.g(id2, "id");
        this.f42735a = clientSecret;
        this.f42736b = id2;
        this.f42737c = financialConnectionsAccountList;
        this.f42738d = financialConnectionsAccountList2;
        this.f42739e = z11;
        this.f42740f = paymentAccount;
        this.f42741g = str;
        this.f42742h = str2;
        this.f42743i = manualEntry;
        this.f42744j = status;
        this.f42745k = statusDetails;
    }
}
