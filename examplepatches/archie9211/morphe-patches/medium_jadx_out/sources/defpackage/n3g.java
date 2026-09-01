package defpackage;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n3g extends ykf {
    public final IBinder g;
    public final /* synthetic */ mn0 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n3g(mn0 mn0Var, int i, IBinder iBinder, Bundle bundle) {
        super(mn0Var, i, bundle);
        this.h = mn0Var;
        this.g = iBinder;
    }

    @Override // defpackage.ykf
    public final boolean a() {
        IBinder iBinder = this.g;
        try {
            vp7.p(iBinder);
            String interfaceDescriptor = iBinder.getInterfaceDescriptor();
            mn0 mn0Var = this.h;
            if (!mn0Var.i().equals(interfaceDescriptor)) {
                String strI = mn0Var.i();
                Log.w("GmsClient", km4.C(new StringBuilder(strI.length() + 34 + String.valueOf(interfaceDescriptor).length()), "service descriptor mismatch: ", strI, " vs. ", interfaceDescriptor));
                return false;
            }
            IInterface iInterfaceA = mn0Var.a(iBinder);
            if (iInterfaceA == null || !(mn0Var.p(2, 4, iInterfaceA) || mn0Var.p(3, 4, iInterfaceA))) {
                return false;
            }
            mn0Var.t = null;
            eoc eocVar = mn0Var.n;
            if (eocVar == null) {
                return true;
            }
            ((ce5) eocVar.a).d();
            return true;
        } catch (RemoteException unused) {
            Log.w("GmsClient", "service probably died");
            return false;
        }
    }

    @Override // defpackage.ykf
    public final void b(h42 h42Var) {
        qlb qlbVar = this.h.o;
        if (qlbVar != null) {
            ((de5) qlbVar.a).a(h42Var);
        }
        System.currentTimeMillis();
    }
}
