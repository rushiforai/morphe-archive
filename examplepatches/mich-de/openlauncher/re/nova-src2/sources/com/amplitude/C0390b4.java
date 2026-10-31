package com.amplitude;

import android.net.ConnectivityManager;
import android.net.Network;
import com.amplitude.common.Logger;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.b4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0390b4 extends ConnectivityManager.NetworkCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0396c4 f20500a;

    public C0390b4(C0396c4 c0396c4) {
        this.f20500a = c0396c4;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onAvailable(Network network) {
        Intrinsics.g(network, "network");
        M2 m22 = this.f20500a.f20511c;
        if (m22 != null) {
            Logger logger = m22.f20327a.getLogger();
            if (logger != null) {
                logger.debug("UnmeteredNetworkListener, onNetworkAvailable, disabling bandwidth throttler.");
            }
            m22.f20327a.bandwidthThrottler.f20794a = false;
            m22.f20327a.flush();
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) {
        Intrinsics.g(network, "network");
        M2 m22 = this.f20500a.f20511c;
        if (m22 != null) {
            Logger logger = m22.f20327a.getLogger();
            if (logger != null) {
                logger.debug("UnmeteredNetworkListener, onNetworkUnavailable, enabling bandwidth throttler.");
            }
            m22.f20327a.bandwidthThrottler.f20794a = true;
        }
    }
}
