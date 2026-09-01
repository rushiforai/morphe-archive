package defpackage;

import android.content.Context;
import android.net.ConnectivityManager;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vd8 extends x55 implements x45 {
    public static final vd8 a = new vd8(1, s42.class, "ConnectivityChecker", "ConnectivityChecker(Landroid/content/Context;)Lcoil3/network/ConnectivityChecker;", 1);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Context applicationContext = ((Context) obj).getApplicationContext();
        ConnectivityManager connectivityManager = (ConnectivityManager) applicationContext.getSystemService(ConnectivityManager.class);
        if (connectivityManager != null && nm.a(applicationContext, "android.permission.ACCESS_NETWORK_STATE") == 0) {
            try {
                return Build.VERSION.SDK_INT > 23 ? new r42(connectivityManager, 1) : new r42(connectivityManager, 0);
            } catch (Exception unused) {
            }
        }
        return q42.a;
    }
}
