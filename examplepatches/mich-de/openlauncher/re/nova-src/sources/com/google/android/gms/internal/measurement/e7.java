package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;

/* loaded from: classes3.dex */
public final class e7 extends p6 implements f7 {
    public e7(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.measurement.api.internal.IBundleReceiver", 0);
    }

    @Override // com.google.android.gms.internal.measurement.f7
    public final void G(Bundle bundle) {
        Parcel parcelX = X();
        r6.b(parcelX, bundle);
        Z(parcelX, 1);
    }
}
