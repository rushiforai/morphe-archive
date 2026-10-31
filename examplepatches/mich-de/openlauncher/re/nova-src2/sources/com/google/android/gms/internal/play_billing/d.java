package com.google.android.gms.internal.play_billing;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;

/* loaded from: classes3.dex */
public abstract class d extends s implements e {
    @Override // com.google.android.gms.internal.play_billing.s
    public final boolean dispatchTransaction(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
        if (i5 != 1) {
            return false;
        }
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle = (Bundle) p7.u.Z(parcel);
        enforceNoDataAvail(parcel);
        zza(bundle);
        return true;
    }
}
