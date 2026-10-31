package com.amplitude.android.migration;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.Metadata;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/amplitude/android/migration/CursorWindowAllocationException;", "Ljava/lang/RuntimeException;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, b.f42142b, "(Ljava/lang/String;)V", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class CursorWindowAllocationException extends RuntimeException {
    public CursorWindowAllocationException(@Nullable String str) {
        super(str);
    }
}
