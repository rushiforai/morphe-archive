package io.branch.search.internal.client.ads;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3214j8;
import io.branch.search.internal.C3380t5;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0011\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u000e\u001a\u00020\u0002\u0012\u0006\u0010\u000f\u001a\u00020\u0005\u0012\u0006\u0010\u0010\u001a\u00020\b\u0012\u0006\u0010\u0011\u001a\u00020\u000b¢\u0006\u0004\b(\u0010)J\u0010\u0010\u0003\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0006\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\t\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\f\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b\f\u0010\rJ8\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u000e\u001a\u00020\u00022\b\b\u0002\u0010\u000f\u001a\u00020\u00052\b\b\u0002\u0010\u0010\u001a\u00020\b2\b\b\u0002\u0010\u0011\u001a\u00020\u000bHÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0017\u0010\nJ\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u000e\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u001e\u0010\u0004R\u0017\u0010\u000f\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u001f\u0010 \u001a\u0004\b!\u0010\u0007R\u0017\u0010\u0010\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010\nR\u0017\u0010\u0011\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b%\u0010&\u001a\u0004\b'\u0010\r¨\u0006*"}, d2 = {"Lio/branch/search/internal/client/ads/ClickInfo;", b.f42142b, "Lio/branch/search/internal/client/ads/Clickable;", "component1", "()Lio/branch/search/internal/client/ads/Clickable;", "Lio/branch/search/internal/client/ads/UiContext;", "component2", "()Lio/branch/search/internal/client/ads/UiContext;", b.f42142b, "component3", "()I", b.f42142b, "component4", "()J", "item", "context", "position", "timestamp", "copy", "(Lio/branch/search/internal/client/ads/Clickable;Lio/branch/search/internal/client/ads/UiContext;IJ)Lio/branch/search/internal/client/ads/ClickInfo;", b.f42142b, "toString", "()Ljava/lang/String;", "hashCode", InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "Lio/branch/search/internal/client/ads/Clickable;", "getItem", "b", "Lio/branch/search/internal/client/ads/UiContext;", "getContext", "c", "I", "getPosition", "d", "J", "getTimestamp", "<init>", "(Lio/branch/search/internal/client/ads/Clickable;Lio/branch/search/internal/client/ads/UiContext;IJ)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class ClickInfo {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final Clickable item;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final UiContext context;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public final int position;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public final long timestamp;

    public ClickInfo(@NotNull Clickable item, @NotNull UiContext context, int i5, long j11) {
        Intrinsics.g(item, "item");
        Intrinsics.g(context, "context");
        this.item = item;
        this.context = context;
        this.position = i5;
        this.timestamp = j11;
    }

    public static /* synthetic */ ClickInfo copy$default(ClickInfo clickInfo, Clickable clickable, UiContext uiContext, int i5, long j11, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            clickable = clickInfo.item;
        }
        if ((i11 & 2) != 0) {
            uiContext = clickInfo.context;
        }
        if ((i11 & 4) != 0) {
            i5 = clickInfo.position;
        }
        if ((i11 & 8) != 0) {
            j11 = clickInfo.timestamp;
        }
        int i12 = i5;
        return clickInfo.copy(clickable, uiContext, i12, j11);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final Clickable getItem() {
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
    public final long getTimestamp() {
        return this.timestamp;
    }

    @NotNull
    public final ClickInfo copy(@NotNull Clickable item, @NotNull UiContext context, int position, long timestamp) {
        Intrinsics.g(item, "item");
        Intrinsics.g(context, "context");
        return new ClickInfo(item, context, position, timestamp);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ClickInfo)) {
            return false;
        }
        ClickInfo clickInfo = (ClickInfo) other;
        return Intrinsics.b(this.item, clickInfo.item) && this.context == clickInfo.context && this.position == clickInfo.position && this.timestamp == clickInfo.timestamp;
    }

    @NotNull
    public final UiContext getContext() {
        return this.context;
    }

    @NotNull
    public final Clickable getItem() {
        return this.item;
    }

    public final int getPosition() {
        return this.position;
    }

    public final long getTimestamp() {
        return this.timestamp;
    }

    public int hashCode() {
        return Long.hashCode(this.timestamp) + C3214j8.a(this.position, (this.context.hashCode() + (this.item.hashCode() * 31)) * 31, 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ClickInfo(item=");
        sb2.append(this.item);
        sb2.append(", context=");
        sb2.append(this.context);
        sb2.append(", position=");
        sb2.append(this.position);
        sb2.append(", timestamp=");
        return C3380t5.a(sb2, this.timestamp, ')');
    }
}
