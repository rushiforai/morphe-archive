package com.pairip.vmencryption;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;

/* JADX INFO: loaded from: classes2.dex */
public interface IAntiTamperKeyTransferResultListener extends IInterface {
    void onCompleted(Bundle response) throws RemoteException;

    public static abstract class Stub extends Binder implements IAntiTamperKeyTransferResultListener {
        private static final String DESCRIPTOR = "com.android.vending.securedatatransfer.IAntiTamperKeyTransferResultListener";
        static final int TRANSACTION_ON_COMPLETED = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code >= 1 && code <= 16777215) {
                data.enforceInterface(DESCRIPTOR);
            }
            if (code == 1) {
                onCompleted((Bundle) readTypedObject(data, Bundle.CREATOR));
            } else if (code == 1598968902) {
                reply.writeString(DESCRIPTOR);
            } else {
                return super.onTransact(code, data, reply, flags);
            }
            return true;
        }

        private static <T> T readTypedObject(Parcel parcel, Parcelable.Creator<T> c) {
            if (parcel.readInt() != 0) {
                return c.createFromParcel(parcel);
            }
            return null;
        }
    }
}
