package com.vungle.ads;

import androidx.recyclerview.widget.n0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Deprecated;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Deprecated
@Metadata(bv = {}, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\r\b\u0087\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u0017\u0010\r\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0010\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\u000e\u0010\n\u001a\u0004\b\u000f\u0010\fj\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014¨\u0006\u0015"}, d2 = {"Lcom/vungle/ads/BannerAdSize;", b.f42142b, b.f42142b, "a", "Ljava/lang/String;", "getSizeName", "()Ljava/lang/String;", "sizeName", b.f42142b, "b", "I", "getWidth", "()I", "width", "c", "getHeight", "height", "VUNGLE_MREC", "BANNER", "BANNER_SHORT", "BANNER_LEADERBOARD", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public enum BannerAdSize {
    VUNGLE_MREC("mrec", 300, n0.DEFAULT_SWIPE_ANIMATION_DURATION),
    BANNER("banner", Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50),
    BANNER_SHORT("banner_short", 300, 50),
    BANNER_LEADERBOARD("banner_leaderboard", 728, 90);


    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final String sizeName;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final int width;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public final int height;

    BannerAdSize(String str, int i5, int i11) {
        this.sizeName = str;
        this.width = i5;
        this.height = i11;
    }

    public final int getHeight() {
        return this.height;
    }

    @NotNull
    public final String getSizeName() {
        return this.sizeName;
    }

    public final int getWidth() {
        return this.width;
    }
}
