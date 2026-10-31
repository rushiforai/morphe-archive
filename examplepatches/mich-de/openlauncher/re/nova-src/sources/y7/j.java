package y7;

import android.net.ConnectivityManager;
import android.net.Network;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class j {
    @Nullable
    public static final Network a(@NotNull ConnectivityManager connectivityManager) {
        Intrinsics.g(connectivityManager, "<this>");
        return connectivityManager.getActiveNetwork();
    }
}
