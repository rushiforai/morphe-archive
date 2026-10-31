package b;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* loaded from: classes.dex */
public abstract class s8 extends Binder implements IInterface {

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f15988i;

    public s8(String str, int i5) {
        this.f15988i = i5;
        switch (i5) {
            case 1:
                attachInterface(this, str);
                break;
            default:
                attachInterface(this, str);
                break;
        }
    }

    public boolean T(int i5, Parcel parcel, Parcel parcel2) {
        return false;
    }

    public abstract boolean a(int i5, Parcel parcel, Parcel parcel2);

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        int i5 = this.f15988i;
        return this;
    }

    @Override // android.os.Binder
    public final boolean onTransact(int i5, Parcel parcel, Parcel parcel2, int i11) {
        switch (this.f15988i) {
            case 0:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return a(i5, parcel, parcel2);
            default:
                if (i5 <= 16777215) {
                    parcel.enforceInterface(getInterfaceDescriptor());
                } else if (super.onTransact(i5, parcel, parcel2, i11)) {
                    return true;
                }
                return T(i5, parcel, parcel2);
        }
    }
}
