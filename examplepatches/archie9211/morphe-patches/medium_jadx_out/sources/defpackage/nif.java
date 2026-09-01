package defpackage;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nif implements IInterface {
    public final /* synthetic */ int e;
    public final IBinder f;
    public final String g;

    public /* synthetic */ nif(IBinder iBinder, String str, int i) {
        this.e = i;
        this.f = iBinder;
        this.g = str;
    }

    public Parcel a() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.g);
        return parcelObtain;
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        int i = this.e;
        return this.f;
    }

    public void c(int i, Parcel parcel) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            this.f.transact(i, parcel, parcelObtain, 0);
            parcelObtain.readException();
        } finally {
            parcel.recycle();
            parcelObtain.recycle();
        }
    }

    public Parcel d() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.g);
        return parcelObtain;
    }

    public Parcel e(int i, Parcel parcel) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            try {
                this.f.transact(i, parcel, parcelObtain, 0);
                parcelObtain.readException();
                return parcelObtain;
            } catch (RuntimeException e) {
                parcelObtain.recycle();
                throw e;
            }
        } finally {
            parcel.recycle();
        }
    }

    public void f(int i, Parcel parcel) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            this.f.transact(i, parcel, parcelObtain, 0);
            parcelObtain.readException();
        } finally {
            parcel.recycle();
            parcelObtain.recycle();
        }
    }

    public void g(int i, Parcel parcel) {
        try {
            this.f.transact(i, parcel, null, 1);
        } finally {
            parcel.recycle();
        }
    }
}
