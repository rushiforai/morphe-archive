package defpackage;

import android.accounts.Account;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dmg implements ut5, IInterface {
    public final IBinder e;

    public dmg(IBinder iBinder) {
        this.e = iBinder;
    }

    public final Account a() {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.gms.common.internal.IAccountAccessor");
        parcelObtain = Parcel.obtain();
        try {
            this.e.transact(2, parcelObtain, parcelObtain, 0);
            parcelObtain.readException();
            parcelObtain.recycle();
            return (Account) oxf.a(parcelObtain, Account.CREATOR);
        } catch (RuntimeException e) {
            throw e;
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.e;
    }
}
