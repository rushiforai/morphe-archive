package defpackage;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pa0 implements IInterface {
    public final IBinder e;

    public pa0(IBinder iBinder) {
        this.e = iBinder;
    }

    public final String a() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.getClass();
        Parcel parcelObtain2 = Parcel.obtain();
        parcelObtain2.getClass();
        try {
            parcelObtain.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
            this.e.transact(1, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readString();
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.e;
    }

    public final boolean c() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.getClass();
        Parcel parcelObtain2 = Parcel.obtain();
        parcelObtain2.getClass();
        try {
            parcelObtain.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
            parcelObtain.writeInt(1);
            this.e.transact(2, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readInt() != 0;
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }
}
