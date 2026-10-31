package com.amplitude;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkRequest;
import com.amplitude.common.Logger;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.c4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0396c4 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f20509a;

    /* renamed from: b, reason: collision with root package name */
    public final Logger f20510b;

    /* renamed from: c, reason: collision with root package name */
    public M2 f20511c;

    /* renamed from: d, reason: collision with root package name */
    public C0365a4 f20512d;

    /* renamed from: e, reason: collision with root package name */
    public C0390b4 f20513e;

    public C0396c4(Context context, Logger logger) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        this.f20509a = context;
        this.f20510b = logger;
    }

    public final void a() {
        Object systemService = this.f20509a.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        NetworkRequest networkRequestBuild = new NetworkRequest.Builder().addCapability(11).build();
        C0390b4 c0390b4 = new C0390b4(this);
        this.f20513e = c0390b4;
        ((ConnectivityManager) systemService).registerNetworkCallback(networkRequestBuild, c0390b4);
    }

    public final void b() {
        try {
            a();
        } catch (Throwable th2) {
            this.f20510b.warn("Error starting network listener: " + th2.getMessage());
        }
    }

    public final void c() {
        try {
            Object systemService = this.f20509a.getSystemService("connectivity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
            ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
            C0390b4 c0390b4 = this.f20513e;
            if (c0390b4 != null) {
                connectivityManager.unregisterNetworkCallback(c0390b4);
            }
        } catch (IllegalArgumentException | IllegalStateException unused) {
        } catch (Throwable th2) {
            this.f20510b.warn("Error stopping network listener: " + th2.getMessage());
        }
    }
}
