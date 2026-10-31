package com.bytedance.sdk.openadsdk.pmi;

import android.content.Context;
import android.os.HandlerThread;
import com.bytedance.sdk.component.fby.ycx.lt;
import java.util.List;

/* loaded from: classes2.dex */
public interface zb {
    Context getContext();

    lt getHandler();

    int getOnceLogCount();

    int getOnceLogInterval();

    HandlerThread getSafeHandlerThread(String str, int i5);

    int getUploadIntervalTime();

    boolean isMonitorOpen();

    void onMonitorUpload(List<com.bytedance.sdk.openadsdk.pmi.zb.ycx> list);
}
