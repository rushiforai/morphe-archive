package sg;

import android.os.Parcel;

/* loaded from: classes3.dex */
public final class k0 extends lh.a implements l0 {
    @Override // sg.l0
    public final ah.b zzd() {
        Parcel parcelT = T(U(), 1);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }

    @Override // sg.l0
    public final int zze() {
        Parcel parcelT = T(U(), 2);
        int i5 = parcelT.readInt();
        parcelT.recycle();
        return i5;
    }
}
