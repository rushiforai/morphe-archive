package sg;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import com.google.android.gms.common.internal.GetServiceRequest;

/* loaded from: classes.dex */
public final class s implements IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final IBinder f87464a;

    public s(IBinder iBinder) {
        this.f87464a = iBinder;
    }

    public final void T(z zVar, GetServiceRequest getServiceRequest) {
        Parcel parcelObtain = Parcel.obtain();
        Parcel parcelObtain2 = Parcel.obtain();
        try {
            parcelObtain.writeInterfaceToken("com.google.android.gms.common.internal.IGmsServiceBroker");
            parcelObtain.writeStrongBinder(zVar);
            parcelObtain.writeInt(1);
            aa.d.a(getServiceRequest, parcelObtain, 0);
            this.f87464a.transact(46, parcelObtain, parcelObtain2, 0);
            parcelObtain2.readException();
        } finally {
            parcelObtain2.recycle();
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.f87464a;
    }
}
