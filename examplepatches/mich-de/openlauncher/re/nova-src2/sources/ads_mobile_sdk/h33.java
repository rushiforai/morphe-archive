package ads_mobile_sdk;

import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.util.Log;
import b.y8;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class h33 extends e13 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ IBinder f4207b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j33 f4208c;

    public h33(j33 j33Var, IBinder iBinder) {
        this.f4208c = j33Var;
        this.f4207b = iBinder;
    }

    @Override // ads_mobile_sdk.e13
    public final void a() throws RemoteException {
        y8 i7Var;
        k33 k33Var = this.f4208c.f5115a;
        k33Var.f5486i.getClass();
        int i5 = b.g8.f15857j;
        IBinder iBinder = this.f4207b;
        if (iBinder == null) {
            i7Var = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.prewarm.protocol.IPrewarmService");
            i7Var = iInterfaceQueryLocalInterface instanceof y8 ? (y8) iInterfaceQueryLocalInterface : new b.i7(iBinder, "com.google.android.play.core.prewarm.protocol.IPrewarmService", 1);
        }
        k33Var.n = i7Var;
        c7 c7Var = k33Var.f5479b;
        c7Var.a("linkToDeath", new Object[0]);
        try {
            k33Var.n.asBinder().linkToDeath(k33Var.f5488k, 0);
        } catch (RemoteException e3) {
            Object[] objArr = new Object[0];
            c7Var.getClass();
            if (Log.isLoggable("PlayCore", 6)) {
                Log.e("PlayCore", c7.a((String) c7Var.f1694a, "linkToDeath failed", objArr), e3);
            }
        }
        k33Var.f5484g = false;
        Iterator it = k33Var.f5481d.iterator();
        while (it.hasNext()) {
            ((Runnable) it.next()).run();
        }
        k33Var.f5481d.clear();
    }
}
