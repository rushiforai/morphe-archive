package com.moloco.sdk.publisher;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/moloco/sdk/publisher/MediationInfo;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getName", "()Ljava/lang/String;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MediationInfo {
    public static final int $stable = 0;

    @NotNull
    private final String name;

    public MediationInfo(@NotNull String name) {
        Intrinsics.g(name, "name");
        this.name = name;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }
}
