package com.amplitude.android.events;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u0001B\u001f\b\u0007\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/amplitude/android/events/IngestionMetadata;", "Lcom/amplitude/core/events/IngestionMetadata;", "sourceName", b.f42142b, "sourceVersion", "(Ljava/lang/String;Ljava/lang/String;)V", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class IngestionMetadata extends com.amplitude.core.events.IngestionMetadata {
    /* JADX WARN: Multi-variable type inference failed */
    @JvmOverloads
    public IngestionMetadata() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @JvmOverloads
    public IngestionMetadata(@Nullable String str) {
        this(str, null, 2, 0 == true ? 1 : 0);
    }

    public /* synthetic */ IngestionMetadata(String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2);
    }

    @JvmOverloads
    public IngestionMetadata(@Nullable String str, @Nullable String str2) {
        super(str, str2);
    }
}
