package com.instabridge.ai.chat.ui;

import android.content.res.TypedArray;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u001b\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0001H\u0000¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"getColorOrNull", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/res/TypedArray;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "(Landroid/content/res/TypedArray;I)Ljava/lang/Integer;", "instabridge-ai-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ChatThemeKt {
    @Nullable
    public static final Integer getColorOrNull(@NotNull TypedArray typedArray, int i5) {
        Intrinsics.g(typedArray, "<this>");
        if (typedArray.hasValue(i5)) {
            return Integer.valueOf(typedArray.getColor(i5, 0));
        }
        return null;
    }
}
