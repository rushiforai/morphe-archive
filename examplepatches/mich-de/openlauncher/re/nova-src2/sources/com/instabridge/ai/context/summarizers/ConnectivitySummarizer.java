package com.instabridge.ai.context.summarizers;

import b.u4;
import b70.g;
import com.instabridge.ai.context.collectors.ConnectivityData;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0005¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/context/summarizers/ConnectivitySummarizer;", b.f42142b, "<init>", "()V", "summarize", b.f42142b, "data", "Lcom/instabridge/ai/context/collectors/ConnectivityData;", "syncTime", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ConnectivitySummarizer {
    public static final int $stable = 0;

    @NotNull
    public final String summarize(@NotNull ConnectivityData data, @NotNull String syncTime) {
        Intrinsics.g(data, "data");
        Intrinsics.g(syncTime, "syncTime");
        ArrayList arrayList = new ArrayList();
        arrayList.add("Network: " + data.getNetworkType());
        if (data.getWifiSsid() != null) {
            arrayList.add("Wi-Fi: " + data.getWifiSsid());
            Integer wifiSignalStrength = data.getWifiSignalStrength();
            if (wifiSignalStrength != null) {
                arrayList.add("Signal: " + wifiSignalStrength.intValue() + '%');
            }
        }
        String carrier = data.getCarrier();
        if (carrier != null) {
            arrayList.add("Carrier: ".concat(carrier));
        }
        String cellularType = data.getCellularType();
        if (cellularType != null) {
            arrayList.add("Cellular: ".concat(cellularType));
        }
        StringBuilder sbK = u4.k("Connectivity (synced ", syncTime, "): ");
        sbK.append(g.f1(arrayList, ", ", null, null, 0, null, 62));
        return sbK.toString();
    }
}
