package com.digitalturbine.ignite.cl.aidl;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes2.dex */
public interface IIgniteServiceCallback extends IInterface {

    public static abstract class Stub extends Binder implements IIgniteServiceCallback {
        public Stub() {
            attachInterface(this, "com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback");
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
            if (i5 >= 1 && i5 <= 16777215) {
                parcel.enforceInterface("com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback");
            }
            if (i5 == 1598968902) {
                parcel2.writeString("com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback");
                return true;
            }
            if (i5 == 1) {
                onScheduled(parcel.readString());
                parcel2.writeNoException();
                return true;
            }
            if (i5 == 2) {
                onStart(parcel.readString());
                parcel2.writeNoException();
                return true;
            }
            if (i5 == 3) {
                onProgress(parcel.readString());
                parcel2.writeNoException();
                return true;
            }
            if (i5 == 4) {
                onSuccess(parcel.readString());
                parcel2.writeNoException();
                return true;
            }
            if (i5 != 5) {
                return super.onTransact(i5, parcel, parcel2, i11);
            }
            onError(parcel.readString());
            parcel2.writeNoException();
            return true;
        }
    }

    void onError(String str) throws RemoteException;

    void onProgress(String str) throws RemoteException;

    void onScheduled(String str) throws RemoteException;

    void onStart(String str) throws RemoteException;

    void onSuccess(String str) throws RemoteException;
}
