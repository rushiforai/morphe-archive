package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import android.os.Parcel;

/* loaded from: classes3.dex */
public abstract class j7 extends q6 implements k7 {
    public j7() {
        super("com.google.android.gms.measurement.api.internal.IEventHandlerProxy");
    }

    @Override // com.google.android.gms.internal.measurement.q6
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 != 1) {
            if (i5 != 2) {
                return false;
            }
            int iZzf = zzf();
            parcel2.writeNoException();
            parcel2.writeInt(iZzf);
            return true;
        }
        String string = parcel.readString();
        String string2 = parcel.readString();
        Bundle bundle = (Bundle) r6.a(parcel, Bundle.CREATOR);
        long j11 = parcel.readLong();
        r6.d(parcel);
        b(string, string2, bundle, j11);
        parcel2.writeNoException();
        return true;
    }
}
