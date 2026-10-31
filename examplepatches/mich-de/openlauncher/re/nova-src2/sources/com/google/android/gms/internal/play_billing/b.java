package com.google.android.gms.internal.play_billing;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;

/* loaded from: classes3.dex */
public abstract class b extends s implements c {
    private static final String DESCRIPTOR = "com.android.vending.billing.IInAppBillingDelegateToBackendCallback";
    static final int TRANSACTION_onDelegateToBackendResponse = 1;

    public b() {
        super(DESCRIPTOR);
    }

    public static c asInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
        return iInterfaceQueryLocalInterface instanceof c ? (c) iInterfaceQueryLocalInterface : new a(iBinder, DESCRIPTOR, 1);
    }

    @Override // com.google.android.gms.internal.play_billing.s
    public boolean dispatchTransaction(int i5, Parcel parcel, Parcel parcel2, int i11) throws RemoteException {
        if (i5 != 1) {
            return false;
        }
        Parcelable.Creator creator = Bundle.CREATOR;
        Bundle bundle = (Bundle) p7.u.Z(parcel);
        enforceNoDataAvail(parcel);
        onDelegateToBackendResponse(bundle);
        return true;
    }
}
