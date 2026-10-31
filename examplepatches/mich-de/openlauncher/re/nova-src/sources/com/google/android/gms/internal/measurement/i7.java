package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;

/* loaded from: classes3.dex */
public final class i7 extends p6 implements k7 {
    public i7(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.measurement.api.internal.IEventHandlerProxy", 0);
    }

    @Override // com.google.android.gms.internal.measurement.k7
    public final void b(String str, String str2, Bundle bundle, long j11) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        r6.b(parcelX, bundle);
        parcelX.writeLong(j11);
        Z(parcelX, 1);
    }

    @Override // com.google.android.gms.internal.measurement.k7
    public final int zzf() {
        Parcel parcelW = W(X(), 2);
        int i5 = parcelW.readInt();
        parcelW.recycle();
        return i5;
    }
}
