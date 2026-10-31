package com.amplitude.core;

import b70.d;
import com.amplitude.core.platform.ObservePlugin;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\f2\u0006\u0010\u0015\u001a\u00020\u0016J\u000e\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\fR(\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\u0003\u001a\u0004\u0018\u00010\u0004@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\tR\u0017\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR(\u0010\u000f\u001a\u0004\u0018\u00010\u00042\b\u0010\u0003\u001a\u0004\u0018\u00010\u0004@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0007\"\u0004\b\u0011\u0010\t¨\u0006\u0018"}, d2 = {"Lcom/amplitude/core/State;", b.f42142b, "()V", "value", b.f42142b, "deviceId", "getDeviceId", "()Ljava/lang/String;", "setDeviceId", "(Ljava/lang/String;)V", "plugins", b.f42142b, "Lcom/amplitude/core/platform/ObservePlugin;", "getPlugins", "()Ljava/util/List;", "userId", "getUserId", "setUserId", "add", b.f42142b, "plugin", "amplitude", "Lcom/amplitude/core/Amplitude;", "remove", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class State {

    @Nullable
    private String deviceId;

    @NotNull
    private final List<ObservePlugin> plugins = new ArrayList();

    @Nullable
    private String userId;

    public final boolean add(@NotNull ObservePlugin plugin, @NotNull Amplitude amplitude) {
        boolean zAdd;
        Intrinsics.g(plugin, "plugin");
        Intrinsics.g(amplitude, "amplitude");
        synchronized (this.plugins) {
            plugin.setup(amplitude);
            zAdd = this.plugins.add(plugin);
        }
        return zAdd;
    }

    @Nullable
    public final String getDeviceId() {
        return this.deviceId;
    }

    @NotNull
    public final List<ObservePlugin> getPlugins() {
        return this.plugins;
    }

    @Nullable
    public final String getUserId() {
        return this.userId;
    }

    public final boolean remove(@NotNull final ObservePlugin plugin) {
        boolean zE0;
        Intrinsics.g(plugin, "plugin");
        synchronized (this.plugins) {
            zE0 = d.E0(this.plugins, new Function1<ObservePlugin, Boolean>() { // from class: com.amplitude.core.State$remove$1$1
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final Boolean invoke(@NotNull ObservePlugin it) {
                    Intrinsics.g(it, "it");
                    return Boolean.valueOf(it == plugin);
                }
            });
        }
        return zE0;
    }

    public final void setDeviceId(@Nullable String str) {
        this.deviceId = str;
        Iterator<T> it = this.plugins.iterator();
        while (it.hasNext()) {
            ((ObservePlugin) it.next()).onDeviceIdChanged(str);
        }
    }

    public final void setUserId(@Nullable String str) {
        this.userId = str;
        Iterator<T> it = this.plugins.iterator();
        while (it.hasNext()) {
            ((ObservePlugin) it.next()).onUserIdChanged(str);
        }
    }
}
