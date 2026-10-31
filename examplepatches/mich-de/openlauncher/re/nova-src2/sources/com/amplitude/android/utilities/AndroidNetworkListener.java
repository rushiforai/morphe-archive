package com.amplitude.android.utilities;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import com.amplitude.android.utilities.AndroidNetworkListener;
import com.amplitude.common.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0006\u0018\u00002\u00020\u0001:\u0002\u0010\u0011B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\r\u0010\u000b\u001a\u00020\fH\u0001¢\u0006\u0002\b\rJ\b\u0010\u000e\u001a\u00020\fH\u0007J\u0006\u0010\u000f\u001a\u00020\fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/amplitude/android/utilities/AndroidNetworkListener;", b.f42142b, "context", "Landroid/content/Context;", "logger", "Lcom/amplitude/common/Logger;", "networkCallback", "Lcom/amplitude/android/utilities/AndroidNetworkListener$NetworkChangeCallback;", "(Landroid/content/Context;Lcom/amplitude/common/Logger;Lcom/amplitude/android/utilities/AndroidNetworkListener$NetworkChangeCallback;)V", "networkCallbackForApiLevel21Plus", "Landroid/net/ConnectivityManager$NetworkCallback;", "setupNetworkCallback", b.f42142b, "setupNetworkCallback$android_release", "startListening", "stopListening", "NetworkChangeCallback", "NetworkState", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidNetworkListener {

    @NotNull
    private final Context context;

    @NotNull
    private final Logger logger;

    @NotNull
    private final NetworkChangeCallback networkCallback;

    @Nullable
    private ConnectivityManager.NetworkCallback networkCallbackForApiLevel21Plus;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\b\u0010\u0004\u001a\u00020\u0003H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0005À\u0006\u0001"}, d2 = {"Lcom/amplitude/android/utilities/AndroidNetworkListener$NetworkChangeCallback;", b.f42142b, "onNetworkAvailable", b.f42142b, "onNetworkUnavailable", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public interface NetworkChangeCallback {
        void onNetworkAvailable();

        void onNetworkUnavailable();
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0002\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0002\u0010\tJ\b\u0010\n\u001a\u00020\u000bH\u0002J\"\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0007R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lcom/amplitude/android/utilities/AndroidNetworkListener$NetworkState;", b.f42142b, "network", "Landroid/net/Network;", "networkCallback", "Lcom/amplitude/android/utilities/AndroidNetworkListener$NetworkChangeCallback;", "available", b.f42142b, "blocked", "(Landroid/net/Network;Lcom/amplitude/android/utilities/AndroidNetworkListener$NetworkChangeCallback;ZZ)V", "notifyNetworkCallback", b.f42142b, "update", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class NetworkState {
        private boolean available;
        private boolean blocked;

        @NotNull
        private final Network network;

        @NotNull
        private final NetworkChangeCallback networkCallback;

        public NetworkState(@NotNull Network network, @NotNull NetworkChangeCallback networkCallback, boolean z11, boolean z12) {
            Intrinsics.g(network, "network");
            Intrinsics.g(networkCallback, "networkCallback");
            this.network = network;
            this.networkCallback = networkCallback;
            this.available = z11;
            this.blocked = z12;
            notifyNetworkCallback();
        }

        private final void notifyNetworkCallback() {
            if (!this.available || this.blocked) {
                this.networkCallback.onNetworkUnavailable();
            } else {
                this.networkCallback.onNetworkAvailable();
            }
        }

        public static /* synthetic */ void update$default(NetworkState networkState, Network network, boolean z11, boolean z12, int i5, Object obj) {
            if ((i5 & 2) != 0) {
                z11 = networkState.available;
            }
            if ((i5 & 4) != 0) {
                z12 = networkState.blocked;
            }
            networkState.update(network, z11, z12);
        }

        public final void update(@NotNull Network network, boolean available, boolean blocked) {
            Intrinsics.g(network, "network");
            if (Intrinsics.b(this.network, network)) {
                boolean z11 = (this.available == available && this.blocked == blocked) ? false : true;
                this.available = available;
                this.blocked = blocked;
                if (z11) {
                    notifyNetworkCallback();
                }
            }
        }
    }

    public AndroidNetworkListener(@NotNull Context context, @NotNull Logger logger, @NotNull NetworkChangeCallback networkCallback) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(networkCallback, "networkCallback");
        this.context = context;
        this.logger = logger;
        this.networkCallback = networkCallback;
    }

    @SuppressLint({"MissingPermission"})
    public final void setupNetworkCallback$android_release() {
        Object systemService = this.context.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        final ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
        NetworkRequest networkRequestBuild = new NetworkRequest.Builder().addCapability(12).build();
        ConnectivityManager.NetworkCallback networkCallback = new ConnectivityManager.NetworkCallback() { // from class: com.amplitude.android.utilities.AndroidNetworkListener$setupNetworkCallback$1

            @Nullable
            private AndroidNetworkListener.NetworkState networkState;

            private final boolean available(NetworkCapabilities networkCapabilities) {
                return networkCapabilities.hasCapability(12) && networkCapabilities.hasCapability(16);
            }

            @Override // android.net.ConnectivityManager.NetworkCallback
            public void onAvailable(@NotNull Network network) {
                Intrinsics.g(network, "network");
                NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(network);
                this.networkState = new AndroidNetworkListener.NetworkState(network, this.networkCallback, networkCapabilities != null ? available(networkCapabilities) : true, false);
            }

            @Override // android.net.ConnectivityManager.NetworkCallback
            public void onBlockedStatusChanged(@NotNull Network network, boolean blocked) {
                Intrinsics.g(network, "network");
                AndroidNetworkListener.NetworkState networkState = this.networkState;
                if (networkState != null) {
                    AndroidNetworkListener.NetworkState.update$default(networkState, network, false, blocked, 2, null);
                }
            }

            @Override // android.net.ConnectivityManager.NetworkCallback
            public void onCapabilitiesChanged(@NotNull Network network, @NotNull NetworkCapabilities networkCapabilities) {
                Intrinsics.g(network, "network");
                Intrinsics.g(networkCapabilities, "networkCapabilities");
                AndroidNetworkListener.NetworkState networkState = this.networkState;
                if (networkState != null) {
                    AndroidNetworkListener.NetworkState.update$default(networkState, network, available(networkCapabilities), false, 4, null);
                }
            }

            @Override // android.net.ConnectivityManager.NetworkCallback
            public void onLost(@NotNull Network network) {
                Intrinsics.g(network, "network");
                AndroidNetworkListener.NetworkState networkState = this.networkState;
                if (networkState != null) {
                    AndroidNetworkListener.NetworkState.update$default(networkState, network, false, false, 4, null);
                }
            }

            @Override // android.net.ConnectivityManager.NetworkCallback
            public void onUnavailable() {
                this.networkCallback.onNetworkUnavailable();
            }
        };
        connectivityManager.registerNetworkCallback(networkRequestBuild, networkCallback);
        this.networkCallbackForApiLevel21Plus = networkCallback;
    }

    @SuppressLint({"MissingPermission"})
    public final void startListening() {
        if (!AndroidNetworkConnectivityChecker.INSTANCE.hasNetworkPermission$android_release(this.context)) {
            this.logger.debug("ACCESS_NETWORK_STATE permission not granted, skipping network listener setup");
            return;
        }
        try {
            setupNetworkCallback$android_release();
        } catch (Throwable th2) {
            this.logger.warn("Error starting network listener: " + th2.getMessage());
        }
    }

    public final void stopListening() {
        try {
            Object systemService = this.context.getSystemService("connectivity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
            ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
            ConnectivityManager.NetworkCallback networkCallback = this.networkCallbackForApiLevel21Plus;
            if (networkCallback != null) {
                connectivityManager.unregisterNetworkCallback(networkCallback);
            }
        } catch (IllegalArgumentException | IllegalStateException unused) {
        } catch (Throwable th2) {
            this.logger.warn("Error stopping network listener: " + th2.getMessage());
        }
    }
}
