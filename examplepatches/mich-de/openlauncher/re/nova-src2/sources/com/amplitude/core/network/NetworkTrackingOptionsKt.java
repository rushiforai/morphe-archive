package com.amplitude.core.network;

import com.amplitude.core.network.NetworkTrackingOptions;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.ListIterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\u001a \u0010\u0002\u001a\u00020\u0003*\b\u0012\u0004\u0012\u00020\u00050\u00042\u0006\u0010\u0006\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\b\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"STAR_WILDCARD", b.f42142b, "matches", b.f42142b, b.f42142b, "Lcom/amplitude/core/network/NetworkTrackingOptions$CaptureRule;", "host", "responseCode", b.f42142b, "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class NetworkTrackingOptionsKt {

    @NotNull
    private static final String STAR_WILDCARD = "*";

    public static final boolean matches(@NotNull List<NetworkTrackingOptions.CaptureRule> list, @NotNull String host, int i5) {
        NetworkTrackingOptions.CaptureRule captureRulePrevious;
        Intrinsics.g(list, "<this>");
        Intrinsics.g(host, "host");
        ListIterator<NetworkTrackingOptions.CaptureRule> listIterator = list.listIterator(list.size());
        while (true) {
            if (!listIterator.hasPrevious()) {
                captureRulePrevious = null;
                break;
            }
            captureRulePrevious = listIterator.previous();
            if (captureRulePrevious.matches(host)) {
                break;
            }
        }
        NetworkTrackingOptions.CaptureRule captureRule = captureRulePrevious;
        if (captureRule == null) {
            return false;
        }
        return captureRule.getStatusCodeRange().contains(Integer.valueOf(i5));
    }
}
