package com.google.android.gms.internal.play_billing;

import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes3.dex */
public abstract class x extends s implements z {
    @Override // com.google.android.gms.internal.play_billing.s
    public final boolean dispatchTransaction(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
        if (i5 != 1) {
            return false;
        }
        int i12 = parcel.readInt();
        enforceNoDataAvail(parcel);
        zza(i12);
        return true;
    }
}
