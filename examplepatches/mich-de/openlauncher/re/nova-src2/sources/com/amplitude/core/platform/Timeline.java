package com.amplitude.core.platform;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Amplitude;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.platform.Plugin;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.util.Iterator;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0016\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012J\u001a\u0010\u0013\u001a\u00020\u00102\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00100\u0015J\u001e\u0010\u0016\u001a\u0004\u0018\u00010\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\f2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0017H\u0002J\u001a\u0010\u0016\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u001a\u001a\u00020\u000b2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0017J\u0010\u0010\u001b\u001a\u00020\u00102\u0006\u0010\u001c\u001a\u00020\u0017H\u0016J\u000e\u0010\u001d\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086.¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR \u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f0\nX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u001e"}, d2 = {"Lcom/amplitude/core/platform/Timeline;", b.f42142b, "()V", "amplitude", "Lcom/amplitude/core/Amplitude;", "getAmplitude", "()Lcom/amplitude/core/Amplitude;", "setAmplitude", "(Lcom/amplitude/core/Amplitude;)V", "plugins", b.f42142b, "Lcom/amplitude/core/platform/Plugin$Type;", "Lcom/amplitude/core/platform/Mediator;", "getPlugins$core", "()Ljava/util/Map;", "add", b.f42142b, "plugin", "Lcom/amplitude/core/platform/Plugin;", "applyClosure", "closure", "Lkotlin/Function1;", "applyPlugins", "Lcom/amplitude/core/events/BaseEvent;", com.moloco.sdk.acm.recorder.b.f36154a, DatabaseConstants.EVENT_FIELD, TTConst.TRACK_TYPE, "process", "incomingEvent", "remove", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class Timeline {
    public Amplitude amplitude;

    @NotNull
    private final Map<Plugin.Type, Mediator> plugins;

    /* JADX WARN: Multi-variable type inference failed */
    public Timeline() {
        int i5 = 1;
        this.plugins = MapsKt.j0(new Pair(Plugin.Type.Before, new Mediator(null, i5, 0 == true ? 1 : 0)), new Pair(Plugin.Type.Enrichment, new Mediator(0 == true ? 1 : 0, i5, 0 == true ? 1 : 0)), new Pair(Plugin.Type.Destination, new Mediator(0 == true ? 1 : 0, i5, 0 == true ? 1 : 0)), new Pair(Plugin.Type.Utility, new Mediator(0 == true ? 1 : 0, i5, 0 == true ? 1 : 0)));
    }

    public final void add(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        plugin.setup(getAmplitude());
        Mediator mediator = this.plugins.get(plugin.getType());
        if (mediator != null) {
            mediator.add(plugin);
        }
    }

    public final void applyClosure(@NotNull Function1<? super Plugin, Unit> closure) {
        Intrinsics.g(closure, "closure");
        Iterator<Map.Entry<Plugin.Type, Mediator>> it = this.plugins.entrySet().iterator();
        while (it.hasNext()) {
            it.next().getValue().applyClosure(closure);
        }
    }

    @Nullable
    public final BaseEvent applyPlugins(@NotNull Plugin.Type type, @Nullable BaseEvent event) {
        Intrinsics.g(type, "type");
        return applyPlugins(this.plugins.get(type), event);
    }

    @NotNull
    public final Amplitude getAmplitude() {
        Amplitude amplitude = this.amplitude;
        if (amplitude != null) {
            return amplitude;
        }
        Intrinsics.m("amplitude");
        throw null;
    }

    @NotNull
    public final Map<Plugin.Type, Mediator> getPlugins$core() {
        return this.plugins;
    }

    public void process(@NotNull BaseEvent incomingEvent) {
        Intrinsics.g(incomingEvent, "incomingEvent");
        if (getAmplitude().getOptOut()) {
            return;
        }
        applyPlugins(Plugin.Type.Destination, applyPlugins(Plugin.Type.Enrichment, applyPlugins(Plugin.Type.Before, incomingEvent)));
    }

    public final void remove(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        Iterator<Map.Entry<Plugin.Type, Mediator>> it = this.plugins.entrySet().iterator();
        while (it.hasNext()) {
            if (it.next().getValue().remove(plugin)) {
                plugin.teardown();
            }
        }
    }

    public final void setAmplitude(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "<set-?>");
        this.amplitude = amplitude;
    }

    private final BaseEvent applyPlugins(Mediator mediator, BaseEvent event) {
        if (event == null) {
            return event;
        }
        if (mediator != null) {
            return mediator.execute(event);
        }
        return null;
    }
}
