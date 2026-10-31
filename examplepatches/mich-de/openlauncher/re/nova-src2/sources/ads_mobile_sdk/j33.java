package ads_mobile_sdk;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;

/* loaded from: classes2.dex */
public final class j33 implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ k33 f5115a;

    public j33(k33 k33Var) {
        this.f5115a = k33Var;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        k33 k33Var = this.f5115a;
        k33Var.f5479b.a("ServiceConnectionImpl.onServiceConnected(%s)", componentName);
        k33Var.b(new h33(this, iBinder));
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        k33 k33Var = this.f5115a;
        k33Var.f5479b.a("ServiceConnectionImpl.onServiceDisconnected(%s)", componentName);
        k33Var.b(new f33(this, 1));
    }
}
