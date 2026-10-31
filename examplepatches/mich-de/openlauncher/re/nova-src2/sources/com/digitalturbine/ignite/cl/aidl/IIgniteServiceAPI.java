package com.digitalturbine.ignite.cl.aidl;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;

/* loaded from: classes2.dex */
public interface IIgniteServiceAPI extends IInterface {

    public static abstract class Stub extends Binder implements IIgniteServiceAPI {

        public static class Proxy implements IIgniteServiceAPI {
            private IBinder mRemote;

            public Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI
            public void authenticate(String str, String str2, Bundle bundle, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI");
                    parcelObtain.writeString(str);
                    parcelObtain.writeString(str2);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    parcelObtain.writeStrongInterface(iIgniteServiceCallback);
                    this.mRemote.transact(8, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI
            public void cancel(String str, Bundle bundle, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI");
                    parcelObtain.writeString(str);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    parcelObtain.writeStrongInterface(iIgniteServiceCallback);
                    this.mRemote.transact(4, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI
            public void getProperty(String str, Bundle bundle, Bundle bundle2, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI");
                    parcelObtain.writeString(str);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    _Parcel.writeTypedObject(parcelObtain, bundle2, 0);
                    parcelObtain.writeStrongInterface(iIgniteServiceCallback);
                    this.mRemote.transact(11, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI
            public void install(String str, Bundle bundle, Bundle bundle2, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI");
                    parcelObtain.writeString(str);
                    _Parcel.writeTypedObject(parcelObtain, bundle, 0);
                    _Parcel.writeTypedObject(parcelObtain, bundle2, 0);
                    parcelObtain.writeStrongInterface(iIgniteServiceCallback);
                    this.mRemote.transact(5, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI
            public String version() throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI");
                    this.mRemote.transact(2, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                    return parcelObtain2.readString();
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }
        }

        public static IIgniteServiceAPI asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI");
            return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof IIgniteServiceAPI)) ? new Proxy(iBinder) : (IIgniteServiceAPI) iInterfaceQueryLocalInterface;
        }
    }

    public static class _Parcel {
        /* JADX INFO: Access modifiers changed from: private */
        public static <T extends Parcelable> void writeTypedObject(Parcel parcel, T t6, int i5) {
            if (t6 == null) {
                parcel.writeInt(0);
            } else {
                parcel.writeInt(1);
                t6.writeToParcel(parcel, i5);
            }
        }
    }

    void authenticate(String str, String str2, Bundle bundle, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException;

    void cancel(String str, Bundle bundle, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException;

    void getProperty(String str, Bundle bundle, Bundle bundle2, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException;

    void install(String str, Bundle bundle, Bundle bundle2, IIgniteServiceCallback iIgniteServiceCallback) throws RemoteException;

    String version() throws RemoteException;
}
