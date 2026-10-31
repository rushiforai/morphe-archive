package com.instabridge.ai.context.summarizers;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J&\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\u0005¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/summarizers/LocationSummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, "placeName", "lat", b.f42142b, "lng", "syncTime", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class LocationSummarizer {
    public static final int $stable = 0;

    @NotNull
    public final String summarize(@NotNull String placeName, double lat, double lng, @NotNull String syncTime) {
        Intrinsics.g(placeName, "placeName");
        Intrinsics.g(syncTime, "syncTime");
        StringBuilder sb2 = new StringBuilder("Location (synced ");
        c0.D(sb2, syncTime, "): ", placeName, " | GPS: ");
        sb2.append(String.format("%.4f", Arrays.copyOf(new Object[]{Double.valueOf(lat)}, 1)));
        sb2.append(", ");
        sb2.append(String.format("%.4f", Arrays.copyOf(new Object[]{Double.valueOf(lng)}, 1)));
        return sb2.toString();
    }
}
