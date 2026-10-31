package aj;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.view.WindowManager;

/* loaded from: classes3.dex */
public final class c implements a, IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final IBinder f13522a;

    public c(IBinder iBinder) {
        this.f13522a = iBinder;
    }

    public final Parcel T() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.libraries.launcherclient.ILauncherOverlay");
        return parcelObtain;
    }

    public final void U(WindowManager.LayoutParams layoutParams, b bVar, int i5) {
        Parcel parcelT = T();
        if (layoutParams == null) {
            parcelT.writeInt(0);
        } else {
            parcelT.writeInt(1);
            layoutParams.writeToParcel(parcelT, 0);
        }
        if (bVar == null) {
            parcelT.writeStrongBinder(null);
        } else {
            parcelT.writeStrongBinder(bVar.asBinder());
        }
        parcelT.writeInt(i5);
        Z(parcelT, 4);
    }

    public final void V(Bundle bundle, b bVar) {
        Parcel parcelT = T();
        parcelT.writeInt(1);
        bundle.writeToParcel(parcelT, 0);
        if (bVar == null) {
            parcelT.writeStrongBinder(null);
        } else {
            parcelT.writeStrongBinder(bVar.asBinder());
        }
        Z(parcelT, 14);
    }

    public final void W(boolean z11) {
        Parcel parcelT = T();
        parcelT.writeInt(z11 ? 1 : 0);
        Z(parcelT, 5);
    }

    public final void X() {
        Z(T(), 7);
    }

    public final void Y() {
        Z(T(), 8);
    }

    public final void Z(Parcel parcel, int i5) {
        try {
            this.f13522a.transact(i5, parcel, null, 1);
        } finally {
            parcel.recycle();
        }
    }

    public final void a0(int i5) {
        Parcel parcelT = T();
        parcelT.writeInt(i5);
        Z(parcelT, 16);
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.f13522a;
    }
}
