package com.amplitude.core.platform;

import b70.d;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.GroupIdentifyEvent;
import com.amplitude.core.events.IdentifyEvent;
import com.amplitude.core.events.RevenueEvent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0004J\u001a\u0010\t\u001a\u00020\u00072\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00070\u000bJ\u0010\u0010\f\u001a\u0004\u0018\u00010\r2\u0006\u0010\u000e\u001a\u00020\rJ\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\b\u001a\u00020\u0004J\r\u0010\u0011\u001a\u00020\u0012H\u0000¢\u0006\u0002\b\u0013R\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Lcom/amplitude/core/platform/Mediator;", b.f42142b, "plugins", "Ljava/util/concurrent/CopyOnWriteArrayList;", "Lcom/amplitude/core/platform/Plugin;", "(Ljava/util/concurrent/CopyOnWriteArrayList;)V", "add", b.f42142b, "plugin", "applyClosure", "closure", "Lkotlin/Function1;", "execute", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, "remove", b.f42142b, "size", b.f42142b, "size$core", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class Mediator {

    @NotNull
    private final CopyOnWriteArrayList<Plugin> plugins;

    /* JADX WARN: Multi-variable type inference failed */
    public Mediator() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    public final void add(@NotNull Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        this.plugins.add(plugin);
    }

    public final void applyClosure(@NotNull Function1<? super Plugin, Unit> closure) {
        Intrinsics.g(closure, "closure");
        for (Plugin plugin : this.plugins) {
            Intrinsics.d(plugin);
            closure.invoke(plugin);
        }
    }

    @Nullable
    public final BaseEvent execute(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        for (Plugin plugin : this.plugins) {
            if (event != null) {
                if (plugin instanceof DestinationPlugin) {
                    try {
                        ((DestinationPlugin) plugin).process(event);
                    } catch (Exception e3) {
                        e3.printStackTrace();
                    }
                } else if (plugin instanceof EventPlugin) {
                    event = plugin.execute(event);
                    if (event instanceof IdentifyEvent) {
                        event = ((EventPlugin) plugin).identify((IdentifyEvent) event);
                    } else if (event instanceof GroupIdentifyEvent) {
                        event = ((EventPlugin) plugin).groupIdentify((GroupIdentifyEvent) event);
                    } else if (event instanceof RevenueEvent) {
                        event = ((EventPlugin) plugin).revenue((RevenueEvent) event);
                    } else if (event != null) {
                        event = ((EventPlugin) plugin).track(event);
                    }
                } else {
                    event = plugin.execute(event);
                }
            }
        }
        return event;
    }

    public final boolean remove(@NotNull final Plugin plugin) {
        Intrinsics.g(plugin, "plugin");
        return d.E0(this.plugins, new Function1<Plugin, Boolean>() { // from class: com.amplitude.core.platform.Mediator.remove.1
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final Boolean invoke(Plugin plugin2) {
                return Boolean.valueOf(plugin2 == plugin);
            }
        });
    }

    public final int size$core() {
        return this.plugins.size();
    }

    public Mediator(@NotNull CopyOnWriteArrayList<Plugin> plugins) {
        Intrinsics.g(plugins, "plugins");
        this.plugins = plugins;
    }

    public /* synthetic */ Mediator(CopyOnWriteArrayList copyOnWriteArrayList, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? new CopyOnWriteArrayList() : copyOnWriteArrayList);
    }
}
