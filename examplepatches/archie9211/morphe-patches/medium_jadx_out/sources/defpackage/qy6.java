package defpackage;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qy6 extends Service implements iy6 {
    public final vwa a = new vwa(this);

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return (ky6) this.a.b;
    }

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        intent.getClass();
        vwa vwaVar = this.a;
        vwaVar.getClass();
        vwaVar.B(ux6.ON_START);
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        vwa vwaVar = this.a;
        vwaVar.getClass();
        vwaVar.B(ux6.ON_CREATE);
        super.onCreate();
    }

    @Override // android.app.Service
    public void onDestroy() {
        vwa vwaVar = this.a;
        vwaVar.getClass();
        vwaVar.B(ux6.ON_STOP);
        vwaVar.B(ux6.ON_DESTROY);
        super.onDestroy();
    }

    @Override // android.app.Service
    public final void onStart(Intent intent, int i) {
        vwa vwaVar = this.a;
        vwaVar.getClass();
        vwaVar.B(ux6.ON_START);
        super.onStart(intent, i);
    }
}
