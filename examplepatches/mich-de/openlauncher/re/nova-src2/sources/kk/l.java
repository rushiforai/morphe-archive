package kk;

import ab.z;
import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.util.Log;
import mk.o;

/* loaded from: classes3.dex */
public final class l implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71541a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f71542b;

    public /* synthetic */ l(Object obj, int i5) {
        this.f71541a = i5;
        this.f71542b = obj;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        switch (this.f71541a) {
            case 0:
                m mVar = (m) this.f71542b;
                mVar.f71544b.i("ServiceConnectionImpl.onServiceConnected(%s)", componentName);
                mVar.a().post(new k(this, iBinder));
                break;
            case 1:
                if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                    Log.i("ServiceConnMgrImpl", "onServiceConnected: ".concat(String.valueOf(componentName)));
                }
                ((o) this.f71542b).m(new z(this, iBinder, false, 29));
                break;
            case 2:
                rk.g gVar = (rk.g) this.f71542b;
                gVar.f86022b.h("ServiceConnectionImpl.onServiceConnected(%s)", componentName);
                gVar.a().post(new qk.a(this, iBinder));
                break;
            default:
                tk.b bVar = (tk.b) this.f71542b;
                bVar.f89401b.b("ServiceConnectionImpl.onServiceConnected(%s)", componentName);
                bVar.a().post(new ok.c(this, iBinder));
                break;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        switch (this.f71541a) {
            case 0:
                m mVar = (m) this.f71542b;
                mVar.f71544b.i("ServiceConnectionImpl.onServiceDisconnected(%s)", componentName);
                mVar.a().post(new j(this, 1));
                break;
            case 1:
                if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                    Log.i("ServiceConnMgrImpl", "onServiceDisconnected: ".concat(String.valueOf(componentName)));
                }
                ((o) this.f71542b).m(new ai.h(this, 26));
                break;
            case 2:
                rk.g gVar = (rk.g) this.f71542b;
                gVar.f86022b.h("ServiceConnectionImpl.onServiceDisconnected(%s)", componentName);
                gVar.a().post(new rk.f(this, 1));
                break;
            default:
                tk.b bVar = (tk.b) this.f71542b;
                bVar.f89401b.b("ServiceConnectionImpl.onServiceDisconnected(%s)", componentName);
                bVar.a().post(new tk.a(this, 0));
                break;
        }
    }
}
