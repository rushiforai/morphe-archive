package com.instabridge.ai.context.summarizers;

import b.u4;
import b70.g;
import com.instabridge.ai.context.collectors.DeviceStateData;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0005¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/context/summarizers/DeviceStateSummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, "data", "Lcom/instabridge/ai/context/collectors/DeviceStateData;", "syncTime", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class DeviceStateSummarizer {
    public static final int $stable = 0;

    @NotNull
    public final String summarize(@NotNull DeviceStateData data, @NotNull String syncTime) {
        String strM;
        Intrinsics.g(data, "data");
        Intrinsics.g(syncTime, "syncTime");
        ArrayList arrayList = new ArrayList();
        if (data.getWifiConnected()) {
            String wifiSsid = data.getWifiSsid();
            if (wifiSsid == null || (strM = c1.m(')', " (", wifiSsid)) == null) {
                strM = b.f42142b;
            }
            arrayList.add("Wi-Fi connected".concat(strM));
        }
        if (data.getBluetoothEnabled() && data.getBluetoothDeviceCount() > 0) {
            arrayList.add("Bluetooth (" + data.getBluetoothDeviceCount() + " devices)");
        }
        if (arrayList.isEmpty()) {
            return c1.m(')', "Device state: minimal (synced ", syncTime);
        }
        StringBuilder sbK = u4.k("Device state (synced ", syncTime, "): ");
        sbK.append(g.f1(arrayList, ", ", null, null, 0, null, 62));
        return sbK.toString();
    }
}
