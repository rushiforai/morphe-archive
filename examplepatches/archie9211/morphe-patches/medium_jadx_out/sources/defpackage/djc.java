package defpackage;

import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class djc implements Parcelable.ClassLoaderCreator {
    public final /* synthetic */ int a;

    public static ejc a(Parcel parcel, ClassLoader classLoader) {
        if (classLoader == null) {
            classLoader = djc.class.getClassLoader();
        }
        int i = parcel.readInt();
        if (i == 0) {
            return new ejc();
        }
        x89 x89VarP = lgc.b.p();
        for (int i2 = 0; i2 < i; i2++) {
            x89VarP.add(parcel.readValue(classLoader));
        }
        return new ejc(x89VarP.d());
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.a) {
            case 0:
                return a(parcel, null);
            case 1:
                return new vv0(parcel, null);
            case 2:
                return new tj7(parcel, null);
            case 3:
                return new s9c(parcel, null);
            default:
                return new eve(parcel, null);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new ejc[i];
            case 1:
                return new vv0[i];
            case 2:
                return new tj7[i];
            case 3:
                return new s9c[i];
            default:
                return new eve[i];
        }
    }

    @Override // android.os.Parcelable.ClassLoaderCreator
    public final Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
        switch (this.a) {
            case 0:
                return a(parcel, classLoader);
            case 1:
                return new vv0(parcel, classLoader);
            case 2:
                return new tj7(parcel, classLoader);
            case 3:
                return new s9c(parcel, classLoader);
            default:
                return new eve(parcel, classLoader);
        }
    }
}
