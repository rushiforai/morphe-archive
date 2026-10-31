package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.lang.annotation.Annotation;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/financialconnections/model/OwnershipRefresh;", "Landroid/os/Parcelable;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Status", "com/stripe/android/financialconnections/model/e0", "xr/q", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class OwnershipRefresh implements Parcelable, StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final int f42750a;

    /* renamed from: b, reason: collision with root package name */
    public final Status f42751b;

    @NotNull
    public static final xr.q Companion = new xr.q();

    @NotNull
    public static final Parcelable.Creator<OwnershipRefresh> CREATOR = new f0();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f42749c = {null, Status.Companion.serializer()};

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\r\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/stripe/android/financialconnections/model/OwnershipRefresh$Status;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/g0", "FAILED", "PENDING", "SUCCEEDED", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final class Status {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Status[] $VALUES;

        @NotNull
        private static final Lazy<KSerializer<Object>> $cachedSerializer$delegate;

        @NotNull
        public static final g0 Companion;

        @SerialName("failed")
        public static final Status FAILED = new Status("FAILED", 0, "failed");

        @SerialName("pending")
        public static final Status PENDING = new Status("PENDING", 1, "pending");

        @SerialName("succeeded")
        public static final Status SUCCEEDED = new Status("SUCCEEDED", 2, "succeeded");
        public static final Status UNKNOWN = new Status("UNKNOWN", 3, "unknown");

        @NotNull
        private final String value;

        private static final /* synthetic */ Status[] $values() {
            return new Status[]{FAILED, PENDING, SUCCEEDED, UNKNOWN};
        }

        static {
            Status[] statusArr$values = $values();
            $VALUES = statusArr$values;
            $ENTRIES = EnumEntriesKt.a(statusArr$values);
            Companion = new g0();
            $cachedSerializer$delegate = LazyKt.b(LazyThreadSafetyMode.f71680b, new ww.e(7));
        }

        private Status(String str, int i5, String str2) {
            this.value = str2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final /* synthetic */ KSerializer _init_$_anonymous_() {
            return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.financialconnections.model.OwnershipRefresh.Status", values(), new String[]{"failed", "pending", "succeeded", null}, new Annotation[][]{null, null, null, null}, null);
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

    public /* synthetic */ OwnershipRefresh(int i5, int i11, Status status) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, e0.f42755a.getDescriptor());
        }
        this.f42750a = i11;
        if ((i5 & 2) == 0) {
            this.f42751b = Status.UNKNOWN;
        } else {
            this.f42751b = status;
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
        if (!(obj instanceof OwnershipRefresh)) {
            return false;
        }
        OwnershipRefresh ownershipRefresh = (OwnershipRefresh) obj;
        return this.f42750a == ownershipRefresh.f42750a && this.f42751b == ownershipRefresh.f42751b;
    }

    public final int hashCode() {
        return this.f42751b.hashCode() + (Integer.hashCode(this.f42750a) * 31);
    }

    public final String toString() {
        return "OwnershipRefresh(lastAttemptedAt=" + this.f42750a + ", status=" + this.f42751b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42750a);
        dest.writeString(this.f42751b.name());
    }

    public OwnershipRefresh(int i5, Status status) {
        Intrinsics.g(status, "status");
        this.f42750a = i5;
        this.f42751b = status;
    }
}
