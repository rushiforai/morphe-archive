package com.vungle.ads;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.LinkedHashMap;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0013\b\u0016\u0018\u0000 \u00182\u00020\u0001:\u0003\u0018\u0019\u001aB\u0007¢\u0006\u0004\b\u0017\u0010\u0015J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002J\u0006\u0010\u0007\u001a\u00020\u0006J\u000e\u0010\n\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\bJ\u0011\u0010\r\u001a\u0004\u0018\u00010\bH\u0000¢\u0006\u0004\b\u000b\u0010\fR(\u0010\u0016\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0018\n\u0004\b\u000e\u0010\u000f\u0012\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013¨\u0006\u001b"}, d2 = {"Lcom/vungle/ads/AdConfig;", b.f42142b, b.f42142b, "isBackButtonImmediatelyEnabled", b.f42142b, "setBackButtonImmediatelyEnabled", b.f42142b, "getSettings", b.f42142b, "watermark", "setWatermark", "getWatermark$vungle_ads_release", "()Ljava/lang/String;", "getWatermark", "c", "I", "getAdOrientation", "()I", "setAdOrientation", "(I)V", "getAdOrientation$annotations", "()V", "adOrientation", "<init>", k.O, "Orientation", "Settings", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public class AdConfig {
    public static final int AUTO_ROTATE = 2;
    public static final int IMMEDIATE_BACK = 2;
    public static final int LANDSCAPE = 1;
    public static final int PORTRAIT = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f46549b;

    /* renamed from: a, reason: collision with root package name */
    public LinkedHashMap f46548a = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public int adOrientation = 2;

    @Retention(RetentionPolicy.RUNTIME)
    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\b\u0086\u0002\u0018\u00002\u00020\u0001B\u0000¨\u0006\u0002"}, d2 = {"Lcom/vungle/ads/AdConfig$Orientation;", b.f42142b, "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public @interface Orientation {
    }

    @Retention(RetentionPolicy.RUNTIME)
    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\b\u0086\u0002\u0018\u00002\u00020\u0001B\u0000¨\u0006\u0002"}, d2 = {"Lcom/vungle/ads/AdConfig$Settings;", b.f42142b, "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public @interface Settings {
    }

    @Orientation
    public static /* synthetic */ void getAdOrientation$annotations() {
    }

    public final int getAdOrientation() {
        return this.adOrientation;
    }

    /* renamed from: getSettings, reason: from getter */
    public final int getF46549b() {
        return this.f46549b;
    }

    @Nullable
    public final String getWatermark$vungle_ads_release() {
        return (String) this.f46548a.get("WATERMARK");
    }

    public final void setAdOrientation(int i5) {
        this.adOrientation = i5;
    }

    public final void setBackButtonImmediatelyEnabled(boolean isBackButtonImmediatelyEnabled) {
        this.f46549b = isBackButtonImmediatelyEnabled ? this.f46549b | 2 : this.f46549b & (-3);
    }

    public final void setWatermark(@NotNull String watermark) {
        Intrinsics.g(watermark, "watermark");
        this.f46548a.put("WATERMARK", watermark);
    }
}
