package com.moloco.sdk.publisher.privacy;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001:\u0001\fB\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0004\u001a\u00020\u0005H\u0007R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\t¨\u0006\r"}, d2 = {"Lcom/moloco/sdk/publisher/privacy/MolocoPrivacy;", b.f42142b, "<init>", "()V", "privacySettings", "Lcom/moloco/sdk/publisher/privacy/MolocoPrivacy$PrivacySettings;", "getPrivacySettings", "()Lcom/moloco/sdk/publisher/privacy/MolocoPrivacy$PrivacySettings;", "setPrivacySettings", "(Lcom/moloco/sdk/publisher/privacy/MolocoPrivacy$PrivacySettings;)V", "setPrivacy", b.f42142b, "PrivacySettings", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MolocoPrivacy {

    @NotNull
    public static final MolocoPrivacy INSTANCE = new MolocoPrivacy();

    @NotNull
    private static PrivacySettings privacySettings = new PrivacySettings((Boolean) null, (Boolean) null, (Boolean) null, 7, (DefaultConstructorMarker) null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B+\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007B;\b\u0010\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\u0006\u0010\u000bJ\u0013\u0010\u0014\u001a\u00020\u00032\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\b\u0010\u0016\u001a\u00020\u0017H\u0016J\u0017\u0010\u0018\u001a\u00020\t2\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003H\u0002¢\u0006\u0002\u0010\u0019R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u0002\u0010\fR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u0004\u0010\fR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u0005\u0010\fR\"\u0010\u000f\u001a\u0004\u0018\u00010\t2\b\u0010\u000e\u001a\u0004\u0018\u00010\t@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\n\u001a\u00020\t8F¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0011¨\u0006\u001a"}, d2 = {"Lcom/moloco/sdk/publisher/privacy/MolocoPrivacy$PrivacySettings;", b.f42142b, "isUserConsent", b.f42142b, "isAgeRestrictedUser", "isDoNotSell", "<init>", "(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V", "tcfConsent", b.f42142b, "usPrivacy", "(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "value", "TCFConsent", "getTCFConsent", "()Ljava/lang/String;", "_usPrivacy", "getUsPrivacy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "getUSPrivacy", "(Ljava/lang/Boolean;)Ljava/lang/String;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class PrivacySettings {
        public static final int $stable = 8;

        @Nullable
        private String TCFConsent;

        @NotNull
        private String _usPrivacy;

        @Nullable
        private final Boolean isAgeRestrictedUser;

        @Nullable
        private final Boolean isDoNotSell;

        @Nullable
        private final Boolean isUserConsent;

        public PrivacySettings() {
            this((Boolean) null, (Boolean) null, (Boolean) null, 7, (DefaultConstructorMarker) null);
        }

        private final String getUSPrivacy(Boolean isDoNotSell) {
            return isDoNotSell == null ? "1---" : isDoNotSell.equals(Boolean.TRUE) ? "1-Y-" : "1-N-";
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PrivacySettings)) {
                return false;
            }
            PrivacySettings privacySettings = (PrivacySettings) other;
            return Intrinsics.b(this.isUserConsent, privacySettings.isUserConsent) && Intrinsics.b(this.isAgeRestrictedUser, privacySettings.isAgeRestrictedUser) && Intrinsics.b(this.isDoNotSell, privacySettings.isDoNotSell) && Intrinsics.b(this.TCFConsent, privacySettings.TCFConsent);
        }

        @Nullable
        public final String getTCFConsent() {
            return this.TCFConsent;
        }

        @NotNull
        /* renamed from: getUsPrivacy, reason: from getter */
        public final String get_usPrivacy() {
            return this._usPrivacy;
        }

        public int hashCode() {
            Boolean bool = this.isUserConsent;
            int iHashCode = (bool != null ? bool.hashCode() : 0) * 31;
            Boolean bool2 = this.isAgeRestrictedUser;
            int iHashCode2 = (iHashCode + (bool2 != null ? bool2.hashCode() : 0)) * 31;
            Boolean bool3 = this.isDoNotSell;
            int iHashCode3 = (iHashCode2 + (bool3 != null ? bool3.hashCode() : 0)) * 31;
            String str = this.TCFConsent;
            return iHashCode3 + (str != null ? str.hashCode() : 0);
        }

        @Nullable
        /* renamed from: isAgeRestrictedUser, reason: from getter */
        public final Boolean getIsAgeRestrictedUser() {
            return this.isAgeRestrictedUser;
        }

        @Nullable
        /* renamed from: isDoNotSell, reason: from getter */
        public final Boolean getIsDoNotSell() {
            return this.isDoNotSell;
        }

        @Nullable
        /* renamed from: isUserConsent, reason: from getter */
        public final Boolean getIsUserConsent() {
            return this.isUserConsent;
        }

        public PrivacySettings(@Nullable Boolean bool, @Nullable Boolean bool2, @Nullable Boolean bool3) {
            this.isUserConsent = bool;
            this.isAgeRestrictedUser = bool2;
            this.isDoNotSell = bool3;
            this._usPrivacy = getUSPrivacy(bool3);
        }

        public /* synthetic */ PrivacySettings(Boolean bool, Boolean bool2, Boolean bool3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : bool, (i5 & 2) != 0 ? null : bool2, (i5 & 4) != 0 ? null : bool3);
        }

        public PrivacySettings(@Nullable Boolean bool, @Nullable Boolean bool2, @Nullable Boolean bool3, @Nullable String str, @Nullable String str2) {
            this(bool, bool2, bool3);
            this.TCFConsent = str;
            if (str2 != null) {
                this._usPrivacy = str2;
            }
        }
    }

    private MolocoPrivacy() {
    }

    @JvmStatic
    public static final void setPrivacy(@NotNull PrivacySettings privacySettings2) {
        Intrinsics.g(privacySettings2, "privacySettings");
        privacySettings = privacySettings2;
    }

    @NotNull
    public final PrivacySettings getPrivacySettings() {
        return privacySettings;
    }

    public final void setPrivacySettings(@NotNull PrivacySettings privacySettings2) {
        Intrinsics.g(privacySettings2, "<set-?>");
        privacySettings = privacySettings2;
    }
}
