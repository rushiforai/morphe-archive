package v7;

import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import kotlin.jvm.internal.Intrinsics;
import o7.r;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final String f92135a;

    static {
        String strE = r.e("NetworkStateTracker");
        Intrinsics.f(strE, "tagWithPrefix(\"NetworkStateTracker\")");
        f92135a = strE;
    }

    public static final t7.e a(ConnectivityManager connectivityManager) {
        NetworkCapabilities networkCapabilitiesA;
        Intrinsics.g(connectivityManager, "<this>");
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        boolean z11 = activeNetworkInfo != null && activeNetworkInfo.isConnected();
        try {
            networkCapabilitiesA = y7.i.a(connectivityManager, y7.j.a(connectivityManager));
        } catch (SecurityException e3) {
            r.c().b(f92135a, "Unable to validate active network", e3);
        }
        boolean zB = networkCapabilitiesA != null ? y7.i.b(networkCapabilitiesA, 16) : false;
        return new t7.e(z11, zB, connectivityManager.isActiveNetworkMetered(), (activeNetworkInfo == null || activeNetworkInfo.isRoaming()) ? false : true);
    }
}
