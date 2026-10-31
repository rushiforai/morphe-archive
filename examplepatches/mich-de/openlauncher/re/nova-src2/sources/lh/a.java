package lh;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* loaded from: classes.dex */
public abstract class a implements IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74934a;

    /* renamed from: b, reason: collision with root package name */
    public final IBinder f74935b;

    /* renamed from: c, reason: collision with root package name */
    public final String f74936c;

    public /* synthetic */ a(IBinder iBinder, String str, int i5) {
        this.f74934a = i5;
        this.f74935b = iBinder;
        this.f74936c = str;
    }

    public Parcel T(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            try {
                this.f74935b.transact(i5, parcel, parcelObtain, 0);
                parcelObtain.readException();
                return parcelObtain;
            } catch (RuntimeException e3) {
                parcelObtain.recycle();
                throw e3;
            }
        } finally {
            parcel.recycle();
        }
    }

    public Parcel U() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken(this.f74936c);
        return parcelObtain;
    }

    public Parcel a(Parcel parcel, int i5) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            try {
                this.f74935b.transact(i5, parcel, parcelObtain, 0);
                parcelObtain.readException();
                return parcelObtain;
            } catch (RuntimeException e3) {
                parcelObtain.recycle();
                throw e3;
            }
        } finally {
            parcel.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        switch (this.f74934a) {
        }
        return this.f74935b;
    }
}
