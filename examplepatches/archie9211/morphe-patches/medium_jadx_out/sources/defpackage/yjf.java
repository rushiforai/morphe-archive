package defpackage;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yjf extends k2 {
    public static final Parcelable.Creator<yjf> CREATOR = new tfd(18);
    public final int a;
    public final IBinder b;
    public final h42 c;
    public final boolean d;
    public final boolean e;

    public yjf(int i, IBinder iBinder, h42 h42Var, boolean z, boolean z2) {
        this.a = i;
        this.b = iBinder;
        this.c = h42Var;
        this.d = z;
        this.e = z2;
    }

    public final boolean equals(Object obj) {
        Object dmgVar;
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yjf)) {
            return false;
        }
        yjf yjfVar = (yjf) obj;
        if (!this.c.equals(yjfVar.c)) {
            return false;
        }
        Object dmgVar2 = null;
        IBinder iBinder = this.b;
        if (iBinder == null) {
            dmgVar = null;
        } else {
            int i = m5.f;
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
            dmgVar = iInterfaceQueryLocalInterface instanceof ut5 ? (ut5) iInterfaceQueryLocalInterface : new dmg(iBinder);
        }
        IBinder iBinder2 = yjfVar.b;
        if (iBinder2 != null) {
            int i2 = m5.f;
            IInterface iInterfaceQueryLocalInterface2 = iBinder2.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
            dmgVar2 = iInterfaceQueryLocalInterface2 instanceof ut5 ? (ut5) iInterfaceQueryLocalInterface2 : new dmg(iBinder2);
        }
        return en7.u(dmgVar, dmgVar2);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        IBinder iBinder = this.b;
        if (iBinder != null) {
            int iC02 = fo7.c0(2, parcel);
            parcel.writeStrongBinder(iBinder);
            fo7.d0(iC02, parcel);
        }
        fo7.U(parcel, 3, this.c, i);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d ? 1 : 0);
        fo7.a0(parcel, 5, 4);
        parcel.writeInt(this.e ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
