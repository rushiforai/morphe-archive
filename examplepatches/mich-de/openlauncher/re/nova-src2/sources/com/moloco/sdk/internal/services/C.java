package com.moloco.sdk.internal.services;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.telephony.TelephonyManager;
import com.moloco.sdk.internal.services.A;
import kotlin.Deprecated;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class C implements B {

    /* renamed from: c, reason: collision with root package name */
    public static final int f37590c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f37591a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final y f37592b;

    public C(@NotNull Context context, @NotNull y deviceInfoService) {
        Intrinsics.g(context, "context");
        Intrinsics.g(deviceInfoService, "deviceInfoService");
        this.f37591a = context;
        this.f37592b = deviceInfoService;
    }

    @Override // com.moloco.sdk.internal.services.B
    public boolean a() {
        Object systemService = this.f37591a.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        return a((ConnectivityManager) systemService);
    }

    @Override // com.moloco.sdk.internal.services.B
    @Nullable
    public Integer b() {
        Object systemService = this.f37591a.getSystemService("phone");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.telephony.TelephonyManager");
        String networkOperator = ((TelephonyManager) systemService).getNetworkOperator();
        if (networkOperator == null || networkOperator.length() == 0) {
            return null;
        }
        String strSubstring = networkOperator.substring(3);
        Intrinsics.f(strSubstring, "substring(...)");
        return Integer.valueOf(Integer.parseInt(strSubstring));
    }

    @Override // com.moloco.sdk.internal.services.B
    @NotNull
    public A c() {
        NetworkCapabilities networkCapabilities;
        Object systemService = this.f37591a.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
        if (connectivityManager.getActiveNetwork() != null && (networkCapabilities = connectivityManager.getNetworkCapabilities(connectivityManager.getActiveNetwork())) != null) {
            return networkCapabilities.hasTransport(1) ? A.c.f37588b : networkCapabilities.hasTransport(0) ? new A.a(this.f37592b.invoke().u()) : A.b.f37586b;
        }
        return A.b.f37586b;
    }

    @Override // com.moloco.sdk.internal.services.B
    @Nullable
    public Integer d() {
        Object systemService = this.f37591a.getSystemService("phone");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.telephony.TelephonyManager");
        String networkOperator = ((TelephonyManager) systemService).getNetworkOperator();
        if (networkOperator == null || networkOperator.length() == 0) {
            return null;
        }
        String strSubstring = networkOperator.substring(0, 3);
        Intrinsics.f(strSubstring, "substring(...)");
        return Integer.valueOf(Integer.parseInt(strSubstring));
    }

    @Override // com.moloco.sdk.internal.services.B
    @Deprecated
    @NotNull
    public A invoke() {
        return c();
    }

    public final boolean a(ConnectivityManager connectivityManager) {
        return connectivityManager.getRestrictBackgroundStatus() == 3;
    }
}
