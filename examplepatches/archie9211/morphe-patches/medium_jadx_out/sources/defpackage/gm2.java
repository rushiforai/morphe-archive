package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class gm2 implements ServiceConnection {
    public Context a;

    public abstract void a(ComponentName componentName, lig ligVar);

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        xt5 xt5Var;
        if (this.a == null) {
            ygf.f("Custom Tabs Service connected before an applicationcontext has been provided.");
            return;
        }
        int i = wt5.e;
        if (iBinder == null) {
            xt5Var = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("android.support.customtabs.ICustomTabsService");
            if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof xt5)) {
                vt5 vt5Var = new vt5();
                vt5Var.e = iBinder;
                xt5Var = vt5Var;
            } else {
                xt5Var = (xt5) iInterfaceQueryLocalInterface;
            }
        }
        a(componentName, new lig(xt5Var, componentName, false, 17));
    }
}
