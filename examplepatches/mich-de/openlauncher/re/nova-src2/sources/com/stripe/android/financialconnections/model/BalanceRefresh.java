package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import com.tiktok.appevents.edp.TTEDPEventConstants;
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

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/financialconnections/model/BalanceRefresh;", "Lcom/stripe/android/core/model/StripeModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "BalanceRefreshStatus", "com/stripe/android/financialconnections/model/d", "xr/b", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class BalanceRefresh implements StripeModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final BalanceRefreshStatus f42703a;

    /* renamed from: b, reason: collision with root package name */
    public final int f42704b;

    @NotNull
    public static final xr.b Companion = new xr.b();

    @NotNull
    public static final Parcelable.Creator<BalanceRefresh> CREATOR = new f();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f42702c = {BalanceRefreshStatus.Companion.serializer(), null};

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\r\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u001a\u0010\u0003\u001a\u00020\u00028\u0000X\u0080\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/stripe/android/financialconnections/model/BalanceRefresh$BalanceRefreshStatus;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getCode$financial_connections_core_release", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/e", "FAILED", "PENDING", "SUCCEEDED", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final class BalanceRefreshStatus {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ BalanceRefreshStatus[] $VALUES;

        @NotNull
        private static final Lazy<KSerializer<Object>> $cachedSerializer$delegate;

        @NotNull
        public static final e Companion;

        @SerialName("failed")
        public static final BalanceRefreshStatus FAILED = new BalanceRefreshStatus("FAILED", 0, "failed");

        @SerialName("pending")
        public static final BalanceRefreshStatus PENDING = new BalanceRefreshStatus("PENDING", 1, "pending");

        @SerialName("succeeded")
        public static final BalanceRefreshStatus SUCCEEDED = new BalanceRefreshStatus("SUCCEEDED", 2, "succeeded");
        public static final BalanceRefreshStatus UNKNOWN = new BalanceRefreshStatus("UNKNOWN", 3, "unknown");

        @NotNull
        private final String code;

        private static final /* synthetic */ BalanceRefreshStatus[] $values() {
            return new BalanceRefreshStatus[]{FAILED, PENDING, SUCCEEDED, UNKNOWN};
        }

        static {
            BalanceRefreshStatus[] balanceRefreshStatusArr$values = $values();
            $VALUES = balanceRefreshStatusArr$values;
            $ENTRIES = EnumEntriesKt.a(balanceRefreshStatusArr$values);
            Companion = new e();
            $cachedSerializer$delegate = LazyKt.b(LazyThreadSafetyMode.f71680b, new ww.e(6));
        }

        private BalanceRefreshStatus(String str, int i5, String str2) {
            this.code = str2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final /* synthetic */ KSerializer _init_$_anonymous_() {
            return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.financialconnections.model.BalanceRefresh.BalanceRefreshStatus", values(), new String[]{"failed", "pending", "succeeded", null}, new Annotation[][]{null, null, null, null}, null);
        }

        @NotNull
        public static EnumEntries<BalanceRefreshStatus> getEntries() {
            return $ENTRIES;
        }

        public static BalanceRefreshStatus valueOf(String str) {
            return (BalanceRefreshStatus) Enum.valueOf(BalanceRefreshStatus.class, str);
        }

        public static BalanceRefreshStatus[] values() {
            return (BalanceRefreshStatus[]) $VALUES.clone();
        }

        @NotNull
        /* renamed from: getCode$financial_connections_core_release, reason: from getter */
        public final String getCode() {
            return this.code;
        }
    }

    public /* synthetic */ BalanceRefresh(int i5, BalanceRefreshStatus balanceRefreshStatus, int i11) {
        if (2 != (i5 & 2)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 2, d.f42754a.getDescriptor());
        }
        if ((i5 & 1) == 0) {
            this.f42703a = BalanceRefreshStatus.UNKNOWN;
        } else {
            this.f42703a = balanceRefreshStatus;
        }
        this.f42704b = i11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BalanceRefresh)) {
            return false;
        }
        BalanceRefresh balanceRefresh = (BalanceRefresh) obj;
        return this.f42703a == balanceRefresh.f42703a && this.f42704b == balanceRefresh.f42704b;
    }

    public final int hashCode() {
        BalanceRefreshStatus balanceRefreshStatus = this.f42703a;
        return Integer.hashCode(this.f42704b) + ((balanceRefreshStatus == null ? 0 : balanceRefreshStatus.hashCode()) * 31);
    }

    public final String toString() {
        return "BalanceRefresh(status=" + this.f42703a + ", lastAttemptedAt=" + this.f42704b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        BalanceRefreshStatus balanceRefreshStatus = this.f42703a;
        if (balanceRefreshStatus == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(balanceRefreshStatus.name());
        }
        dest.writeInt(this.f42704b);
    }

    public BalanceRefresh(BalanceRefreshStatus balanceRefreshStatus, int i5) {
        this.f42703a = balanceRefreshStatus;
        this.f42704b = i5;
    }
}
