package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bya extends w {
    public static final Parcelable.Creator<bya> CREATOR = new j49(3);
    public Parcelable c;

    public bya(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        this.c = parcel.readParcelable(classLoader == null ? sxa.class.getClassLoader() : classLoader);
    }

    @Override // defpackage.w, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.c, 0);
    }
}
