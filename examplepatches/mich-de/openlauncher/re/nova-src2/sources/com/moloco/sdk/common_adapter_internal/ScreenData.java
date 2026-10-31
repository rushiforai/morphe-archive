package com.moloco.sdk.common_adapter_internal;

import a80.m;
import b.c9;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0011\b\u0087\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\u0005¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\rJ\u0010\u0010\u0013\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0010JL\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u0005HÇ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0017\u001a\u00020\u0016H×\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002H×\u0001¢\u0006\u0004\b\u0019\u0010\rJ\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001H×\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u001e\u0010\u001f\u001a\u0004\b \u0010\rR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b!\u0010\u001f\u001a\u0004\b\"\u0010\rR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b#\u0010$\u001a\u0004\b%\u0010\u0010R\u0017\u0010\u0007\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b&\u0010$\u001a\u0004\b'\u0010\u0010R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b(\u0010\u001f\u001a\u0004\b)\u0010\rR\u0017\u0010\t\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b*\u0010$\u001a\u0004\b+\u0010\u0010¨\u0006,"}, d2 = {"Lcom/moloco/sdk/common_adapter_internal/ScreenData;", b.f42142b, b.f42142b, "widthPx", "heightPx", b.f42142b, "widthDp", "heightDp", "dpi", "pxRatio", "<init>", "(IIFFIF)V", "component1", "()I", "component2", "component3", "()F", "component4", "component5", "component6", "copy", "(IIFFIF)Lcom/moloco/sdk/common_adapter_internal/ScreenData;", b.f42142b, "toString", "()Ljava/lang/String;", "hashCode", InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "I", "getWidthPx", "b", "getHeightPx", "c", "F", "getWidthDp", "d", "getHeightDp", "e", "getDpi", InneractiveMediationDefs.GENDER_FEMALE, "getPxRatio", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
/* loaded from: classes.dex */
public final /* data */ class ScreenData {
    public static final int $stable = 0;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final int widthPx;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final int heightPx;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public final float widthDp;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public final float heightDp;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    public final int dpi;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    public final float pxRatio;

    public ScreenData(int i5, int i11, float f11, float f12, int i12, float f13) {
        this.widthPx = i5;
        this.heightPx = i11;
        this.widthDp = f11;
        this.heightDp = f12;
        this.dpi = i12;
        this.pxRatio = f13;
    }

    public static /* synthetic */ ScreenData copy$default(ScreenData screenData, int i5, int i11, float f11, float f12, int i12, float f13, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            i5 = screenData.widthPx;
        }
        if ((i13 & 2) != 0) {
            i11 = screenData.heightPx;
        }
        if ((i13 & 4) != 0) {
            f11 = screenData.widthDp;
        }
        if ((i13 & 8) != 0) {
            f12 = screenData.heightDp;
        }
        if ((i13 & 16) != 0) {
            i12 = screenData.dpi;
        }
        if ((i13 & 32) != 0) {
            f13 = screenData.pxRatio;
        }
        int i14 = i12;
        float f14 = f13;
        return screenData.copy(i5, i11, f11, f12, i14, f14);
    }

    /* renamed from: component1, reason: from getter */
    public final int getWidthPx() {
        return this.widthPx;
    }

    /* renamed from: component2, reason: from getter */
    public final int getHeightPx() {
        return this.heightPx;
    }

    /* renamed from: component3, reason: from getter */
    public final float getWidthDp() {
        return this.widthDp;
    }

    /* renamed from: component4, reason: from getter */
    public final float getHeightDp() {
        return this.heightDp;
    }

    /* renamed from: component5, reason: from getter */
    public final int getDpi() {
        return this.dpi;
    }

    /* renamed from: component6, reason: from getter */
    public final float getPxRatio() {
        return this.pxRatio;
    }

    @NotNull
    public final ScreenData copy(int widthPx, int heightPx, float widthDp, float heightDp, int dpi, float pxRatio) {
        return new ScreenData(widthPx, heightPx, widthDp, heightDp, dpi, pxRatio);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ScreenData)) {
            return false;
        }
        ScreenData screenData = (ScreenData) other;
        return this.widthPx == screenData.widthPx && this.heightPx == screenData.heightPx && Float.compare(this.widthDp, screenData.widthDp) == 0 && Float.compare(this.heightDp, screenData.heightDp) == 0 && this.dpi == screenData.dpi && Float.compare(this.pxRatio, screenData.pxRatio) == 0;
    }

    public final int getDpi() {
        return this.dpi;
    }

    public final float getHeightDp() {
        return this.heightDp;
    }

    public final int getHeightPx() {
        return this.heightPx;
    }

    public final float getPxRatio() {
        return this.pxRatio;
    }

    public final float getWidthDp() {
        return this.widthDp;
    }

    public final int getWidthPx() {
        return this.widthPx;
    }

    public int hashCode() {
        return Float.hashCode(this.pxRatio) + u4.a(this.dpi, m.d(this.heightDp, m.d(this.widthDp, u4.a(this.heightPx, Integer.hashCode(this.widthPx) * 31, 31), 31), 31), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ScreenData(widthPx=");
        sb2.append(this.widthPx);
        sb2.append(", heightPx=");
        sb2.append(this.heightPx);
        sb2.append(", widthDp=");
        sb2.append(this.widthDp);
        sb2.append(", heightDp=");
        sb2.append(this.heightDp);
        sb2.append(", dpi=");
        sb2.append(this.dpi);
        sb2.append(", pxRatio=");
        return c9.k(sb2, this.pxRatio, ')');
    }
}
