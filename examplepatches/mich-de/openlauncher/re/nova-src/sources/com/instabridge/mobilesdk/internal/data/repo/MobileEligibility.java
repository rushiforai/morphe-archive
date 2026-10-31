package com.instabridge.mobilesdk.internal.data.repo;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility;", b.f42142b, "Eligible", "Ineligible", "Unknown", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility$Eligible;", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility$Ineligible;", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility$Unknown;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface MobileEligibility {

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility$Eligible;", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility;", "<init>", "()V", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Eligible implements MobileEligibility {
        public static final int $stable = 0;

        @NotNull
        public static final Eligible INSTANCE = new Eligible();

        private Eligible() {
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof Eligible);
        }

        public int hashCode() {
            return -1512704362;
        }

        @NotNull
        public String toString() {
            return "Eligible";
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility$Ineligible;", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility;", "reason", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getReason", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Ineligible implements MobileEligibility {
        public static final int $stable = 0;

        @NotNull
        private final String reason;

        public Ineligible(@NotNull String reason) {
            Intrinsics.g(reason, "reason");
            this.reason = reason;
        }

        public static /* synthetic */ Ineligible copy$default(Ineligible ineligible, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = ineligible.reason;
            }
            return ineligible.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getReason() {
            return this.reason;
        }

        @NotNull
        public final Ineligible copy(@NotNull String reason) {
            Intrinsics.g(reason, "reason");
            return new Ineligible(reason);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Ineligible) && Intrinsics.b(this.reason, ((Ineligible) other).reason);
        }

        @NotNull
        public final String getReason() {
            return this.reason;
        }

        public int hashCode() {
            return this.reason.hashCode();
        }

        @NotNull
        public String toString() {
            return c0.l("Ineligible(reason=", this.reason, ")");
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility$Unknown;", "Lcom/instabridge/mobilesdk/internal/data/repo/MobileEligibility;", "<init>", "()V", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Unknown implements MobileEligibility {
        public static final int $stable = 0;

        @NotNull
        public static final Unknown INSTANCE = new Unknown();

        private Unknown() {
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof Unknown);
        }

        public int hashCode() {
            return -1722360917;
        }

        @NotNull
        public String toString() {
            return "Unknown";
        }
    }
}
