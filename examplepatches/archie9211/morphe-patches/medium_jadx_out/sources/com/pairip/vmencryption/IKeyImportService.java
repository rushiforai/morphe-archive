package com.pairip.vmencryption;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import com.pairip.vmencryption.IKeyImportServiceImportUnwrappedKeyCallback;
import com.pairip.vmencryption.IKeyImportServiceImportWrappedKeyCallback;
import com.pairip.vmencryption.IKeyImportServiceRequestWrappingKeyCallback;

/* JADX INFO: loaded from: classes2.dex */
public interface IKeyImportService extends IInterface {
    public static final String DESCRIPTOR = "IKeyImportService";

    public static class Default implements IKeyImportService {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.pairip.vmencryption.IKeyImportService
        public void importUnwrappedKey(int versionCode, byte[] unwrappedKey, Bundle extraParams, IKeyImportServiceImportUnwrappedKeyCallback callback) throws RemoteException {
        }

        @Override // com.pairip.vmencryption.IKeyImportService
        public void importWrappedKey(int versionCode, byte[] wrappedKey, Bundle extraParams, IKeyImportServiceImportWrappedKeyCallback callback) throws RemoteException {
        }

        @Override // com.pairip.vmencryption.IKeyImportService
        public void requestWrappingKey(int versionCode, Bundle extraParams, IKeyImportServiceRequestWrappingKeyCallback callback) throws RemoteException {
        }
    }

    void importUnwrappedKey(int versionCode, byte[] unwrappedKey, Bundle extraParams, IKeyImportServiceImportUnwrappedKeyCallback callback) throws RemoteException;

    void importWrappedKey(int versionCode, byte[] wrappedKey, Bundle extraParams, IKeyImportServiceImportWrappedKeyCallback callback) throws RemoteException;

    void requestWrappingKey(int versionCode, Bundle extraParams, IKeyImportServiceRequestWrappingKeyCallback callback) throws RemoteException;

    public static abstract class Stub extends Binder implements IKeyImportService {
        static final int TRANSACTION_importUnwrappedKey = 3;
        static final int TRANSACTION_importWrappedKey = 2;
        static final int TRANSACTION_requestWrappingKey = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, IKeyImportService.DESCRIPTOR);
        }

        public static IKeyImportService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = obj.queryLocalInterface(IKeyImportService.DESCRIPTOR);
            if (iInterfaceQueryLocalInterface != null && (iInterfaceQueryLocalInterface instanceof IKeyImportService)) {
                return (IKeyImportService) iInterfaceQueryLocalInterface;
            }
            return new Proxy(obj);
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code >= 1 && code <= 16777215) {
                data.enforceInterface(IKeyImportService.DESCRIPTOR);
            }
            if (code == 1598968902) {
                reply.writeString(IKeyImportService.DESCRIPTOR);
                return true;
            }
            if (code == 1) {
                requestWrappingKey(data.readInt(), (Bundle) ParcelImpl.readTypedObject(data, Bundle.CREATOR), IKeyImportServiceRequestWrappingKeyCallback.Stub.asInterface(data.readStrongBinder()));
            } else if (code == 2) {
                importWrappedKey(data.readInt(), data.createByteArray(), (Bundle) ParcelImpl.readTypedObject(data, Bundle.CREATOR), IKeyImportServiceImportWrappedKeyCallback.Stub.asInterface(data.readStrongBinder()));
            } else if (code == 3) {
                importUnwrappedKey(data.readInt(), data.createByteArray(), (Bundle) ParcelImpl.readTypedObject(data, Bundle.CREATOR), IKeyImportServiceImportUnwrappedKeyCallback.Stub.asInterface(data.readStrongBinder()));
            } else {
                return super.onTransact(code, data, reply, flags);
            }
            return true;
        }

        private static class Proxy implements IKeyImportService {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return IKeyImportService.DESCRIPTOR;
            }

            @Override // com.pairip.vmencryption.IKeyImportService
            public void requestWrappingKey(int versionCode, Bundle extraParams, IKeyImportServiceRequestWrappingKeyCallback callback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(IKeyImportService.DESCRIPTOR);
                    parcelObtain.writeInt(versionCode);
                    ParcelImpl.writeTypedObject(parcelObtain, extraParams, 0);
                    parcelObtain.writeStrongInterface(callback);
                    this.mRemote.transact(1, parcelObtain, null, 1);
                } finally {
                    parcelObtain.recycle();
                }
            }

            @Override // com.pairip.vmencryption.IKeyImportService
            public void importWrappedKey(int versionCode, byte[] wrappedKey, Bundle extraParams, IKeyImportServiceImportWrappedKeyCallback callback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(IKeyImportService.DESCRIPTOR);
                    parcelObtain.writeInt(versionCode);
                    parcelObtain.writeByteArray(wrappedKey);
                    ParcelImpl.writeTypedObject(parcelObtain, extraParams, 0);
                    parcelObtain.writeStrongInterface(callback);
                    this.mRemote.transact(2, parcelObtain, null, 1);
                } finally {
                    parcelObtain.recycle();
                }
            }

            @Override // com.pairip.vmencryption.IKeyImportService
            public void importUnwrappedKey(int versionCode, byte[] unwrappedKey, Bundle extraParams, IKeyImportServiceImportUnwrappedKeyCallback callback) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken(IKeyImportService.DESCRIPTOR);
                    parcelObtain.writeInt(versionCode);
                    parcelObtain.writeByteArray(unwrappedKey);
                    ParcelImpl.writeTypedObject(parcelObtain, extraParams, 0);
                    parcelObtain.writeStrongInterface(callback);
                    this.mRemote.transact(3, parcelObtain, null, 1);
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
