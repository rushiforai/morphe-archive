package kk;

import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import mk.n;
import mk.o;
import tk.t;

/* loaded from: classes3.dex */
public final /* synthetic */ class i implements IBinder.DeathRecipient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71535a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f71536b;

    public /* synthetic */ i(Object obj, int i5) {
        this.f71535a = i5;
        this.f71536b = obj;
    }

    @Override // android.os.IBinder.DeathRecipient
    public final void binderDied() {
        switch (this.f71535a) {
            case 0:
                m mVar = (m) this.f71536b;
                mVar.f71544b.i("reportBinderDeath", new Object[0]);
                if (mVar.f71551i.get() != null) {
                    throw new ClassCastException();
                }
                mVar.f71544b.i("%s : Binder has died.", mVar.f71545c);
                Iterator it = mVar.f71546d.iterator();
                while (it.hasNext()) {
                    h hVar = (h) it.next();
                    RemoteException remoteException = new RemoteException(String.valueOf(mVar.f71545c).concat(" : Binder has died."));
                    fi.j jVar = hVar.f71534a;
                    if (jVar != null) {
                        jVar.b(remoteException);
                    }
                }
                mVar.f71546d.clear();
                synchronized (mVar.f71548f) {
                    mVar.d();
                }
                return;
            case 1:
                o oVar = (o) this.f71536b;
                if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                    Log.i("ServiceConnMgrImpl", "Binder has died: ".concat((String) oVar.f76463d));
                }
                ArrayList arrayList = (ArrayList) oVar.f76464e;
                synchronized (arrayList) {
                    arrayList.clear();
                }
                oVar.m(new n(oVar, 1));
                return;
            case 2:
                rk.g gVar = (rk.g) this.f71536b;
                gVar.f86022b.h("reportBinderDeath", new Object[0]);
                if (gVar.f86029i.get() != null) {
                    throw new ClassCastException();
                }
                gVar.f86022b.h("%s : Binder has died.", gVar.f86023c);
                Iterator it2 = gVar.f86024d.iterator();
                while (it2.hasNext()) {
                    rk.d dVar = (rk.d) it2.next();
                    RemoteException remoteException2 = new RemoteException(String.valueOf(gVar.f86023c).concat(" : Binder has died."));
                    fi.j jVar2 = dVar.f86015a;
                    if (jVar2 != null) {
                        jVar2.b(remoteException2);
                    }
                }
                gVar.f86024d.clear();
                synchronized (gVar.f86026f) {
                    gVar.c();
                }
                return;
            default:
                tk.b bVar = (tk.b) this.f71536b;
                bVar.f89401b.b("reportBinderDeath", new Object[0]);
                if (bVar.f89409j.get() != null) {
                    throw new ClassCastException();
                }
                bVar.f89401b.b("%s : Binder has died.", bVar.f89402c);
                Iterator it3 = bVar.f89403d.iterator();
                while (it3.hasNext()) {
                    ((t) it3.next()).a(new RemoteException(String.valueOf(bVar.f89402c).concat(" : Binder has died.")));
                }
                bVar.f89403d.clear();
                synchronized (bVar.f89405f) {
                    bVar.d();
                }
                return;
        }
    }
}
