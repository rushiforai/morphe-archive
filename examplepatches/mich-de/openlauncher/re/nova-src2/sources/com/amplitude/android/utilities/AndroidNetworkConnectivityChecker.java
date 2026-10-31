package com.amplitude.android.utilities;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import com.amplitude.common.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.ExceptionsKt;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u0000 \f2\u00020\u0001:\u0001\fB\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0002J\b\u0010\u000b\u001a\u00020\bH\u0007R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lcom/amplitude/android/utilities/AndroidNetworkConnectivityChecker;", b.f42142b, "context", "Landroid/content/Context;", "logger", "Lcom/amplitude/common/Logger;", "(Landroid/content/Context;Lcom/amplitude/common/Logger;)V", "hasNetworkTransport", b.f42142b, "capabilities", "Landroid/net/NetworkCapabilities;", "isConnected", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class AndroidNetworkConnectivityChecker {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final Context context;

    @NotNull
    private final Logger logger;

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0015\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0000¢\u0006\u0002\b\u0007¨\u0006\b"}, d2 = {"Lcom/amplitude/android/utilities/AndroidNetworkConnectivityChecker$Companion;", b.f42142b, "()V", "hasNetworkPermission", b.f42142b, "context", "Landroid/content/Context;", "hasNetworkPermission$android_release", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final boolean hasNetworkPermission$android_release(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return context.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") == 0;
        }

        private Companion() {
        }
    }

    public AndroidNetworkConnectivityChecker(@NotNull Context context, @NotNull Logger logger) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        this.context = context;
        this.logger = logger;
        if (INSTANCE.hasNetworkPermission$android_release(context)) {
            return;
        }
        logger.warn("No ACCESS_NETWORK_STATE permission, offline mode is not supported. To enable, add <uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\" /> to your AndroidManifest.xml. Learn more at https://www.docs.developers.amplitude.com/data/sdks/android-kotlin/#offline-mode");
    }

    private final boolean hasNetworkTransport(NetworkCapabilities capabilities) {
        return capabilities.hasTransport(1) || capabilities.hasTransport(0);
    }

    @SuppressLint({"MissingPermission"})
    public final boolean isConnected() {
        NetworkCapabilities networkCapabilities;
        if (!INSTANCE.hasNetworkPermission$android_release(this.context)) {
            return true;
        }
        try {
            Object systemService = this.context.getSystemService("connectivity");
            if (!(systemService instanceof ConnectivityManager)) {
                this.logger.debug("Service is not an instance of ConnectivityManager. Offline mode is not supported");
                return true;
            }
            Network activeNetwork = ((ConnectivityManager) systemService).getActiveNetwork();
            if (activeNetwork == null || (networkCapabilities = ((ConnectivityManager) systemService).getNetworkCapabilities(activeNetwork)) == null) {
                return false;
            }
            return hasNetworkTransport(networkCapabilities);
        } catch (Throwable th2) {
            this.logger.warn("Error checking network connectivity: " + th2.getMessage());
            this.logger.warn(ExceptionsKt.b(th2));
            return true;
        }
    }
}
