package defpackage;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cu5 implements eu5, IInterface {
    public final IBinder e;

    public cu5(IBinder iBinder) {
        this.e = iBinder;
    }

    public final void a(int i, Parcel parcel) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            this.e.transact(i, parcel, parcelObtain, 0);
            parcelObtain.readException();
        } finally {
            parcel.recycle();
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.e;
    }
}
