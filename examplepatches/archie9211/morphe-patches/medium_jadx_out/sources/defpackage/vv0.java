package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.view.AbsSavedState;
import com.google.android.material.bottomsheet.BottomSheetBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vv0 extends w {
    public static final Parcelable.Creator<vv0> CREATOR = new djc(1);
    public final int c;
    public final int d;
    public final boolean e;
    public final boolean f;
    public final boolean g;

    public vv0(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        this.c = parcel.readInt();
        this.d = parcel.readInt();
        this.e = parcel.readInt() == 1;
        this.f = parcel.readInt() == 1;
        this.g = parcel.readInt() == 1;
    }

    @Override // defpackage.w, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.c);
        parcel.writeInt(this.d);
        parcel.writeInt(this.e ? 1 : 0);
        parcel.writeInt(this.f ? 1 : 0);
        parcel.writeInt(this.g ? 1 : 0);
    }

    public vv0(BottomSheetBehavior bottomSheetBehavior) {
        super(AbsSavedState.EMPTY_STATE);
        this.c = bottomSheetBehavior.P;
        this.d = bottomSheetBehavior.f;
        this.e = bottomSheetBehavior.b;
        this.f = bottomSheetBehavior.J;
        this.g = bottomSheetBehavior.K;
    }
}
