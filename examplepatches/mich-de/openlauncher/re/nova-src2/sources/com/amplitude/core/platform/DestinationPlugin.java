package com.amplitude.core.platform;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Amplitude;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.GroupIdentifyEvent;
import com.amplitude.core.events.IdentifyEvent;
import com.amplitude.core.events.RevenueEvent;
import com.amplitude.core.platform.Plugin;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b&\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018J\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u001a2\u0006\u0010\u001b\u001a\u00020\u001aJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u001aJ\u000e\u0010\u001d\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018J\u0010\u0010\u001e\u001a\u00020\u00162\u0006\u0010\u0003\u001a\u00020\u0004H\u0016R\u001a\u0010\u0003\u001a\u00020\u0004X\u0096.¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001a\u0010\t\u001a\u00020\nX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000eR\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u001f"}, d2 = {"Lcom/amplitude/core/platform/DestinationPlugin;", "Lcom/amplitude/core/platform/EventPlugin;", "()V", "amplitude", "Lcom/amplitude/core/Amplitude;", "getAmplitude", "()Lcom/amplitude/core/Amplitude;", "setAmplitude", "(Lcom/amplitude/core/Amplitude;)V", "enabled", b.f42142b, "getEnabled$core", "()Z", "setEnabled$core", "(Z)V", "timeline", "Lcom/amplitude/core/platform/Timeline;", TTConst.TRACK_TYPE, "Lcom/amplitude/core/platform/Plugin$Type;", "getType", "()Lcom/amplitude/core/platform/Plugin$Type;", "add", b.f42142b, "plugin", "Lcom/amplitude/core/platform/Plugin;", "execute", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, "process", "remove", "setup", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public abstract class DestinationPlugin implements EventPlugin {
    public Amplitude amplitude;

    @NotNull
    private final Plugin.Type type = Plugin.Type.Destination;

    @NotNull
    private final Timeline timeline = new Timeline();
    private boolean enabled = true;

    public final void add(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        plugin.setAmplitude(getAmplitude());
        this.timeline.add(plugin);
    }

    @Override // com.amplitude.core.platform.Plugin
    @Nullable
    public final BaseEvent execute(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        return null;
    }

    @Override // com.amplitude.core.platform.Plugin
    @NotNull
    public Amplitude getAmplitude() {
        Amplitude amplitude = this.amplitude;
        if (amplitude != null) {
            return amplitude;
        }
        Intrinsics.m("amplitude");
        throw null;
    }

    /* renamed from: getEnabled$core, reason: from getter */
    public final boolean getEnabled() {
        return this.enabled;
    }

    @Override // com.amplitude.core.platform.Plugin
    @NotNull
    public Plugin.Type getType() {
        return this.type;
    }

    @Nullable
    public final BaseEvent process(@Nullable BaseEvent event) {
        if (!this.enabled) {
            return null;
        }
        BaseEvent baseEventApplyPlugins = this.timeline.applyPlugins(Plugin.Type.Enrichment, this.timeline.applyPlugins(Plugin.Type.Before, event));
        if (baseEventApplyPlugins != null) {
            return baseEventApplyPlugins instanceof IdentifyEvent ? identify((IdentifyEvent) baseEventApplyPlugins) : baseEventApplyPlugins instanceof GroupIdentifyEvent ? groupIdentify((GroupIdentifyEvent) baseEventApplyPlugins) : baseEventApplyPlugins instanceof RevenueEvent ? revenue((RevenueEvent) baseEventApplyPlugins) : track(baseEventApplyPlugins);
        }
        return null;
    }

    public final void remove(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        this.timeline.remove(plugin);
    }

    @Override // com.amplitude.core.platform.Plugin
    public void setAmplitude(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "<set-?>");
        this.amplitude = amplitude;
    }

    public final void setEnabled$core(boolean z11) {
        this.enabled = z11;
    }

    @Override // com.amplitude.core.platform.Plugin
    public void setup(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        super.setup(amplitude);
        this.timeline.setAmplitude(amplitude);
    }
}
