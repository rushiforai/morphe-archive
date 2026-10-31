package sg;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;

/* loaded from: classes.dex */
public final class b0 extends r {

    /* renamed from: g, reason: collision with root package name */
    public final IBinder f87416g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ e f87417h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(e eVar, int i5, IBinder iBinder, Bundle bundle) {
        super(eVar, i5, bundle);
        this.f87417h = eVar;
        this.f87416g = iBinder;
    }

    @Override // sg.r
    public final boolean a() throws RemoteException {
        IBinder iBinder = this.f87416g;
        try {
            w.h(iBinder);
            String interfaceDescriptor = iBinder.getInterfaceDescriptor();
            e eVar = this.f87417h;
            if (!eVar.getServiceDescriptor().equals(interfaceDescriptor)) {
                String serviceDescriptor = eVar.getServiceDescriptor();
                Log.w("GmsClient", b.c0.s(new StringBuilder(serviceDescriptor.length() + 34 + String.valueOf(interfaceDescriptor).length()), "service descriptor mismatch: ", serviceDescriptor, " vs. ", interfaceDescriptor));
                return false;
            }
            IInterface iInterfaceCreateServiceInterface = eVar.createServiceInterface(iBinder);
            if (iInterfaceCreateServiceInterface == null || !(eVar.zze(2, 4, iInterfaceCreateServiceInterface) || eVar.zze(3, 4, iInterfaceCreateServiceInterface))) {
                return false;
            }
            eVar.zzn(null);
            if (eVar.zzk() == null) {
                return true;
            }
            eVar.zzk().onConnected();
            return true;
        } catch (RemoteException unused) {
            Log.w("GmsClient", "service probably died");
            return false;
        }
    }

    @Override // sg.r
    public final void b(ConnectionResult connectionResult) {
        e eVar = this.f87417h;
        if (eVar.zzl() != null) {
            eVar.zzl().onConnectionFailed(connectionResult);
        }
    }
}
