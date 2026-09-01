package defpackage;

import android.os.IBinder;
import android.os.RemoteException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lif implements IBinder.DeathRecipient {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ lif(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    private final void a() {
        mgf mgfVar = (mgf) this.b;
        mgfVar.b.b("reportBinderDeath", new Object[0]);
        if (mgfVar.j.get() != null) {
            rd6.m();
            return;
        }
        mgfVar.b.b("%s : Binder has died.", mgfVar.c);
        Iterator it2 = mgfVar.d.iterator();
        while (it2.hasNext()) {
            ((kif) it2.next()).a(new RemoteException(String.valueOf(mgfVar.c).concat(" : Binder has died.")));
        }
        mgfVar.d.clear();
        synchronized (mgfVar.f) {
            mgfVar.d();
        }
    }

    @Override // android.os.IBinder.DeathRecipient
    public final void binderDied() {
        switch (this.a) {
            case 0:
                a();
                return;
            default:
                bmg bmgVar = (bmg) this.b;
                bmgVar.b.h("reportBinderDeath", new Object[0]);
                if (bmgVar.i.get() != null) {
                    rd6.m();
                    return;
                }
                bmgVar.b.h("%s : Binder has died.", bmgVar.c);
                for (aag aagVar : bmgVar.d) {
                    RemoteException remoteException = new RemoteException(String.valueOf(bmgVar.c).concat(" : Binder has died."));
                    wfd wfdVar = aagVar.a;
                    if (wfdVar != null) {
                        wfdVar.c(remoteException);
                    }
                }
                bmgVar.d.clear();
                synchronized (bmgVar.f) {
                    bmgVar.c();
                    break;
                }
                return;
        }
    }
}
