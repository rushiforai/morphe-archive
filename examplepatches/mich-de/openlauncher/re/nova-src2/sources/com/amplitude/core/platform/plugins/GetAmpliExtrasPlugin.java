package com.amplitude.core.platform.plugins;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Amplitude;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IngestionMetadata;
import com.amplitude.core.platform.Plugin;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012B\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0016J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0003\u001a\u00020\u0004H\u0016R\u001a\u0010\u0003\u001a\u00020\u0004X\u0096.¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\u00020\nX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0013"}, d2 = {"Lcom/amplitude/core/platform/plugins/GetAmpliExtrasPlugin;", "Lcom/amplitude/core/platform/Plugin;", "()V", "amplitude", "Lcom/amplitude/core/Amplitude;", "getAmplitude", "()Lcom/amplitude/core/Amplitude;", "setAmplitude", "(Lcom/amplitude/core/Amplitude;)V", TTConst.TRACK_TYPE, "Lcom/amplitude/core/platform/Plugin$Type;", "getType", "()Lcom/amplitude/core/platform/Plugin$Type;", "execute", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, "setup", b.f42142b, k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class GetAmpliExtrasPlugin implements Plugin {

    @NotNull
    public static final String AMP_AMPLI = "ampli";
    public Amplitude amplitude;

    @NotNull
    private final Plugin.Type type = Plugin.Type.Enrichment;

    @Override // com.amplitude.core.platform.Plugin
    @NotNull
    public BaseEvent execute(@NotNull BaseEvent event) {
        Object obj;
        Intrinsics.g(event, "event");
        Map<String, Object> extra = event.getExtra();
        if (extra != null && (obj = extra.get(AMP_AMPLI)) != null) {
            try {
                Object obj2 = ((Map) obj).get("ingestionMetadata");
                Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.collections.Map<kotlin.String, kotlin.String>");
                Map map = (Map) obj2;
                event.setIngestionMetadata(new IngestionMetadata((String) map.get("sourceName"), (String) map.get("sourceVersion")));
            } catch (Throwable unused) {
            }
        }
        return event;
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

    @Override // com.amplitude.core.platform.Plugin
    @NotNull
    public Plugin.Type getType() {
        return this.type;
    }

    @Override // com.amplitude.core.platform.Plugin
    public void setAmplitude(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "<set-?>");
        this.amplitude = amplitude;
    }

    @Override // com.amplitude.core.platform.Plugin
    public void setup(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        super.setup(amplitude);
    }
}
