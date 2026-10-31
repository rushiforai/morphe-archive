package com.amplitude.core.platform;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.platform.Plugin;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b&\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0007\u001a\u0004\u0018\u00010\b2\u0006\u0010\t\u001a\u00020\bJ\u0012\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rH&J\u0012\u0010\u000e\u001a\u00020\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\rH&R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0010"}, d2 = {"Lcom/amplitude/core/platform/ObservePlugin;", "Lcom/amplitude/core/platform/Plugin;", "()V", TTConst.TRACK_TYPE, "Lcom/amplitude/core/platform/Plugin$Type;", "getType", "()Lcom/amplitude/core/platform/Plugin$Type;", "execute", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, "onDeviceIdChanged", b.f42142b, "deviceId", b.f42142b, "onUserIdChanged", "userId", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public abstract class ObservePlugin implements Plugin {

    @NotNull
    private final Plugin.Type type = Plugin.Type.Observe;

    @Override // com.amplitude.core.platform.Plugin
    @Nullable
    public final BaseEvent execute(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        return null;
    }

    @Override // com.amplitude.core.platform.Plugin
    @NotNull
    public Plugin.Type getType() {
        return this.type;
    }

    public abstract void onDeviceIdChanged(@Nullable String deviceId);

    public abstract void onUserIdChanged(@Nullable String userId);
}
