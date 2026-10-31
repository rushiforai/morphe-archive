package com.amplitude;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import com.amplitude.common.Logger;
import kotlin.ExceptionsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class Z3 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f20455a;

    /* renamed from: b, reason: collision with root package name */
    public final Logger f20456b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f20457c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f20458d;

    public Z3(Context context, Logger logger) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        this.f20455a = context;
        this.f20456b = logger;
        this.f20458d = true;
        boolean z11 = context.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") == 0;
        this.f20457c = z11;
        if (z11) {
            return;
        }
        logger.warn("No ACCESS_NETWORK_STATE permission, offline mode is not supported. To enable, add <uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\" /> to your AndroidManifest.xml. Learn more at https://www.docs.developers.amplitude.com/data/sdks/android-kotlin/#offline-mode");
    }

    public final boolean a() {
        NetworkCapabilities networkCapabilities;
        if (!this.f20457c) {
            return false;
        }
        try {
            Object systemService = this.f20455a.getSystemService("connectivity");
            if (!(systemService instanceof ConnectivityManager)) {
                this.f20456b.debug("Service is not an instance of ConnectivityManager. Offline mode is not supported");
                return true;
            }
            if (!this.f20458d) {
                NetworkInfo activeNetworkInfo = ((ConnectivityManager) systemService).getActiveNetworkInfo();
                return activeNetworkInfo != null && activeNetworkInfo.getType() == 1 && activeNetworkInfo.isConnectedOrConnecting();
            }
            Network activeNetwork = ((ConnectivityManager) systemService).getActiveNetwork();
            if (activeNetwork == null || (networkCapabilities = ((ConnectivityManager) systemService).getNetworkCapabilities(activeNetwork)) == null) {
                return false;
            }
            return networkCapabilities.hasCapability(11);
        } catch (Throwable th2) {
            this.f20456b.warn("Error checking network connectivity: " + th2.getMessage());
            this.f20456b.warn(ExceptionsKt.b(th2));
            return false;
        }
    }
}
