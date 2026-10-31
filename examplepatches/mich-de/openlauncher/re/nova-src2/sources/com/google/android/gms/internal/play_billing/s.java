package com.google.android.gms.internal.play_billing;

import android.os.BadParcelableException;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes3.dex */
public abstract class s extends Binder implements IInterface {
    private static t globalInterceptor;

    public s(String str) {
        attachInterface(this, str);
    }

    public static synchronized void installTransactionInterceptorPackagePrivate(t tVar) {
        if (tVar == null) {
            throw new IllegalArgumentException("null interceptor");
        }
    }

    @Override // android.os.IInterface
    public IBinder asBinder() {
        return this;
    }

    public abstract boolean dispatchTransaction(int i5, Parcel parcel, Parcel parcel2, int i11);

    public void enforceNoDataAvail(Parcel parcel) {
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(b.c0.h(iDataAvail, "Parcel data not fully consumed, unread size: "));
        }
    }

    @Override // android.os.Binder
    public boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
        boolean zOnTransact;
        if (i5 > 16777215) {
            zOnTransact = super.onTransact(i5, parcel, parcel2, i11);
        } else {
            parcel.enforceInterface(getInterfaceDescriptor());
            zOnTransact = false;
        }
        if (zOnTransact) {
            return true;
        }
        return dispatchTransaction(i5, parcel, parcel2, i11);
    }
}
