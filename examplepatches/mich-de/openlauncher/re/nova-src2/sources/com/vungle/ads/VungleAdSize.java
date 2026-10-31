package com.vungle.ads;

import a2.c;
import android.content.Context;
import androidx.recyclerview.widget.n0;
import com.iab.omid.library.vungle.internal.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.a0;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0016\u0018\u0000 \u001d2\u00020\u0001:\u0001\u001dB\u0019\b\u0000\u0012\u0006\u0010\r\u001a\u00020\b\u0012\u0006\u0010\u0010\u001a\u00020\b¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u0005\u001a\u00020\u0002H\u0000¢\u0006\u0004\b\u0003\u0010\u0004J\b\u0010\u0007\u001a\u00020\u0006H\u0016R\u0017\u0010\r\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0010\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\u000e\u0010\n\u001a\u0004\b\u000f\u0010\fR\"\u0010\u0016\u001a\u00020\u00028\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0004\"\u0004\b\u0014\u0010\u0015R\"\u0010\u001a\u001a\u00020\u00028\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b\u0017\u0010\u0012\u001a\u0004\b\u0018\u0010\u0004\"\u0004\b\u0019\u0010\u0015¨\u0006\u001e"}, d2 = {"Lcom/vungle/ads/VungleAdSize;", b.f42142b, b.f42142b, "isValidSize$vungle_ads_release", "()Z", "isValidSize", b.f42142b, "toString", b.f42142b, "a", "I", "getWidth", "()I", "width", "b", "getHeight", "height", "c", "Z", "isAdaptiveHeight$vungle_ads_release", "setAdaptiveHeight$vungle_ads_release", "(Z)V", "isAdaptiveHeight", "d", "isAdaptiveWidth$vungle_ads_release", "setAdaptiveWidth$vungle_ads_release", "isAdaptiveWidth", "<init>", "(II)V", k.O, "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class VungleAdSize {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final int width;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final int height;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public boolean isAdaptiveHeight;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public boolean isAdaptiveWidth;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @JvmField
    @NotNull
    public static final VungleAdSize BANNER = new VungleAdSize(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50);

    @JvmField
    @NotNull
    public static final VungleAdSize BANNER_SHORT = new VungleAdSize(300, 50);

    @JvmField
    @NotNull
    public static final VungleAdSize BANNER_LEADERBOARD = new VungleAdSize(728, 90);

    @JvmField
    @NotNull
    public static final VungleAdSize MREC = new VungleAdSize(300, n0.DEFAULT_SWIPE_ANIMATION_DURATION);

    @Metadata(bv = {}, d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\b\b\u0086\u0003\u0018\u00002\u00020\u0001J\u0018\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0007J\u0018\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u0004H\u0007J \u0010\f\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\nH\u0007R\u0014\u0010\r\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u000eR\u0014\u0010\u0010\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u000eR\u0014\u0010\u0011\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u000e¨\u0006\u0012"}, d2 = {"Lcom/vungle/ads/VungleAdSize$Companion;", b.f42142b, "Landroid/content/Context;", "context", b.f42142b, "width", "Lcom/vungle/ads/VungleAdSize;", "getAdSizeWithWidth", "height", "getAdSizeWithWidthAndHeight", b.f42142b, "placementId", "getValidAdSizeFromSize", "BANNER", "Lcom/vungle/ads/VungleAdSize;", "BANNER_LEADERBOARD", "BANNER_SHORT", "MREC", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        @NotNull
        public final VungleAdSize getAdSizeWithWidth(@NotNull Context context, int width) {
            Intrinsics.g(context, "context");
            int iIntValue = ((Number) a0.a(context).f71684b).intValue();
            if (width < 0) {
                width = 0;
            }
            VungleAdSize vungleAdSize = new VungleAdSize(width, iIntValue);
            if (vungleAdSize.getWidth() == 0) {
                vungleAdSize.setAdaptiveWidth$vungle_ads_release(true);
            }
            vungleAdSize.setAdaptiveHeight$vungle_ads_release(true);
            return vungleAdSize;
        }

        @JvmStatic
        @NotNull
        public final VungleAdSize getAdSizeWithWidthAndHeight(int width, int height) {
            if (width < 0) {
                width = 0;
            }
            if (height < 0) {
                height = 0;
            }
            VungleAdSize vungleAdSize = new VungleAdSize(width, height);
            if (vungleAdSize.getWidth() == 0) {
                vungleAdSize.setAdaptiveWidth$vungle_ads_release(true);
            }
            if (vungleAdSize.getHeight() == 0) {
                vungleAdSize.setAdaptiveHeight$vungle_ads_release(true);
            }
            return vungleAdSize;
        }

        @JvmStatic
        @NotNull
        public final VungleAdSize getValidAdSizeFromSize(int width, int height, @NotNull String placementId) {
            Intrinsics.g(placementId, "placementId");
            ConfigManager.INSTANCE.getClass();
            j3 j3VarA = ConfigManager.a(placementId);
            if (j3VarA != null) {
                if (!j3VarA.f()) {
                    j3VarA = null;
                }
                if (j3VarA != null) {
                    return VungleAdSize.INSTANCE.getAdSizeWithWidthAndHeight(width, height);
                }
            }
            VungleAdSize vungleAdSize = VungleAdSize.MREC;
            if (width >= vungleAdSize.getWidth() && height >= vungleAdSize.getHeight()) {
                return vungleAdSize;
            }
            VungleAdSize vungleAdSize2 = VungleAdSize.BANNER_LEADERBOARD;
            if (width >= vungleAdSize2.getWidth() && height >= vungleAdSize2.getHeight()) {
                return vungleAdSize2;
            }
            VungleAdSize vungleAdSize3 = VungleAdSize.BANNER;
            if (width >= vungleAdSize3.getWidth() && height >= vungleAdSize3.getHeight()) {
                return vungleAdSize3;
            }
            VungleAdSize vungleAdSize4 = VungleAdSize.BANNER_SHORT;
            return (width < vungleAdSize4.getWidth() || height < vungleAdSize4.getHeight()) ? getAdSizeWithWidthAndHeight(width, height) : vungleAdSize4;
        }

        public Companion() {
        }
    }

    public VungleAdSize(int i5, int i11) {
        this.width = i5;
        this.height = i11;
    }

    @JvmStatic
    @NotNull
    public static final VungleAdSize getAdSizeWithWidth(@NotNull Context context, int i5) {
        return INSTANCE.getAdSizeWithWidth(context, i5);
    }

    @JvmStatic
    @NotNull
    public static final VungleAdSize getAdSizeWithWidthAndHeight(int i5, int i11) {
        return INSTANCE.getAdSizeWithWidthAndHeight(i5, i11);
    }

    @JvmStatic
    @NotNull
    public static final VungleAdSize getValidAdSizeFromSize(int i5, int i11, @NotNull String str) {
        return INSTANCE.getValidAdSizeFromSize(i5, i11, str);
    }

    public final int getHeight() {
        return this.height;
    }

    public final int getWidth() {
        return this.width;
    }

    /* renamed from: isAdaptiveHeight$vungle_ads_release, reason: from getter */
    public final boolean getIsAdaptiveHeight() {
        return this.isAdaptiveHeight;
    }

    /* renamed from: isAdaptiveWidth$vungle_ads_release, reason: from getter */
    public final boolean getIsAdaptiveWidth() {
        return this.isAdaptiveWidth;
    }

    public final boolean isValidSize$vungle_ads_release() {
        return this.width >= 0 && this.height >= 0;
    }

    public final void setAdaptiveHeight$vungle_ads_release(boolean z11) {
        this.isAdaptiveHeight = z11;
    }

    public final void setAdaptiveWidth$vungle_ads_release(boolean z11) {
        this.isAdaptiveWidth = z11;
    }

    @NotNull
    public String toString() {
        StringBuilder sbA = l.a("VungleAdSize(width=");
        sbA.append(this.width);
        sbA.append(", height=");
        return c.m(sbA, this.height, ')');
    }
}
