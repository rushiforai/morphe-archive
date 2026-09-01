package defpackage;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lgf implements ServiceConnection {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ lgf(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                mgf mgfVar = (mgf) obj;
                mgfVar.b.b("ServiceConnectionImpl.onServiceConnected(%s)", componentName);
                mgfVar.a().post(new jgf(this, iBinder));
                break;
            default:
                bmg bmgVar = (bmg) obj;
                bmgVar.b.h("ServiceConnectionImpl.onServiceConnected(%s)", componentName);
                bmgVar.a().post(new q3g(this, iBinder));
                break;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        int i = this.a;
        Object obj = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                mgf mgfVar = (mgf) obj;
                mgfVar.b.b("ServiceConnectionImpl.onServiceDisconnected(%s)", componentName);
                mgfVar.a().post(new kgf(0, this));
                break;
            default:
                bmg bmgVar = (bmg) obj;
                bmgVar.b.h("ServiceConnectionImpl.onServiceDisconnected(%s)", componentName);
                bmgVar.a().post(new hfg(i2, this));
                break;
        }
    }
}
