package e;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.support.v4.os.ResultReceiver;

/* loaded from: classes2.dex */
public final class c extends Binder implements b {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f49892b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ResultReceiver f49893a;

    public c(ResultReceiver resultReceiver) {
        this.f49893a = resultReceiver;
        attachInterface(this, b.Zo);
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this;
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) {
        String str = b.Zo;
        if (i5 >= 1 && i5 <= 16777215) {
            parcel.enforceInterface(str);
        }
        if (i5 == 1598968902) {
            parcel2.writeString(str);
            return true;
        }
        if (i5 != 1) {
            return super.onTransact(i5, parcel, parcel2, i11);
        }
        this.f49893a.a(parcel.readInt(), (Bundle) (parcel.readInt() != 0 ? Bundle.CREATOR.createFromParcel(parcel) : null));
        return true;
    }
}
