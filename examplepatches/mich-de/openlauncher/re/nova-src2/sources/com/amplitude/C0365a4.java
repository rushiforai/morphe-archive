package com.amplitude;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.amplitude.common.Logger;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.a4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0365a4 extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0396c4 f20475a;

    public C0365a4(C0396c4 c0396c4) {
        this.f20475a = c0396c4;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        Intrinsics.g(context, "context");
        Intrinsics.g(intent, "intent");
        if ("android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
            Object systemService = context.getSystemService("connectivity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) systemService).getActiveNetworkInfo();
            boolean z11 = activeNetworkInfo != null && activeNetworkInfo.getType() == 1;
            if (activeNetworkInfo == null || !activeNetworkInfo.isConnectedOrConnecting() || !z11) {
                M2 m22 = this.f20475a.f20511c;
                if (m22 != null) {
                    Logger logger = m22.f20327a.getLogger();
                    if (logger != null) {
                        logger.debug("UnmeteredNetworkListener, onNetworkUnavailable, enabling bandwidth throttler.");
                    }
                    m22.f20327a.bandwidthThrottler.f20794a = true;
                    return;
                }
                return;
            }
            M2 m23 = this.f20475a.f20511c;
            if (m23 != null) {
                Logger logger2 = m23.f20327a.getLogger();
                if (logger2 != null) {
                    logger2.debug("UnmeteredNetworkListener, onNetworkAvailable, disabling bandwidth throttler.");
                }
                m23.f20327a.bandwidthThrottler.f20794a = false;
                m23.f20327a.flush();
            }
        }
    }
}
