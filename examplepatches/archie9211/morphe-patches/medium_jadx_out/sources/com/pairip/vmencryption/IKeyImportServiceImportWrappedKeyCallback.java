package com.pairip.vmencryption;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;

/* JADX INFO: loaded from: classes2.dex */
public interface IKeyImportServiceImportWrappedKeyCallback extends IInterface {
    public static final String DESCRIPTOR = "com.pairip.vmencryption.IKeyImportServiceImportWrappedKeyCallback";

    public static class Default implements IKeyImportServiceImportWrappedKeyCallback {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.pairip.vmencryption.IKeyImportServiceImportWrappedKeyCallback
        public void onImportWrappedKeyResponse(Bundle params) throws RemoteException {
        }
    }

    void onImportWrappedKeyResponse(Bundle params) throws RemoteException;

    public static abstract class Stub extends Binder implements IKeyImportServiceImportWrappedKeyCallback {
        static final int TRANSACTION_onImportWrappedKeyResponse = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, IKeyImportServiceImportWrappedKeyCallback.DESCRIPTOR);
        }

        public static IKeyImportServiceImportWrappedKeyCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = obj.queryLocalInterface(IKeyImportServiceImportWrappedKeyCallback.DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof IKeyImportServiceImportWrappedKeyCallback)) {
                return (IKeyImportServiceImportWrappedKeyCallback) iInterfaceQueryLocalInterface;
            }
            return new Proxy(obj);
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code >= 1 && code <= 16777215) {
                data.enforceInterface(IKeyImportServiceImportWrappedKeyCallback.DESCRIPTOR);
            }
            if (code == 1598968902) {
                reply.writeString(IKeyImportServiceImportWrappedKeyCallback.DESCRIPTOR);
                return true;
            }
            if (code == 1) {
                onImportWrappedKeyResponse((Bundle) ParcelImpl.readTypedObject(data, Bundle.CREATOR));
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }

        private static class Proxy implements IKeyImportServiceImportWrappedKeyCallback {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return IKeyImportServiceImportWrappedKeyCallback.DESCRIPTOR;
            }

            @Override // com.pairip.vmencryption.IKeyImportServiceImportWrappedKeyCallback
            public void onImportWrappedKeyResponse(Bundle params) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(IKeyImportServiceImportWrappedKeyCallback.DESCRIPTOR);
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
