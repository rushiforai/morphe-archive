package com.instabridge.mobilesdk;

import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import i2.r0;
import i2.s;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b:\b\u0087\b\u0018\u0000 J2\u00020\u0001:\u0001JB\u0087\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0002\u0012\b\b\u0002\u0010\b\u001a\u00020\u0002\u0012\b\b\u0002\u0010\t\u001a\u00020\u0002\u0012\b\b\u0002\u0010\n\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0002\u0012\b\b\u0001\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u0012\n\b\u0003\u0010\u0010\u001a\u0004\u0018\u00010\f\u0012\u0006\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0017\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0019\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0016J\u0010\u0010\u001b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u0016J\u0010\u0010\u001d\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u0016J\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u0016J\u0010\u0010!\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u0016J\u0010\u0010#\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\"\u0010\u0016J\u0010\u0010%\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b$\u0010\u0016J\u0010\u0010'\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b&\u0010\u0016J\u0010\u0010(\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b(\u0010)J\u0010\u0010*\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b*\u0010+J\u0012\u0010,\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b,\u0010-J\u0010\u0010.\u001a\u00020\u0011HÆ\u0003¢\u0006\u0004\b.\u0010/J\u0094\u0001\u00102\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u00022\b\b\u0002\u0010\n\u001a\u00020\u00022\b\b\u0002\u0010\u000b\u001a\u00020\u00022\b\b\u0003\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\n\b\u0003\u0010\u0010\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u0012\u001a\u00020\u0011HÆ\u0001¢\u0006\u0004\b0\u00101J\u0010\u00103\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b3\u0010/J\u0010\u00104\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b4\u0010)J\u001a\u00106\u001a\u00020\u000e2\b\u00105\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b6\u00107R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00108\u001a\u0004\b9\u0010\u0016R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00108\u001a\u0004\b:\u0010\u0016R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00108\u001a\u0004\b;\u0010\u0016R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u00108\u001a\u0004\b<\u0010\u0016R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u00108\u001a\u0004\b=\u0010\u0016R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\b\u00108\u001a\u0004\b>\u0010\u0016R\u0017\u0010\t\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\t\u00108\u001a\u0004\b?\u0010\u0016R\u0017\u0010\n\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\n\u00108\u001a\u0004\b@\u0010\u0016R\u0017\u0010\u000b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u00108\u001a\u0004\bA\u0010\u0016R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010B\u001a\u0004\bC\u0010)R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010D\u001a\u0004\bE\u0010+R\u0019\u0010\u0010\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010F\u001a\u0004\bG\u0010-R\u0017\u0010\u0012\u001a\u00020\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010H\u001a\u0004\bI\u0010/¨\u0006K"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdkTheme;", b.f42142b, "Li2/s;", "primary", "onPrimary", "secondary", "background", "surface", "onSurface", "onSurfaceVariant", "surfaceVariant", "outlineVariant", b.f42142b, "logo", b.f42142b, "logoBackdrop", "dashboardLogo", b.f42142b, "merchantDisplayName", "<init>", "(JJJJJJJJJIZLjava/lang/Integer;Ljava/lang/String;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "component1-0d7_KjU", "()J", "component1", "component2-0d7_KjU", "component2", "component3-0d7_KjU", "component3", "component4-0d7_KjU", "component4", "component5-0d7_KjU", "component5", "component6-0d7_KjU", "component6", "component7-0d7_KjU", "component7", "component8-0d7_KjU", "component8", "component9-0d7_KjU", "component9", "component10", "()I", "component11", "()Z", "component12", "()Ljava/lang/Integer;", "component13", "()Ljava/lang/String;", "copy--wsPGbo", "(JJJJJJJJJIZLjava/lang/Integer;Ljava/lang/String;)Lcom/instabridge/mobilesdk/MobileSdkTheme;", "copy", "toString", "hashCode", InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "J", "getPrimary-0d7_KjU", "getOnPrimary-0d7_KjU", "getSecondary-0d7_KjU", "getBackground-0d7_KjU", "getSurface-0d7_KjU", "getOnSurface-0d7_KjU", "getOnSurfaceVariant-0d7_KjU", "getSurfaceVariant-0d7_KjU", "getOutlineVariant-0d7_KjU", "I", "getLogo", "Z", "getLogoBackdrop", "Ljava/lang/Integer;", "getDashboardLogo", "Ljava/lang/String;", "getMerchantDisplayName", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class MobileSdkTheme {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long background;

    @Nullable
    private final Integer dashboardLogo;
    private final int logo;
    private final boolean logoBackdrop;

    @NotNull
    private final String merchantDisplayName;
    private final long onPrimary;
    private final long onSurface;
    private final long onSurfaceVariant;
    private final long outlineVariant;
    private final long primary;
    private final long secondary;
    private final long surface;
    private final long surfaceVariant;

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0007J\u0010\u0010\b\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0007J\u0010\u0010\t\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0007J\u0010\u0010\n\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0007¨\u0006\u000b"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdkTheme$Companion;", b.f42142b, "<init>", "()V", "nova", "Lcom/instabridge/mobilesdk/MobileSdkTheme;", "logo", b.f42142b, "eyecon", "instabridge", "eyeconDark", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final MobileSdkTheme eyecon(int logo) {
            return new MobileSdkTheme(r0.c(4278228981L), 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, logo, false, Integer.valueOf(R.drawable.mobile_sdk_ic_brand_logo), "Eyecon Mobile", 1534, null);
        }

        @NotNull
        public final MobileSdkTheme eyeconDark(int logo) {
            return new MobileSdkTheme(r0.c(4278228981L), 0L, 0L, r0.c(4278917931L), r0.c(4278917931L), r0.c(4294967295L), r0.c(4289245378L), r0.c(4279575354L), r0.b(536870911), logo, false, Integer.valueOf(R.drawable.mobile_sdk_ic_brand_logo), "Eyecon Mobile", 1030, null);
        }

        @NotNull
        public final MobileSdkTheme instabridge(int logo) {
            return new MobileSdkTheme(r0.c(4278233230L), 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, logo, false, null, "Instabridge Mobile", 3582, null);
        }

        @NotNull
        public final MobileSdkTheme nova(int logo) {
            return new MobileSdkTheme(r0.c(4293414702L), 0L, 0L, r0.c(4279902003L), r0.c(4279902003L), r0.c(4294967295L), r0.c(4289245378L), r0.c(4280625984L), r0.c(4282007637L), logo, false, null, "Nova Mobile", 2054, null);
        }

        private Companion() {
        }
    }

    public /* synthetic */ MobileSdkTheme(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, int i5, boolean z11, Integer num, String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(j11, j12, j13, j14, j15, j16, j17, j18, j19, i5, z11, num, str);
    }

    /* renamed from: copy--wsPGbo$default, reason: not valid java name */
    public static /* synthetic */ MobileSdkTheme m163copywsPGbo$default(MobileSdkTheme mobileSdkTheme, long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, int i5, boolean z11, Integer num, String str, int i11, Object obj) {
        long j21 = (i11 & 1) != 0 ? mobileSdkTheme.primary : j11;
        return mobileSdkTheme.m173copywsPGbo(j21, (i11 & 2) != 0 ? mobileSdkTheme.onPrimary : j12, (i11 & 4) != 0 ? mobileSdkTheme.secondary : j13, (i11 & 8) != 0 ? mobileSdkTheme.background : j14, (i11 & 16) != 0 ? mobileSdkTheme.surface : j15, (i11 & 32) != 0 ? mobileSdkTheme.onSurface : j16, (i11 & 64) != 0 ? mobileSdkTheme.onSurfaceVariant : j17, (i11 & 128) != 0 ? mobileSdkTheme.surfaceVariant : j18, (i11 & 256) != 0 ? mobileSdkTheme.outlineVariant : j19, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? mobileSdkTheme.logo : i5, (i11 & 1024) != 0 ? mobileSdkTheme.logoBackdrop : z11, (i11 & 2048) != 0 ? mobileSdkTheme.dashboardLogo : num, (i11 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? mobileSdkTheme.merchantDisplayName : str);
    }

    /* renamed from: component1-0d7_KjU, reason: not valid java name and from getter */
    public final long getPrimary() {
        return this.primary;
    }

    /* renamed from: component10, reason: from getter */
    public final int getLogo() {
        return this.logo;
    }

    /* renamed from: component11, reason: from getter */
    public final boolean getLogoBackdrop() {
        return this.logoBackdrop;
    }

    @Nullable
    /* renamed from: component12, reason: from getter */
    public final Integer getDashboardLogo() {
        return this.dashboardLogo;
    }

    @NotNull
    /* renamed from: component13, reason: from getter */
    public final String getMerchantDisplayName() {
        return this.merchantDisplayName;
    }

    /* renamed from: component2-0d7_KjU, reason: not valid java name and from getter */
    public final long getOnPrimary() {
        return this.onPrimary;
    }

    /* renamed from: component3-0d7_KjU, reason: not valid java name and from getter */
    public final long getSecondary() {
        return this.secondary;
    }

    /* renamed from: component4-0d7_KjU, reason: not valid java name and from getter */
    public final long getBackground() {
        return this.background;
    }

    /* renamed from: component5-0d7_KjU, reason: not valid java name and from getter */
    public final long getSurface() {
        return this.surface;
    }

    /* renamed from: component6-0d7_KjU, reason: not valid java name and from getter */
    public final long getOnSurface() {
        return this.onSurface;
    }

    /* renamed from: component7-0d7_KjU, reason: not valid java name and from getter */
    public final long getOnSurfaceVariant() {
        return this.onSurfaceVariant;
    }

    /* renamed from: component8-0d7_KjU, reason: not valid java name and from getter */
    public final long getSurfaceVariant() {
        return this.surfaceVariant;
    }

    /* renamed from: component9-0d7_KjU, reason: not valid java name and from getter */
    public final long getOutlineVariant() {
        return this.outlineVariant;
    }

    @NotNull
    /* renamed from: copy--wsPGbo, reason: not valid java name */
    public final MobileSdkTheme m173copywsPGbo(long primary, long onPrimary, long secondary, long background, long surface, long onSurface, long onSurfaceVariant, long surfaceVariant, long outlineVariant, int logo, boolean logoBackdrop, @Nullable Integer dashboardLogo, @NotNull String merchantDisplayName) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        return new MobileSdkTheme(primary, onPrimary, secondary, background, surface, onSurface, onSurfaceVariant, surfaceVariant, outlineVariant, logo, logoBackdrop, dashboardLogo, merchantDisplayName, null);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MobileSdkTheme)) {
            return false;
        }
        MobileSdkTheme mobileSdkTheme = (MobileSdkTheme) other;
        long j11 = this.primary;
        long j12 = mobileSdkTheme.primary;
        int i5 = s.n;
        return ULong.a(j11, j12) && ULong.a(this.onPrimary, mobileSdkTheme.onPrimary) && ULong.a(this.secondary, mobileSdkTheme.secondary) && ULong.a(this.background, mobileSdkTheme.background) && ULong.a(this.surface, mobileSdkTheme.surface) && ULong.a(this.onSurface, mobileSdkTheme.onSurface) && ULong.a(this.onSurfaceVariant, mobileSdkTheme.onSurfaceVariant) && ULong.a(this.surfaceVariant, mobileSdkTheme.surfaceVariant) && ULong.a(this.outlineVariant, mobileSdkTheme.outlineVariant) && this.logo == mobileSdkTheme.logo && this.logoBackdrop == mobileSdkTheme.logoBackdrop && Intrinsics.b(this.dashboardLogo, mobileSdkTheme.dashboardLogo) && Intrinsics.b(this.merchantDisplayName, mobileSdkTheme.merchantDisplayName);
    }

    /* renamed from: getBackground-0d7_KjU, reason: not valid java name */
    public final long m174getBackground0d7_KjU() {
        return this.background;
    }

    @Nullable
    public final Integer getDashboardLogo() {
        return this.dashboardLogo;
    }

    public final int getLogo() {
        return this.logo;
    }

    public final boolean getLogoBackdrop() {
        return this.logoBackdrop;
    }

    @NotNull
    public final String getMerchantDisplayName() {
        return this.merchantDisplayName;
    }

    /* renamed from: getOnPrimary-0d7_KjU, reason: not valid java name */
    public final long m175getOnPrimary0d7_KjU() {
        return this.onPrimary;
    }

    /* renamed from: getOnSurface-0d7_KjU, reason: not valid java name */
    public final long m176getOnSurface0d7_KjU() {
        return this.onSurface;
    }

    /* renamed from: getOnSurfaceVariant-0d7_KjU, reason: not valid java name */
    public final long m177getOnSurfaceVariant0d7_KjU() {
        return this.onSurfaceVariant;
    }

    /* renamed from: getOutlineVariant-0d7_KjU, reason: not valid java name */
    public final long m178getOutlineVariant0d7_KjU() {
        return this.outlineVariant;
    }

    /* renamed from: getPrimary-0d7_KjU, reason: not valid java name */
    public final long m179getPrimary0d7_KjU() {
        return this.primary;
    }

    /* renamed from: getSecondary-0d7_KjU, reason: not valid java name */
    public final long m180getSecondary0d7_KjU() {
        return this.secondary;
    }

    /* renamed from: getSurface-0d7_KjU, reason: not valid java name */
    public final long m181getSurface0d7_KjU() {
        return this.surface;
    }

    /* renamed from: getSurfaceVariant-0d7_KjU, reason: not valid java name */
    public final long m182getSurfaceVariant0d7_KjU() {
        return this.surfaceVariant;
    }

    public int hashCode() {
        long j11 = this.primary;
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        int iF = c9.f(u4.a(this.logo, c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(Long.hashCode(j11) * 31, 31, this.onPrimary), 31, this.secondary), 31, this.background), 31, this.surface), 31, this.onSurface), 31, this.onSurfaceVariant), 31, this.surfaceVariant), 31, this.outlineVariant), 31), 31, this.logoBackdrop);
        Integer num = this.dashboardLogo;
        return this.merchantDisplayName.hashCode() + ((iF + (num == null ? 0 : num.hashCode())) * 31);
    }

    @NotNull
    public String toString() {
        String strH = s.h(this.primary);
        String strH2 = s.h(this.onPrimary);
        String strH3 = s.h(this.secondary);
        String strH4 = s.h(this.background);
        String strH5 = s.h(this.surface);
        String strH6 = s.h(this.onSurface);
        String strH7 = s.h(this.onSurfaceVariant);
        String strH8 = s.h(this.surfaceVariant);
        String strH9 = s.h(this.outlineVariant);
        int i5 = this.logo;
        boolean z11 = this.logoBackdrop;
        Integer num = this.dashboardLogo;
        String str = this.merchantDisplayName;
        StringBuilder sbW = c0.w("MobileSdkTheme(primary=", strH, ", onPrimary=", strH2, ", secondary=");
        c0.D(sbW, strH3, ", background=", strH4, ", surface=");
        c0.D(sbW, strH5, ", onSurface=", strH6, ", onSurfaceVariant=");
        c0.D(sbW, strH7, ", surfaceVariant=", strH8, ", outlineVariant=");
        sbW.append(strH9);
        sbW.append(", logo=");
        sbW.append(i5);
        sbW.append(", logoBackdrop=");
        sbW.append(z11);
        sbW.append(", dashboardLogo=");
        sbW.append(num);
        sbW.append(", merchantDisplayName=");
        return c0.q(sbW, str, ")");
    }

    private MobileSdkTheme(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, int i5, boolean z11, Integer num, String merchantDisplayName) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        this.primary = j11;
        this.onPrimary = j12;
        this.secondary = j13;
        this.background = j14;
        this.surface = j15;
        this.onSurface = j16;
        this.onSurfaceVariant = j17;
        this.surfaceVariant = j18;
        this.outlineVariant = j19;
        this.logo = i5;
        this.logoBackdrop = z11;
        this.dashboardLogo = num;
        this.merchantDisplayName = merchantDisplayName;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public MobileSdkTheme(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, int i5, boolean z11, Integer num, String str, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        long j21 = (i11 & 2) != 0 ? s.f61140f : j12;
        long j22 = (i11 & 4) != 0 ? j11 : j13;
        long jC = (i11 & 8) != 0 ? r0.c(4293325305L) : j14;
        long j23 = (i11 & 16) != 0 ? s.f61140f : j15;
        long jC2 = (i11 & 32) != 0 ? r0.c(4278917931L) : j16;
        this(j11, j21, j22, jC, j23, jC2, (i11 & 64) != 0 ? s.b(0.6f, jC2) : j17, (i11 & 128) != 0 ? j23 : j18, (i11 & 256) != 0 ? s.b(0.12f, jC2) : j19, i5, (i11 & 1024) != 0 ? true : z11, (i11 & 2048) != 0 ? null : num, str, null);
    }
}
