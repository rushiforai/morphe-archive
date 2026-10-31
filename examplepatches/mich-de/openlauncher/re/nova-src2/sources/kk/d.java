package kk;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;

/* loaded from: classes3.dex */
public final class d implements f, IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final IBinder f71531a;

    public d(IBinder iBinder) {
        this.f71531a = iBinder;
    }

    @Override // kk.f
    public final void N(String str, Bundle bundle, jk.g gVar) {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeInterfaceToken("com.google.android.play.core.appupdate.protocol.IAppUpdateService");
        parcelObtain.writeString(str);
        parcelObtain.writeInt(1);
        bundle.writeToParcel(parcelObtain, 0);
        parcelObtain.writeStrongBinder(gVar);
        try {
            this.f71531a.transact(2, parcelObtain, null, 1);
        } finally {
            parcelObtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.f71531a;
    }
}
