package n10;

import android.app.Activity;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkRequest;
import android.os.Build;
import db0.n0;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;

/* loaded from: classes.dex */
public final class h implements c {

    /* renamed from: a, reason: collision with root package name */
    public final a f77694a;

    /* renamed from: b, reason: collision with root package name */
    public final f f77695b;

    /* renamed from: c, reason: collision with root package name */
    public final ConnectivityManager.NetworkCallback f77696c;

    /* renamed from: d, reason: collision with root package name */
    public Activity f77697d;

    /* renamed from: e, reason: collision with root package name */
    public ConnectivityManager f77698e;

    public h(n0 n0Var) {
        this.f77694a = new a(n0Var, 3);
        f fVar = new f(this, n0Var);
        this.f77695b = fVar;
        this.f77696c = Build.VERSION.SDK_INT >= 31 ? new g(this) : fVar;
    }

    @Override // n10.c
    public final void a() {
        ConnectivityManager connectivityManager = this.f77698e;
        if (connectivityManager != null) {
            connectivityManager.unregisterNetworkCallback(this.f77696c);
        }
        Activity activity = this.f77697d;
        if (activity != null) {
            activity.unregisterReceiver(this.f77694a);
        }
        this.f77697d = null;
        this.f77698e = null;
    }

    @Override // n10.c
    public final void b(Activity activity) {
        ConnectivityManager connectivityManager = (ConnectivityManager) activity.getSystemService(ConnectivityManager.class);
        connectivityManager.registerNetworkCallback(new NetworkRequest.Builder().addTransportType(1).build(), this.f77696c);
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        Unit unit = Unit.f71706a;
        activity.registerReceiver(this.f77694a, intentFilter);
        this.f77697d = activity;
        this.f77698e = connectivityManager;
    }

    @Override // n10.c
    public final List c() {
        return EmptyList.f71733a;
    }
}
