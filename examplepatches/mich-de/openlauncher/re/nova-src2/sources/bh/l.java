package bh;

import android.os.IBinder;
import android.os.Parcel;

/* loaded from: classes3.dex */
public final class l extends lh.a {
    public l(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.dynamite.IDynamiteLoader", 0);
    }

    public final ah.b V(ah.d dVar, String str, int i5) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(i5);
        Parcel parcelT = T(parcelU, 2);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }

    public final int W(ah.d dVar, String str, boolean z11) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(z11 ? 1 : 0);
        Parcel parcelT = T(parcelU, 3);
        int i5 = parcelT.readInt();
        parcelT.recycle();
        return i5;
    }

    public final ah.b X(ah.d dVar, String str, int i5) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(i5);
        Parcel parcelT = T(parcelU, 4);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }

    public final int Y(ah.d dVar, String str, boolean z11) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(z11 ? 1 : 0);
        Parcel parcelT = T(parcelU, 5);
        int i5 = parcelT.readInt();
        parcelT.recycle();
        return i5;
    }

    public final int Z() {
        Parcel parcelT = T(U(), 6);
        int i5 = parcelT.readInt();
        parcelT.recycle();
        return i5;
    }

    public final ah.b a0(ah.d dVar, String str, boolean z11, long j11) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(z11 ? 1 : 0);
        parcelU.writeLong(j11);
        Parcel parcelT = T(parcelU, 7);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }

    public final ah.b b0(ah.d dVar, String str, int i5, ah.d dVar2) {
        Parcel parcelU = U();
        u90.b.k0(parcelU, dVar);
        parcelU.writeString(str);
        parcelU.writeInt(i5);
        u90.b.k0(parcelU, dVar2);
        Parcel parcelT = T(parcelU, 8);
        ah.b bVarU = ah.d.U(parcelT.readStrongBinder());
        parcelT.recycle();
        return bVarU;
    }
}
