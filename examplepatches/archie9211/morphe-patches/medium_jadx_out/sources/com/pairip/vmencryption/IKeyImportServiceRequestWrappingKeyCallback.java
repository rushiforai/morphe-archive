package com.pairip.vmencryption;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;

/* JADX INFO: loaded from: classes2.dex */
public interface IKeyImportServiceRequestWrappingKeyCallback extends IInterface {
    public static final String DESCRIPTOR = "IKeyImportServiceRequestWrappingKeyCallback";

    public static class Default implements IKeyImportServiceRequestWrappingKeyCallback {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.pairip.vmencryption.IKeyImportServiceRequestWrappingKeyCallback
        public void onRequestWrappingKeyResponse(Bundle params) throws RemoteException {
        }
    }

    void onRequestWrappingKeyResponse(Bundle params) throws RemoteException;

    public static abstract class Stub extends Binder implements IKeyImportServiceRequestWrappingKeyCallback {
        static final int TRANSACTION_onRequestWrappingKeyResponse = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, IKeyImportServiceRequestWrappingKeyCallback.DESCRIPTOR);
        }

        public static IKeyImportServiceRequestWrappingKeyCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = obj.queryLocalInterface(IKeyImportServiceRequestWrappingKeyCallback.DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof IKeyImportServiceRequestWrappingKeyCallback)) {
                return (IKeyImportServiceRequestWrappingKeyCallback) iInterfaceQueryLocalInterface;
            }
            return new Proxy(obj);
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code >= 1 && code <= 16777215) {
                data.enforceInterface(IKeyImportServiceRequestWrappingKeyCallback.DESCRIPTOR);
            }
            if (code == 1598968902) {
                reply.writeString(IKeyImportServiceRequestWrappingKeyCallback.DESCRIPTOR);
                return true;
            }
            if (code == 1) {
                onRequestWrappingKeyResponse((Bundle) ParcelImpl.readTypedObject(data, Bundle.CREATOR));
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }

        private static class Proxy implements IKeyImportServiceRequestWrappingKeyCallback {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return IKeyImportServiceRequestWrappingKeyCallback.DESCRIPTOR;
            }

            @Override // com.pairip.vmencryption.IKeyImportServiceRequestWrappingKeyCallback
            public void onRequestWrappingKeyResponse(Bundle params) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(IKeyImportServiceRequestWrappingKeyCallback.DESCRIPTOR);
                    ParcelImpl.writeTypedObject(parcelObtain, params, 0);
                    this.mRemote.transact(1, parcelObtain, null, 1);
                } finally {
                    parcelObtain.recycle();
                }
            }
        }
    }

    public static class ParcelImpl {
        /* JADX INFO: Access modifiers changed from: private */
        public static <T> T readTypedObject(Parcel parcel, Parcelable.Creator<T> c) {
            if (parcel.readInt() != 0) {
                return c.createFromParcel(parcel);
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static <T extends Parcelable> void writeTypedObject(Parcel parcel, T value, int parcelableFlags) {
            if (value != null) {
                parcel.writeInt(1);
                value.writeToParcel(parcel, parcelableFlags);
            } else {
                parcel.writeInt(0);
            }
        }
    }
}
