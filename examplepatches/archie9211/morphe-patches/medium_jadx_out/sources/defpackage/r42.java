package defpackage;

import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r42 implements q42 {
    public final /* synthetic */ int b;
    public final ConnectivityManager c;

    public /* synthetic */ r42(ConnectivityManager connectivityManager, int i) {
        this.b = i;
        this.c = connectivityManager;
    }

    @Override // defpackage.q42
    public final boolean a() {
        int i = this.b;
        ConnectivityManager connectivityManager = this.c;
        switch (i) {
            case 0:
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo != null && activeNetworkInfo.isConnectedOrConnecting()) {
                    break;
                }
                break;
            default:
                NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(connectivityManager.getActiveNetwork());
                if (networkCapabilities != null && networkCapabilities.hasCapability(12)) {
                    break;
                }
                break;
        }
        return true;
    }
}
