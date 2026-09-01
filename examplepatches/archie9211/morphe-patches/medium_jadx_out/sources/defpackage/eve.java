package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eve extends w {
    public static final Parcelable.Creator<eve> CREATOR = new djc(4);
    public int c;
    public Parcelable d;

    public eve(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        classLoader = classLoader == null ? eve.class.getClassLoader() : classLoader;
        this.c = parcel.readInt();
        this.d = parcel.readParcelable(classLoader);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FragmentPager.SavedState{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" position=");
        return ho2.H(sb, this.c, "}");
    }

    @Override // defpackage.w, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeInt(this.c);
        parcel.writeParcelable(this.d, i);
    }
}
