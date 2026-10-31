package lk;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.internal.measurement.p6;

/* loaded from: classes3.dex */
public final class d extends p6 implements f {
    /* JADX WARN: Multi-variable type inference failed */
    public final void f0(String str, String str2, String str3, Bundle bundle, g gVar) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        parcelX.writeString(str3);
        parcelX.writeInt(1);
        bundle.writeToParcel(parcelX, 0);
        if (gVar == 0) {
            parcelX.writeStrongBinder(null);
        } else {
            parcelX.writeStrongBinder(gVar);
        }
        Y(parcelX, 2);
    }
}
