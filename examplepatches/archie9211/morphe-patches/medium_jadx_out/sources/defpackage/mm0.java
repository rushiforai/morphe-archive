package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mm0 implements Parcelable {
    public static final Parcelable.Creator<mm0> CREATOR = new xkf(8);
    public final ArrayList a;
    public final ArrayList b;

    public mm0(Parcel parcel) {
        this.a = parcel.createStringArrayList();
        this.b = parcel.createTypedArrayList(lm0.CREATOR);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeStringList(this.a);
        parcel.writeTypedList(this.b);
    }

    public mm0(ArrayList arrayList, ArrayList arrayList2) {
        this.a = arrayList;
        this.b = arrayList2;
    }
}
