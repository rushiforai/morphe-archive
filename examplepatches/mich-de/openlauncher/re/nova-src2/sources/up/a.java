package up;

import android.os.IBinder;
import android.os.Parcel;
import androidx.room.k;

/* loaded from: classes4.dex */
public final class a implements c {

    /* renamed from: a, reason: collision with root package name */
    public IBinder f91501a;

    public final void T(long j11, String str, k kVar) {
        Parcel parcelObtain = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("com.android.vending.licensing.ILicensingService");
            parcelObtain.writeLong(j11);
            parcelObtain.writeString(str);
            parcelObtain.writeStrongBinder(kVar);
            this.f91501a.transact(1, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.f91501a;
    }
}
