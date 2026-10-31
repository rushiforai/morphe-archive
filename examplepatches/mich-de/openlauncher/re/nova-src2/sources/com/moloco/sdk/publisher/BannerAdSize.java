package com.moloco.sdk.publisher;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\bB\t\b\u0005¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0005\t\n\u000b\f\r¨\u0006\u000e"}, d2 = {"Lcom/moloco/sdk/publisher/BannerAdSize;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Standard", "Tablet", "MREC", "InlineAdaptive", "AnchoredAdaptive", "Lcom/moloco/sdk/publisher/BannerAdSize$AnchoredAdaptive;", "Lcom/moloco/sdk/publisher/BannerAdSize$InlineAdaptive;", "Lcom/moloco/sdk/publisher/BannerAdSize$MREC;", "Lcom/moloco/sdk/publisher/BannerAdSize$Standard;", "Lcom/moloco/sdk/publisher/BannerAdSize$Tablet;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class BannerAdSize {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0007J\u001a\u0010\n\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÇ\u0001¢\u0006\u0002\u0010\u000bJ\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH×\u0003J\t\u0010\u0010\u001a\u00020\u0003H×\u0001J\t\u0010\u0011\u001a\u00020\u0012H×\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0013"}, d2 = {"Lcom/moloco/sdk/publisher/BannerAdSize$AnchoredAdaptive;", "Lcom/moloco/sdk/publisher/BannerAdSize;", "availableWidth", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/Integer;)V", "getAvailableWidth", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "copy", "(Ljava/lang/Integer;)Lcom/moloco/sdk/publisher/BannerAdSize$AnchoredAdaptive;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final /* data */ class AnchoredAdaptive extends BannerAdSize {
        public static final int $stable = 0;

        @Nullable
        private final Integer availableWidth;

        /* JADX WARN: Multi-variable type inference failed */
        public AnchoredAdaptive() {
            this(null, 1, 0 == true ? 1 : 0);
        }

        public static /* synthetic */ AnchoredAdaptive copy$default(AnchoredAdaptive anchoredAdaptive, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                num = anchoredAdaptive.availableWidth;
            }
            return anchoredAdaptive.copy(num);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final Integer getAvailableWidth() {
            return this.availableWidth;
        }

        @NotNull
        public final AnchoredAdaptive copy(@Nullable Integer availableWidth) {
            return new AnchoredAdaptive(availableWidth);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof AnchoredAdaptive) && Intrinsics.b(this.availableWidth, ((AnchoredAdaptive) other).availableWidth);
        }

        @Nullable
        public final Integer getAvailableWidth() {
            return this.availableWidth;
        }

        public int hashCode() {
            Integer num = this.availableWidth;
            if (num == null) {
                return 0;
            }
            return num.hashCode();
        }

        @NotNull
        public String toString() {
            return a2.c.o(new StringBuilder("AnchoredAdaptive(availableWidth="), this.availableWidth, ')');
        }

        public AnchoredAdaptive(@Nullable Integer num) {
            super(null);
            this.availableWidth = num;
        }

        public /* synthetic */ AnchoredAdaptive(Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : num);
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0007J\u001a\u0010\n\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÇ\u0001¢\u0006\u0002\u0010\u000bJ\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH×\u0003J\t\u0010\u0010\u001a\u00020\u0003H×\u0001J\t\u0010\u0011\u001a\u00020\u0012H×\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0013"}, d2 = {"Lcom/moloco/sdk/publisher/BannerAdSize$InlineAdaptive;", "Lcom/moloco/sdk/publisher/BannerAdSize;", "availableWidth", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/Integer;)V", "getAvailableWidth", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "copy", "(Ljava/lang/Integer;)Lcom/moloco/sdk/publisher/BannerAdSize$InlineAdaptive;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final /* data */ class InlineAdaptive extends BannerAdSize {
        public static final int $stable = 0;

        @Nullable
        private final Integer availableWidth;

        /* JADX WARN: Multi-variable type inference failed */
        public InlineAdaptive() {
            this(null, 1, 0 == true ? 1 : 0);
        }

        public static /* synthetic */ InlineAdaptive copy$default(InlineAdaptive inlineAdaptive, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                num = inlineAdaptive.availableWidth;
            }
            return inlineAdaptive.copy(num);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final Integer getAvailableWidth() {
            return this.availableWidth;
        }

        @NotNull
        public final InlineAdaptive copy(@Nullable Integer availableWidth) {
            return new InlineAdaptive(availableWidth);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof InlineAdaptive) && Intrinsics.b(this.availableWidth, ((InlineAdaptive) other).availableWidth);
        }

        @Nullable
        public final Integer getAvailableWidth() {
            return this.availableWidth;
        }

        public int hashCode() {
            Integer num = this.availableWidth;
            if (num == null) {
                return 0;
            }
            return num.hashCode();
        }

        @NotNull
        public String toString() {
            return a2.c.o(new StringBuilder("InlineAdaptive(availableWidth="), this.availableWidth, ')');
        }

        public InlineAdaptive(@Nullable Integer num) {
            super(null);
            this.availableWidth = num;
        }

        public /* synthetic */ InlineAdaptive(Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : num);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/moloco/sdk/publisher/BannerAdSize$MREC;", "Lcom/moloco/sdk/publisher/BannerAdSize;", "<init>", "()V", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class MREC extends BannerAdSize {
        public static final int $stable = 0;

        @NotNull
        public static final MREC INSTANCE = new MREC();

        private MREC() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/moloco/sdk/publisher/BannerAdSize$Standard;", "Lcom/moloco/sdk/publisher/BannerAdSize;", "<init>", "()V", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Standard extends BannerAdSize {
        public static final int $stable = 0;

        @NotNull
        public static final Standard INSTANCE = new Standard();

        private Standard() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/moloco/sdk/publisher/BannerAdSize$Tablet;", "Lcom/moloco/sdk/publisher/BannerAdSize;", "<init>", "()V", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Tablet extends BannerAdSize {
        public static final int $stable = 0;

        @NotNull
        public static final Tablet INSTANCE = new Tablet();

        private Tablet() {
            super(null);
        }
    }

    public /* synthetic */ BannerAdSize(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private BannerAdSize() {
    }
}
