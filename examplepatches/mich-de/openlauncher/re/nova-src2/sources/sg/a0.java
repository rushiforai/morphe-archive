package sg;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;

/* loaded from: classes.dex */
public final class a0 implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public final int f87414a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f87415b;

    public a0(e eVar, int i5) {
        this.f87415b = eVar;
        this.f87414a = i5;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        e eVar = this.f87415b;
        if (iBinder == null) {
            eVar.zzf();
            return;
        }
        synchronized (eVar.zzh()) {
            try {
                IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGmsServiceBroker");
                eVar.zzi((iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof s)) ? new s(iBinder) : (s) iInterfaceQueryLocalInterface);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        e eVar2 = this.f87415b;
        int i5 = this.f87414a;
        eVar2.getClass();
        c0 c0Var = new c0(eVar2, 0, null);
        y yVar = eVar2.zzb;
        yVar.sendMessage(yVar.obtainMessage(7, i5, -1, c0Var));
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        e eVar = this.f87415b;
        synchronized (eVar.zzh()) {
            eVar.zzi(null);
        }
        e eVar2 = this.f87415b;
        int i5 = this.f87414a;
        y yVar = eVar2.zzb;
        yVar.sendMessage(yVar.obtainMessage(6, i5, 1));
    }
}
