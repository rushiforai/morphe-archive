package defpackage;

import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vt5 implements xt5 {
    public IBinder e;

    public final boolean a(fm2 fm2Var, Uri uri, Bundle bundle) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.customtabs.ICustomTabsService");
            parcelObtain.writeStrongBinder(fm2Var);
            parcelObtain.writeInt(1);
            uri.writeToParcel(parcelObtain, 0);
            parcelObtain.writeInt(1);
            bundle.writeToParcel(parcelObtain, 0);
            parcelObtain.writeTypedList(null);
            this.e.transact(4, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readInt() != 0;
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.e;
    }

    public final boolean c(fm2 fm2Var) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.customtabs.ICustomTabsService");
            parcelObtain.writeStrongBinder(fm2Var);
            this.e.transact(3, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readInt() != 0;
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    public final boolean d() {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("android.support.customtabs.ICustomTabsService");
            parcelObtain.writeLong(0L);
            this.e.transact(2, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
            return parcelObtain2.readInt() != 0;
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }
}
