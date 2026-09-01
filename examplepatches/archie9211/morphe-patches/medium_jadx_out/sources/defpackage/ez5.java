package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ez5 implements ServiceConnection {
    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        componentName.getClass();
        iBinder.getClass();
        AtomicBoolean atomicBoolean = fz5.a;
        Context contextA = f94.a();
        qz5 qz5Var = qz5.a;
        Object objH = null;
        if (!ec2.a.contains(qz5.class)) {
            try {
                objH = qz5.a.h(contextA, "com.android.vending.billing.IInAppBillingService$Stub", "asInterface", null, new Object[]{iBinder});
            } catch (Throwable th) {
                ec2.a(qz5.class, th);
            }
        }
        fz5.g = objH;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        componentName.getClass();
    }
}
