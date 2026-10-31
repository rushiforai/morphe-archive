package io.branch.search.internal.client.ads;

import a80.m;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3214j8;
import io.branch.search.internal.C3231k8;
import io.branch.search.internal.C3380t5;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0016\b\u0087\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0012\u001a\u00020\u0002\u0012\u0006\u0010\u0013\u001a\u00020\u0005\u0012\u0006\u0010\u0014\u001a\u00020\b\u0012\u0006\u0010\u0015\u001a\u00020\u000b\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e¢\u0006\u0004\b3\u00104J\u0010\u0010\u0003\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0006\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\t\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\f\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0010JL\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0012\u001a\u00020\u00022\b\b\u0002\u0010\u0013\u001a\u00020\u00052\b\b\u0002\u0010\u0014\u001a\u00020\b2\b\b\u0002\u0010\u0015\u001a\u00020\u000b2\b\b\u0002\u0010\u0016\u001a\u00020\u000e2\b\b\u0002\u0010\u0017\u001a\u00020\u000eHÆ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001b\u001a\u00020\u001aHÖ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u001d\u0010\nJ\u001a\u0010 \u001a\u00020\u001f2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b \u0010!R\u0017\u0010\u0012\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010\u0004R\u0017\u0010\u0013\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b%\u0010&\u001a\u0004\b'\u0010\u0007R\u0017\u0010\u0014\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b(\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0015\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b+\u0010,\u001a\u0004\b-\u0010\rR\u0017\u0010\u0016\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b.\u0010/\u001a\u0004\b0\u0010\u0010R\u0017\u0010\u0017\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b1\u0010/\u001a\u0004\b2\u0010\u0010¨\u00065"}, d2 = {"Lio/branch/search/internal/client/ads/ImpressionInfo;", b.f42142b, "Lio/branch/search/internal/client/ads/Impressable;", "component1", "()Lio/branch/search/internal/client/ads/Impressable;", "Lio/branch/search/internal/client/ads/UiContext;", "component2", "()Lio/branch/search/internal/client/ads/UiContext;", b.f42142b, "component3", "()I", b.f42142b, "component4", "()F", b.f42142b, "component5", "()J", "component6", "item", "context", "position", "area", "start", "duration", "copy", "(Lio/branch/search/internal/client/ads/Impressable;Lio/branch/search/internal/client/ads/UiContext;IFJJ)Lio/branch/search/internal/client/ads/ImpressionInfo;", b.f42142b, "toString", "()Ljava/lang/String;", "hashCode", InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "Lio/branch/search/internal/client/ads/Impressable;", "getItem", "b", "Lio/branch/search/internal/client/ads/UiContext;", "getContext", "c", "I", "getPosition", "d", "F", "getArea", "e", "J", "getStart", InneractiveMediationDefs.GENDER_FEMALE, "getDuration", "<init>", "(Lio/branch/search/internal/client/ads/Impressable;Lio/branch/search/internal/client/ads/UiContext;IFJJ)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class ImpressionInfo {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final Impressable item;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final UiContext context;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public final int position;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public final float area;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    public final long start;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    public final long duration;

    public ImpressionInfo(@NotNull Impressable item, @NotNull UiContext context, int i5, float f11, long j11, long j12) {
        Intrinsics.g(item, "item");
        Intrinsics.g(context, "context");
        this.item = item;
        this.context = context;
        this.position = i5;
        this.area = f11;
        this.start = j11;
        this.duration = j12;
    }

    public static /* synthetic */ ImpressionInfo copy$default(ImpressionInfo impressionInfo, Impressable impressable, UiContext uiContext, int i5, float f11, long j11, long j12, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            impressable = impressionInfo.item;
        }
        if ((i11 & 2) != 0) {
            uiContext = impressionInfo.context;
        }
        if ((i11 & 4) != 0) {
            i5 = impressionInfo.position;
        }
        if ((i11 & 8) != 0) {
            f11 = impressionInfo.area;
        }
        if ((i11 & 16) != 0) {
            j11 = impressionInfo.start;
        }
        if ((i11 & 32) != 0) {
            j12 = impressionInfo.duration;
        }
        long j13 = j12;
        long j14 = j11;
        return impressionInfo.copy(impressable, uiContext, i5, f11, j14, j13);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final Impressable getItem() {
        return this.item;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final UiContext getContext() {
        return this.context;
    }

    /* renamed from: component3, reason: from getter */
    public final int getPosition() {
        return this.position;
    }

    /* renamed from: component4, reason: from getter */
    public final float getArea() {
        return this.area;
    }

    /* renamed from: component5, reason: from getter */
    public final long getStart() {
        return this.start;
    }

    /* renamed from: component6, reason: from getter */
    public final long getDuration() {
        return this.duration;
    }

    @NotNull
    public final ImpressionInfo copy(@NotNull Impressable item, @NotNull UiContext context, int position, float area, long start, long duration) {
        Intrinsics.g(item, "item");
        Intrinsics.g(context, "context");
        return new ImpressionInfo(item, context, position, area, start, duration);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ImpressionInfo)) {
            return false;
        }
        ImpressionInfo impressionInfo = (ImpressionInfo) other;
        return Intrinsics.b(this.item, impressionInfo.item) && this.context == impressionInfo.context && this.position == impressionInfo.position && Float.valueOf(this.area).equals(Float.valueOf(impressionInfo.area)) && this.start == impressionInfo.start && this.duration == impressionInfo.duration;
    }

    public final float getArea() {
        return this.area;
    }

    @NotNull
    public final UiContext getContext() {
        return this.context;
    }

    public final long getDuration() {
        return this.duration;
    }

    @NotNull
    public final Impressable getItem() {
        return this.item;
    }

    public final int getPosition() {
        return this.position;
    }

    public final long getStart() {
        return this.start;
    }

    public int hashCode() {
        return Long.hashCode(this.duration) + C3231k8.a(this.start, m.d(this.area, C3214j8.a(this.position, (this.context.hashCode() + (this.item.hashCode() * 31)) * 31, 31), 31), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ImpressionInfo(item=");
        sb2.append(this.item);
        sb2.append(", context=");
        sb2.append(this.context);
        sb2.append(", position=");
        sb2.append(this.position);
        sb2.append(", area=");
        sb2.append(this.area);
        sb2.append(", start=");
        sb2.append(this.start);
        sb2.append(", duration=");
        return C3380t5.a(sb2, this.duration, ')');
    }
}
