package zp;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import w.h;
import w.j;
import w.k;
import w.l;

/* loaded from: classes4.dex */
public final class b extends k {

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ d f98585g;

    public b(d dVar) {
        this.f98585g = dVar;
    }

    @Override // w.k
    public final void onCustomTabsServiceConnected(ComponentName componentName, j jVar) {
        try {
            jVar.f93398a.warmup(0L);
        } catch (RemoteException unused) {
        }
        d dVar = this.f98585g;
        l lVarC = jVar.c(new c(dVar));
        dVar.f98594g = lVarC;
        if (lVarC == null) {
            if (dVar.f98595h != null) {
                dVar.getContext().unbindService(dVar.f98595h);
                dVar.f98594g = null;
                dVar.f98595h = null;
            }
            int i5 = d.f98587i;
            Log.i("zp.d", "Auth using CustomTabs aborted, reason: CustomTabsSession is null. Launching auth in browser instead.");
            dVar.a();
            return;
        }
        h hVar = new h();
        l lVar = dVar.f98594g;
        String packageName = lVar.f93412d.getPackageName();
        Intent intent = hVar.f93401a;
        intent.setPackage(packageName);
        IBinder iBinderAsBinder = lVar.f93411c.asBinder();
        Bundle bundle = new Bundle();
        bundle.putBinder("android.support.customtabs.extra.SESSION", iBinderAsBinder);
        intent.putExtras(bundle);
        hVar.a().a(dVar.getContext(), dVar.f98588a);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
    }
}
