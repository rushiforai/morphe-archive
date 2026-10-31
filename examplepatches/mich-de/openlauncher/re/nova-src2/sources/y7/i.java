package y7;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class i {
    @Nullable
    public static final NetworkCapabilities a(@NotNull ConnectivityManager connectivityManager, @Nullable Network network) {
        Intrinsics.g(connectivityManager, "<this>");
        return connectivityManager.getNetworkCapabilities(network);
    }

    public static final boolean b(@NotNull NetworkCapabilities networkCapabilities, int i5) {
        Intrinsics.g(networkCapabilities, "<this>");
        return networkCapabilities.hasCapability(i5);
    }

    public static final void c(@NotNull ConnectivityManager connectivityManager, @NotNull ConnectivityManager.NetworkCallback networkCallback) {
        Intrinsics.g(connectivityManager, "<this>");
        Intrinsics.g(networkCallback, "networkCallback");
        connectivityManager.unregisterNetworkCallback(networkCallback);
    }
}
