package defpackage;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qu5 extends Binder implements ru5 {
    public static ru5 a(IBinder iBinder) {
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.facebook.ppml.receiver.IReceiverService");
        if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof ru5)) {
            return (ru5) iInterfaceQueryLocalInterface;
        }
        pu5 pu5Var = new pu5();
        pu5Var.e = iBinder;
        return pu5Var;
    }
}
