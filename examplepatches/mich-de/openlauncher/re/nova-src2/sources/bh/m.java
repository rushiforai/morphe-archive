package bh;

import android.os.Parcel;

/* loaded from: classes.dex */
public final class m extends lh.a {
    public final ah.b V(ah.d dVar, String str, int i5, ah.d dVar2) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(i5);
        u90.b.k0(parcelU, dVar2);
        Parcel parcelT = T(parcelU, 2);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }

    public final ah.b W(ah.d dVar, String str, int i5, ah.d dVar2) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(i5);
        u90.b.k0(parcelU, dVar2);
        Parcel parcelT = T(parcelU, 3);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }
}
