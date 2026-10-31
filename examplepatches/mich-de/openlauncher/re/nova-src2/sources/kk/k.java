package kk;

import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.util.Log;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class k extends h {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ IBinder f71539b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ l f71540c;

    public k(l lVar, IBinder iBinder) {
        this.f71540c = lVar;
        this.f71539b = iBinder;
    }

    @Override // kk.h
    public final void a() throws RemoteException {
        f dVar;
        m mVar = (m) this.f71540c.f71542b;
        int i5 = e.f71532b;
        IBinder iBinder = this.f71539b;
        if (iBinder == null) {
            dVar = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.appupdate.protocol.IAppUpdateService");
            dVar = iInterfaceQueryLocalInterface instanceof f ? (f) iInterfaceQueryLocalInterface : new d(iBinder);
        }
        mVar.f71555m = dVar;
        mVar.f71544b.i("linkToDeath", new Object[0]);
        try {
            mVar.f71555m.asBinder().linkToDeath(mVar.f71552j, 0);
        } catch (RemoteException e3) {
            ex.a aVar = mVar.f71544b;
            Object[] objArr = new Object[0];
            if (Log.isLoggable("PlayCore", 6)) {
                Log.e("PlayCore", ex.a.m(aVar.f53057b, "linkToDeath failed", objArr), e3);
            } else {
                aVar.getClass();
            }
        }
        mVar.f71549g = false;
        Iterator it = mVar.f71546d.iterator();
        while (it.hasNext()) {
            ((Runnable) it.next()).run();
        }
        mVar.f71546d.clear();
    }
}
