package defpackage;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g0g extends ihf {
    public mn0 f;
    public final int g;

    public g0g(mn0 mn0Var, int i) {
        super("com.google.android.gms.common.internal.IGmsCallbacks", 6);
        this.f = mn0Var;
        this.g = i;
    }

    @Override // defpackage.ihf
    public final boolean l(int i, Parcel parcel, Parcel parcel2) {
        if (i == 1) {
            int i2 = parcel.readInt();
            IBinder strongBinder = parcel.readStrongBinder();
            Bundle bundle = (Bundle) oxf.a(parcel, Bundle.CREATOR);
            oxf.b(parcel);
            vp7.q("onPostInitComplete can be called only once per call to getRemoteService", this.f);
            mn0 mn0Var = this.f;
            int i3 = this.g;
            mn0Var.getClass();
            n3g n3gVar = new n3g(mn0Var, i2, strongBinder, bundle);
            wvf wvfVar = mn0Var.e;
            wvfVar.sendMessage(wvfVar.obtainMessage(1, i3, -1, n3gVar));
            this.f = null;
        } else if (i == 2) {
            parcel.readInt();
            oxf.b(parcel);
            Log.wtf("GmsClient", "received deprecated onAccountValidationComplete callback, ignoring", new Exception());
        } else {
            if (i != 3) {
                return false;
            }
            int i4 = parcel.readInt();
            IBinder strongBinder2 = parcel.readStrongBinder();
            fag fagVar = (fag) oxf.a(parcel, fag.CREATOR);
            oxf.b(parcel);
            mn0 mn0Var2 = this.f;
            vp7.q("onPostInitCompleteWithConnectionInfo can be called only once per call togetRemoteService", mn0Var2);
            vp7.p(fagVar);
            mn0Var2.v = fagVar;
            if (mn0Var2.o()) {
                k42 k42Var = fagVar.d;
                olb olbVarK = olb.k();
                plb plbVar = k42Var == null ? null : k42Var.a;
                synchronized (olbVarK) {
                    if (plbVar == null) {
                        plbVar = olb.d;
                    } else {
                        plb plbVar2 = (plb) olbVarK.b;
                        if (plbVar2 == null || plbVar2.a < plbVar.a) {
                        }
                    }
                    olbVarK.b = plbVar;
                }
            }
            Bundle bundle2 = fagVar.a;
            vp7.q("onPostInitComplete can be called only once per call to getRemoteService", this.f);
            mn0 mn0Var3 = this.f;
            int i5 = this.g;
            mn0Var3.getClass();
            n3g n3gVar2 = new n3g(mn0Var3, i4, strongBinder2, bundle2);
            wvf wvfVar2 = mn0Var3.e;
            wvfVar2.sendMessage(wvfVar2.obtainMessage(1, i5, -1, n3gVar2));
            this.f = null;
        }
        parcel2.writeNoException();
        return true;
    }
}
