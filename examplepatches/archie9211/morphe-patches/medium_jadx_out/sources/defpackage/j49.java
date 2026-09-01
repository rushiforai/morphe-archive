package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.admin.stagebranch.uG.peNPu;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class j49 implements Parcelable.ClassLoaderCreator {
    public final /* synthetic */ int a;

    public /* synthetic */ j49(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.ClassLoaderCreator
    public final Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
        switch (this.a) {
            case 0:
                return a(parcel, classLoader);
            case 1:
                if (parcel.readParcelable(classLoader) == null) {
                    return w.b;
                }
                ygf.f("superState must be null");
                return null;
            case 2:
                return new ia2(parcel, classLoader);
            case 3:
                return new bya(parcel, classLoader);
            default:
                return new xnd(parcel, classLoader);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new k49[i];
            case 1:
                return new w[i];
            case 2:
                return new ia2[i];
            case 3:
                return new bya[i];
            default:
                return new xnd[i];
        }
    }

    public static k49 a(Parcel parcel, ClassLoader classLoader) {
        ajc ajcVar;
        if (classLoader == null) {
            classLoader = j49.class.getClassLoader();
        }
        Object value = parcel.readValue(classLoader);
        int i = parcel.readInt();
        if (i == 0) {
            ajcVar = y3b.h;
        } else if (i == 1) {
            ajcVar = xsa.h;
        } else {
            if (i != 2) {
                ygf.f(ev6.w(peNPu.gItvUOIwIpNgch, i, " was restored"));
                return null;
            }
            ajcVar = uob.g;
        }
        return new k49(value, ajcVar);
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.a) {
            case 0:
                return a(parcel, null);
            case 1:
                if (parcel.readParcelable(null) == null) {
                    return w.b;
                }
                ygf.f("superState must be null");
                return null;
            case 2:
                return new ia2(parcel, null);
            case 3:
                return new bya(parcel, null);
            default:
                return new xnd(parcel, null);
        }
    }
}
