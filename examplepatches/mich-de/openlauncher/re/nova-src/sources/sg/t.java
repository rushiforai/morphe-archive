package sg;

import android.os.Parcel;
import com.google.android.gms.common.zzp;
import com.google.android.gms.common.zzr;
import com.google.android.gms.common.zzt;

/* loaded from: classes3.dex */
public final class t extends lh.a implements v {
    public final boolean V(zzt zztVar, ah.d dVar) {
        Parcel parcelU = U();
        parcelU.writeInt(1);
        zztVar.writeToParcel(parcelU, 0);
        u90.b.k0(parcelU, dVar);
        Parcel parcelT = T(parcelU, 5);
        boolean z11 = parcelT.readInt() != 0;
        parcelT.recycle();
        return z11;
    }

    public final zzr W(zzp zzpVar) {
        Parcel parcelU = U();
        parcelU.writeInt(1);
        zzpVar.writeToParcel(parcelU, 0);
        Parcel parcelT = T(parcelU, 6);
        zzr zzrVar = (zzr) u90.b.j0(parcelT, zzr.CREATOR);
        parcelT.recycle();
        return zzrVar;
    }

    public final boolean X() {
        Parcel parcelT = T(U(), 7);
        boolean z11 = parcelT.readInt() != 0;
        parcelT.recycle();
        return z11;
    }

    public final zzr Y(zzp zzpVar) {
        Parcel parcelU = U();
        parcelU.writeInt(1);
        zzpVar.writeToParcel(parcelU, 0);
        Parcel parcelT = T(parcelU, 8);
        zzr zzrVar = (zzr) u90.b.j0(parcelT, zzr.CREATOR);
        parcelT.recycle();
        return zzrVar;
    }
}
